package cn.shop.order.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

import cn.shop.cart2.service.CartItemService;
import cn.shop.cart2.service.CartService;
import cn.shop.cart2.vo.Cart;
import cn.shop.cart2.vo.CartItem;
import cn.shop.order.service.OrderService;
import cn.shop.order.vo.Order;
import cn.shop.order.vo.OrderItem;
import cn.shop.product.service.ProductService;
import cn.shop.product.vo.Product;
import cn.shop.user.vo.User;
import cn.shop.utils.PageBean;
import cn.shop.utils.PaymentUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 订单的action层
 * @author Administrator
 *
 */
public class OrderAction extends ActionSupport implements ModelDriven<Order> {

	//实现模型驱动的对象
	private Order order=new Order();
	//注入orderService
	private OrderService orderService;
	//接收page
    private Integer page;
    //接收支付通道编码
    private String pd_FrpId;
   //接收付款成功后的返回信息
    private String r3_Amt;
    //接收付款成功后的订单编号
    private String r6_Order;
    
    //注入商品service
    private ProductService productService;
    
    public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	//注入cartItemService
    private CartItemService cartItemService;
    
    //注入cartService
    private CartService cartService;         
    
	public void setCartItemService(CartItemService cartItemService) {
		this.cartItemService = cartItemService;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	public void setR6_Order(String r6Order) {
		r6_Order = r6Order;
	}
	public void setR3_Amt(String r3Amt) {
		r3_Amt = r3Amt;
	}
	public void setPd_FrpId(String pdFrpId) {
		pd_FrpId = pdFrpId;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public Order getModel() {
		return order;
	}
	
	//跳转到提交订单的页面
	public String save(){
		//保存订单到数据库
	     //订单时间
	     order.setOrdertime(new Date());
	     //订单状态，1：未付款  2：付款没有发货  3：已经发货，但是没有确认收货  4：交易成功
	     order.setState(1);
	     //订单的用户
	     User user=(User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
	     
	     if(user == null){
	    	 this.addActionError("亲！您还没有登录，请前往登录");
	    	 return "login";
	     }
	     order.setUser(user);   
	     //订单数量
	     Cart cart = (Cart) ServletActionContext.getRequest().getSession().getAttribute("cart");
	    if (cart == null) {
		   this.addActionMessage("亲!您还没有购物!");
		   return "msg";
	    }
	    order.setTotal(cart.getTotal());  
	    order.setAddr(user.getAddr());
	    order.setName(user.getName());
	    order.setPhone(user.getPhone());   
	    order.setOrdernumber(getOrderNumber());
	   
	     //设置订单项
	     //cart.getCartItems():得到所有的购物项信息
	     for(CartItem cartItem : cart.getCartItems()){
	    	 OrderItem orderItem=new OrderItem();  
	    	 //订单项的数量等于购物项的数量
	    	 orderItem.setCount(cartItem.getNumber());  
	    	 //订单项的小计等于购物项的小计
	    	 orderItem.setSubtotal(cartItem.getSubtotal());
	    	 //订单项的商品信息等于购物项的商品信息
	    	 orderItem.setProduct(cartItem.getProduct());
	    	 orderItem.setOrder(order);  
	    	 orderItem.setUser(user);  
	    	 order.getOrderItems().add(orderItem);
	    	 
	    	 //更新商品的库存数量
	    	 Product updateProduct = productService.findByPid(cartItem.getProduct().getPid());   
	    	 updateProduct.setNum(updateProduct.getNum()-cartItem.getNumber());
	    	 productService.update(updateProduct);       	 
	     }
		 orderService.save(order);  //保存订单，级联保存订单项
		 /**
		  * 清空购物车   
		  */
		List<CartItem> list = cartItemService.findListByCartId(cart.getId());//同过购物车id查询购物项
		if(list != null && list.size()>0){
			for(int i=0;i<list.size();i++){   //遍历删除所有 的购物项   
				cartItemService.delete(list.get(i));        
			}
		}
		cart.setTotal(0);         //购物车的总计置为0  
		cartService.update(cart); //更新购物车
		//订单信息显示在页面上
		 //清空购物车
		return "save";   
	}
	
	//生成一个日期格式：年月日+6位随机数
	public String getOrderNumber() {
		 Date currentTime = new Date();
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		 String dateString = formatter.format(currentTime);	
		 for(int i=0;i<6;i++){
			 Random rand = new Random();
			 int randNum = rand.nextInt(10);
			 dateString =dateString +randNum+"";
		 }
		return dateString;
	}
	//查询我的订单的方法
	public String findByUid(){
		//根据用户ID查询订单
        User user=(User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
        PageBean<Order> pageBean=orderService.findByPageUid(user.getUid(),page);
        //保存到值栈中
        ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByUidSuccess";
	}
	
	//根据订单id查询订单
	public String findByOid(){
		order=orderService.findByOid(order.getOid());
		return "findByOidSuccess";
	}

	//提交订单到银行
	public String payOrder() throws IOException{
		//更新订单数据库
		Order currOrder=orderService.findByOid(order.getOid());
		currOrder.setAddr(order.getAddr());
		currOrder.setName(order.getName());
		currOrder.setPhone(order.getPhone());
		orderService.update(currOrder);
		//为订单付款
		String p0_Cmd="Buy";          //业务类型
		String p1_MerId="10001126856";//商户编号
		String p2_Order="66661236995511199990000"+randomNumber();           //商户订单号     
		String p3_Amt="0.01";//支付金额
		String p4_Cur="CNY";//交易币种
		String p5_Pid="";//商品名称
		String p6_Pcat="";//商品种类
		String p7_Pdesc="";//商品描述
		String p8_Url="http://localhost:8080/shop/order_callBack.action?oid="+order.getOid();//商户接收支付成功数据的地址
		String p9_SAF="";//送货地址
		String pa_MP="";//商户扩展信息
		String pd_FrpId=this.pd_FrpId;// 支付通道编码
		String pr_NeedResponse="1";//应答机制
		String keyValue="69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";//秘钥
		String hmac=PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);//签名数据
		
		//向易宝出发
		StringBuffer buffer=new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
		buffer.append("p0_Cmd=").append(p0_Cmd).append("&");
		buffer.append("p1_MerId=").append(p1_MerId).append("&");
		buffer.append("p2_Order=").append(p2_Order).append("&");
		buffer.append("p3_Amt=").append(p3_Amt).append("&");
		buffer.append("p4_Cur=").append(p4_Cur).append("&");
		buffer.append("p5_Pid=").append(p5_Pid).append("&");
		buffer.append("p6_Pcat=").append(p6_Pcat).append("&");
		buffer.append("p7_Pdesc=").append(p7_Pdesc).append("&");
		buffer.append("p8_Url=").append(p8_Url).append("&");
		buffer.append("p9_SAF=").append(p9_SAF).append("&");
		buffer.append("pa_MP=").append(pa_MP).append("&");
		buffer.append("pd_FrpId=").append(pd_FrpId).append("&");
		buffer.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
		buffer.append("hmac=").append(hmac);
		//重定向到易宝
		ServletActionContext.getResponse().sendRedirect(buffer.toString());
	    return NONE;
	}
	
	//付款成功跳转到的页面
	public String callBack(){
		Order currOrder=orderService.findByOid(order.getOid());
		//更改订单状态为已经付款
		currOrder.setState(2);
		orderService.update(currOrder);
		//在输出页面显示的信息
		this.addActionMessage("付款成功！订单编号："+r6_Order+ ",订单金额："+r3_Amt);
		return "msg";
	}
	
	//修改订单状态的方法
	public String updateState(){
		//根据订单id查询订单
		order=orderService.findByOid(order.getOid());
		//设置订单的状态
		order.setState(4);
		//保存订单的状态
		orderService.update(order);
		return "updateStateSuccess";
	}
	
	public String returnProduct(){
		//根据订单id查询订单
		order=orderService.findByOid(order.getOid());
		//设置订单的状态
		order.setState(5);
		//保存订单的状态
		orderService.update(order);
		return "updateStateSuccess";
	}
	
	//生成6位随机数的方法
	public  String randomNumber(){
		Random random = new Random();
		String randomNumber = "";
		for(int i=0;i<6;i++){
			randomNumber += random.nextInt(10);
		}
		return randomNumber; 
	}
	
}



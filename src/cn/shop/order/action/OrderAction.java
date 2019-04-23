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
 * ������action��
 * @author Administrator
 *
 */
public class OrderAction extends ActionSupport implements ModelDriven<Order> {

	//ʵ��ģ�������Ķ���
	private Order order=new Order();
	//ע��orderService
	private OrderService orderService;
	//����page
    private Integer page;
    //����֧��ͨ������
    private String pd_FrpId;
   //���ո���ɹ���ķ�����Ϣ
    private String r3_Amt;
    //���ո���ɹ���Ķ������
    private String r6_Order;
    
    //ע����Ʒservice
    private ProductService productService;
    
    public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	//ע��cartItemService
    private CartItemService cartItemService;
    
    //ע��cartService
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
	
	//��ת���ύ������ҳ��
	public String save(){
		//���涩�������ݿ�
	     //����ʱ��
	     order.setOrdertime(new Date());
	     //����״̬��1��δ����  2������û�з���  3���Ѿ�����������û��ȷ���ջ�  4�����׳ɹ�
	     order.setState(1);
	     //�������û�
	     User user=(User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
	     
	     if(user == null){
	    	 this.addActionError("�ף�����û�е�¼����ǰ����¼");
	    	 return "login";
	     }
	     order.setUser(user);   
	     //��������
	     Cart cart = (Cart) ServletActionContext.getRequest().getSession().getAttribute("cart");
	    if (cart == null) {
		   this.addActionMessage("��!����û�й���!");
		   return "msg";
	    }
	    order.setTotal(cart.getTotal());  
	    order.setAddr(user.getAddr());
	    order.setName(user.getName());
	    order.setPhone(user.getPhone());   
	    order.setOrdernumber(getOrderNumber());
	   
	     //���ö�����
	     //cart.getCartItems():�õ����еĹ�������Ϣ
	     for(CartItem cartItem : cart.getCartItems()){
	    	 OrderItem orderItem=new OrderItem();  
	    	 //��������������ڹ����������
	    	 orderItem.setCount(cartItem.getNumber());  
	    	 //�������С�Ƶ��ڹ������С��
	    	 orderItem.setSubtotal(cartItem.getSubtotal());
	    	 //���������Ʒ��Ϣ���ڹ��������Ʒ��Ϣ
	    	 orderItem.setProduct(cartItem.getProduct());
	    	 orderItem.setOrder(order);  
	    	 orderItem.setUser(user);  
	    	 order.getOrderItems().add(orderItem);
	    	 
	    	 //������Ʒ�Ŀ������
	    	 Product updateProduct = productService.findByPid(cartItem.getProduct().getPid());   
	    	 updateProduct.setNum(updateProduct.getNum()-cartItem.getNumber());
	    	 productService.update(updateProduct);       	 
	     }
		 orderService.save(order);  //���涩�����������涩����
		 /**
		  * ��չ��ﳵ   
		  */
		List<CartItem> list = cartItemService.findListByCartId(cart.getId());//ͬ�����ﳵid��ѯ������
		if(list != null && list.size()>0){
			for(int i=0;i<list.size();i++){   //����ɾ������ �Ĺ�����   
				cartItemService.delete(list.get(i));        
			}
		}
		cart.setTotal(0);         //���ﳵ���ܼ���Ϊ0  
		cartService.update(cart); //���¹��ﳵ
		//������Ϣ��ʾ��ҳ����
		 //��չ��ﳵ
		return "save";   
	}
	
	//����һ�����ڸ�ʽ��������+6λ�����
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
	//��ѯ�ҵĶ����ķ���
	public String findByUid(){
		//�����û�ID��ѯ����
        User user=(User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
        PageBean<Order> pageBean=orderService.findByPageUid(user.getUid(),page);
        //���浽ֵջ��
        ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByUidSuccess";
	}
	
	//���ݶ���id��ѯ����
	public String findByOid(){
		order=orderService.findByOid(order.getOid());
		return "findByOidSuccess";
	}

	//�ύ����������
	public String payOrder() throws IOException{
		//���¶������ݿ�
		Order currOrder=orderService.findByOid(order.getOid());
		currOrder.setAddr(order.getAddr());
		currOrder.setName(order.getName());
		currOrder.setPhone(order.getPhone());
		orderService.update(currOrder);
		//Ϊ��������
		String p0_Cmd="Buy";          //ҵ������
		String p1_MerId="10001126856";//�̻����
		String p2_Order="66661236995511199990000"+randomNumber();           //�̻�������     
		String p3_Amt="0.01";//֧�����
		String p4_Cur="CNY";//���ױ���
		String p5_Pid="";//��Ʒ����
		String p6_Pcat="";//��Ʒ����
		String p7_Pdesc="";//��Ʒ����
		String p8_Url="http://localhost:8080/shop/order_callBack.action?oid="+order.getOid();//�̻�����֧���ɹ����ݵĵ�ַ
		String p9_SAF="";//�ͻ���ַ
		String pa_MP="";//�̻���չ��Ϣ
		String pd_FrpId=this.pd_FrpId;// ֧��ͨ������
		String pr_NeedResponse="1";//Ӧ�����
		String keyValue="69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";//��Կ
		String hmac=PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);//ǩ������
		
		//���ױ�����
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
		//�ض����ױ�
		ServletActionContext.getResponse().sendRedirect(buffer.toString());
	    return NONE;
	}
	
	//����ɹ���ת����ҳ��
	public String callBack(){
		Order currOrder=orderService.findByOid(order.getOid());
		//���Ķ���״̬Ϊ�Ѿ�����
		currOrder.setState(2);
		orderService.update(currOrder);
		//�����ҳ����ʾ����Ϣ
		this.addActionMessage("����ɹ���������ţ�"+r6_Order+ ",������"+r3_Amt);
		return "msg";
	}
	
	//�޸Ķ���״̬�ķ���
	public String updateState(){
		//���ݶ���id��ѯ����
		order=orderService.findByOid(order.getOid());
		//���ö�����״̬
		order.setState(4);
		//���涩����״̬
		orderService.update(order);
		return "updateStateSuccess";
	}
	
	public String returnProduct(){
		//���ݶ���id��ѯ����
		order=orderService.findByOid(order.getOid());
		//���ö�����״̬
		order.setState(5);
		//���涩����״̬
		orderService.update(order);
		return "updateStateSuccess";
	}
	
	//����6λ������ķ���
	public  String randomNumber(){
		Random random = new Random();
		String randomNumber = "";
		for(int i=0;i<6;i++){
			randomNumber += random.nextInt(10);
		}
		return randomNumber; 
	}
	
}



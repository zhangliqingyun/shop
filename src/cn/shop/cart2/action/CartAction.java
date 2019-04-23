package cn.shop.cart2.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.shop.cart2.service.CartItemService;
import cn.shop.cart2.service.CartService;
import cn.shop.cart2.vo.Cart;
import cn.shop.cart2.vo.CartItem;
import cn.shop.product.service.ProductService;
import cn.shop.product.vo.Product;
import cn.shop.user.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 购物车的action层
 * @author 张立增
 *
 */
public class CartAction extends ActionSupport implements ModelDriven<Cart> {

	//注入模型驱动需要的类
	private Cart cart = new Cart();
	
	//注入service
	private CartService cartService;
	
	//接收传过来的pid
	private Integer pid;
    
	//接收传过来的count
	private Integer count;  
	
	//注入productService
	private ProductService productService;

	//注入cartItemService
	private CartItemService cartItemService;  
	
	public void setCartItemService(CartItemService cartItemService) {
		this.cartItemService = cartItemService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public Cart getModel() {
		return cart;
	}
	
	//清空购物车的方法
	public String clearCart(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser"); //取出登录用户    
		Cart cart = cartService.findByUserId(user.getUid()); 	     //根据用户id查询出购物车
		List<CartItem> list = cartItemService.findListByCartId(cart.getId());//同过购物车id查询购物项
		if(list != null && list.size()>0){
			for(int i=0;i<list.size();i++){   //遍历删除所有 的购物项   
				cartItemService.delete(list.get(i));        
			}
		}
		cart.setTotal(0);         //购物车的总计置为0  
		cartService.update(cart); //更新购物车
		return "clearCartSuccess";   
	}   
	
	//展示购物车中所有的购物项的方法
	public  String list(){
		/**
		 *通过登录用户取出自己的购物车，在通过购物车取出购物项
		 */
		//取出登录用户
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");   
		//根据登录用户Id查询购物车   
		cart = cartService.findByUserId(user.getUid()); 
		if(cart == null){     //没有购物车则创建一个购物车
			cart = new Cart();
			cart.setUser(user);
			cart.setTotal(0);  
			cartService.save(cart);  //保存购物车的方法
		}
		cart = cartService.findByUserId(user.getUid());  
		List<CartItem> cartItemList = cartItemService.findListByCartId(cart.getId());   //通过购物车Id取出购物项
		ActionContext.getContext().put("cartItemList", cartItemList);
		ServletActionContext.getRequest().getSession().setAttribute("cart", cart);     
		return "list";
	}
	//添加购物车的 方法
	public String addCart(){
		Product product = productService.findByPid(pid);  
		//取出登录用户
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");   
		//根据登录用户Id查询购物车
		cart = cartService.findByUserId(user.getUid());   
		if(cart ==null){     //购物车不存在则创建一个
			cart = new Cart();
			cart.setUser(user);
			cart.setTotal(count*product.getShop_price());  
			cartService.save(cart);  //保存购物车的方法
			
			//添加一个购物项
			CartItem cartItem = new CartItem();
			cartItem.setCart(cart);
			cartItem.setNumber(count);
			cartItem.setProduct(product);
			cartItem.setSubtotal(count*product.getShop_price());
			cartItemService.save(cartItem);       //保存购物项   
			ServletActionContext.getRequest().getSession().setAttribute("cartItem", cartItem);
		}else{
			CartItem cartItem = cartItemService.findByPid(pid,cart.getId());  //通过商品id和购物车id查询购物项 
			if(cartItem == null){
				cartItem = new CartItem();  
				cartItem.setNumber(count);           //购物项数量
				cartItem.setSubtotal(count*product.getShop_price()); //购物项小计 
				cartItem.setProduct(product);        //购物项的商品  
				cartItem.setCart(cart);
				cartItemService.save(cartItem);       //保存购物项     
			}else{
				cartItem.setNumber(count+cartItem.getNumber());      //购物项数量=之前的数量+现在的数量
				cartItem.setSubtotal(count*product.getShop_price()+cartItem.getSubtotal()); //购物项小计 
				cartItemService.update(cartItem);   //更新购物项
			}
			 cart.setTotal(cart.getTotal()+count*product.getShop_price()); //购物车的总计
			 cartService.update(cart);   //更新购物车  
			 ServletActionContext.getRequest().getSession().setAttribute("cartItem", cartItem);
		}
		ServletActionContext.getRequest().getSession().setAttribute("product", product);
		Integer cartitemnumber = cartItemService.findCount(cart.getId());   //通过购物车Id查询有多少购物项
		ServletActionContext.getRequest().getSession().setAttribute("cartitemnumber", cartitemnumber);
		
		return "addCartSuccess";   
	}

}

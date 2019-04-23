package cn.shop.cart.action;

import org.apache.struts2.ServletActionContext;

import cn.shop.cart.vo.Cart;
import cn.shop.cart.vo.CartItem;
import cn.shop.product.service.ProductService;
import cn.shop.product.vo.Product;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 
 * 购物车
 */
public class CartAction extends ActionSupport{
    //接收页面提交的pid
	private Integer pid;
	//接收页面提交的count
	private Integer count;
	//注入productService
	private ProductService productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	//添加商品到购物车
	public String addCart(){
		//创建购物项对象
		CartItem cartItem=new CartItem();
		//添加购物项的商品信息
		//根据pid查询商品信息
		Product product=productService.findByPid(pid);
		cartItem.setProduct(product);
		//添加购物项的数量
		cartItem.setCount(count);
		//将购物项添加到购物车
		Cart cart=getCart();
		cart.addCart(cartItem);
		return "addCart";
	}

	//清空购物车的方法
	public String clearCart(){
		Cart cart=getCart();
		cart.clearCart();
		return "clearCart";
	}
	
	//删除一项购物项
	public String deleteCart(){
		Cart cart=getCart();
		cart.removeCart(pid);
		return "deleteCart";
	}
	
	//跳转到购物车
	public String myCart(){
		return "myCart";
	}
	
	//得到购物车的方法
	private Cart getCart() {
		Cart cart=(Cart)ServletActionContext.getRequest().getSession().getAttribute("cart");
		if(cart ==null){
			cart=new Cart();
			ServletActionContext.getRequest().getSession().setAttribute("cart",cart);
		}
		return cart;
	}
}

package cn.shop.cart2.action;

import cn.shop.cart2.service.CartItemService;
import cn.shop.cart2.service.CartService;
import cn.shop.cart2.vo.Cart;
import cn.shop.cart2.vo.CartItem;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 购物项的action层
 * @author 张立增
 *
 */
public class CartItemAction extends ActionSupport implements ModelDriven<CartItem> {

	//注入模型驱动需要的实体类
	private CartItem cartItem = new CartItem();
	
	//注入cartItemService
	private CartItemService cartItemService;
	
	//注入CartService
	private CartService cartService;   
	
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public void setCartItemService(CartItemService cartItemService) {
		this.cartItemService = cartItemService;
	}

	public CartItem getModel() {
		return cartItem;   
	}
	
	//删除购物项的方法
	public String delete(){          
		cartItem = cartItemService.findById(cartItem.getId());  //同过id查询购物项
		Cart cart = cartService.findByCartId(cartItem.getCart().getId());  //通过购物车id查询购物车
		cart.setTotal(cart.getTotal()-cartItem.getSubtotal());   //更新购物车的总计   
		cartService.update(cart);                              //更新购物车     
		cartItemService.delete(cartItem);  //删除购物项
		return "deleteSuccess"; 
	}
	

}

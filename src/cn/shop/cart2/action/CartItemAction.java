package cn.shop.cart2.action;

import cn.shop.cart2.service.CartItemService;
import cn.shop.cart2.service.CartService;
import cn.shop.cart2.vo.Cart;
import cn.shop.cart2.vo.CartItem;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * �������action��
 * @author ������
 *
 */
public class CartItemAction extends ActionSupport implements ModelDriven<CartItem> {

	//ע��ģ��������Ҫ��ʵ����
	private CartItem cartItem = new CartItem();
	
	//ע��cartItemService
	private CartItemService cartItemService;
	
	//ע��CartService
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
	
	//ɾ��������ķ���
	public String delete(){          
		cartItem = cartItemService.findById(cartItem.getId());  //ͬ��id��ѯ������
		Cart cart = cartService.findByCartId(cartItem.getCart().getId());  //ͨ�����ﳵid��ѯ���ﳵ
		cart.setTotal(cart.getTotal()-cartItem.getSubtotal());   //���¹��ﳵ���ܼ�   
		cartService.update(cart);                              //���¹��ﳵ     
		cartItemService.delete(cartItem);  //ɾ��������
		return "deleteSuccess"; 
	}
	

}

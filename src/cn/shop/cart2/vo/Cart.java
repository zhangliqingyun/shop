package cn.shop.cart2.vo;

import java.util.HashSet;
import java.util.Set;

import cn.shop.user.vo.User;

/**
 * ���ﳵʵ����
 * @author ������
 *
 */
public class Cart {
   private  Integer id;    //����id
   private  double total;  //���ﳵ���ܼ�
   private User user;      //���ﳵ���û�Ϊһ��һ��ϵ
   private Set<CartItem> cartItems = new HashSet<CartItem>();
   
   
	public Set<CartItem> getCartItems() {
	    return cartItems;
    }
    public void setCartItems(Set<CartItem> cartItems) {
	    this.cartItems = cartItems;
    }
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	   
   
}

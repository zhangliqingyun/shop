package cn.shop.cart2.vo;

import java.util.HashSet;
import java.util.Set;

import cn.shop.user.vo.User;

/**
 * 购物车实体类
 * @author 张立增
 *
 */
public class Cart {
   private  Integer id;    //主键id
   private  double total;  //购物车的总计
   private User user;      //购物车和用户为一对一关系
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

package cn.shop.cart2.vo;

import cn.shop.product.vo.Product;

/**
 * 购物项实体类
 * @author 张立增
 *
 */
public class CartItem {

	private Integer id;        //主键
	private Product product;   //购物项和商品为一对一关系   
	private double subtotal;   //小计
	private Integer number;    //数量  
	private Cart cart;         //购物项和购物车为多对一关系  
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	
	
	
}

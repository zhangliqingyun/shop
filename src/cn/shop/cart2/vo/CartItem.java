package cn.shop.cart2.vo;

import cn.shop.product.vo.Product;

/**
 * ������ʵ����
 * @author ������
 *
 */
public class CartItem {

	private Integer id;        //����
	private Product product;   //���������ƷΪһ��һ��ϵ   
	private double subtotal;   //С��
	private Integer number;    //����  
	private Cart cart;         //������͹��ﳵΪ���һ��ϵ  
	
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

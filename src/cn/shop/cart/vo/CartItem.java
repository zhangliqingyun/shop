package cn.shop.cart.vo;

import cn.shop.product.vo.Product;

/*
 * 
 * ��װһ����������
 */
public class CartItem {

	//������Ʒ����Ϣ
	private Product product;
	//������Ʒ������
	private int count;
	//������Ʒ��С��
	private double subtotal;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	//С���Զ�����
	public double getSubtotal() {
		return count*product.getShop_price();
	}
	
}

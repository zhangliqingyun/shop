package cn.shop.cart.vo;

import cn.shop.product.vo.Product;

/*
 * 
 * 封装一个购物项类
 */
public class CartItem {

	//购买商品的信息
	private Product product;
	//购买商品的数量
	private int count;
	//购买商品的小计
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
	//小计自动计算
	public double getSubtotal() {
		return count*product.getShop_price();
	}
	
}

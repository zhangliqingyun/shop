package cn.shop.comments.vo;

import java.util.Date;

import cn.shop.product.vo.Product;
import cn.shop.user.vo.User;

/**
 * 评论的实体类
 * @author 张立增
 *
 */
public class Comments {

	private Integer id;
	private String content;
	private String cdate;
	private Product product;   //评论与商品的多对一
	private User user;         //评论与用户的多对一  
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}

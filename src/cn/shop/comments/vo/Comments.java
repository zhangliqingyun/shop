package cn.shop.comments.vo;

import java.util.Date;

import cn.shop.product.vo.Product;
import cn.shop.user.vo.User;

/**
 * ���۵�ʵ����
 * @author ������
 *
 */
public class Comments {

	private Integer id;
	private String content;
	private String cdate;
	private Product product;   //��������Ʒ�Ķ��һ
	private User user;         //�������û��Ķ��һ  
	
	
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

package cn.shop.returnmessage.vo;

import java.util.Date;

/**
 * 反馈信息类
 * @author 张立增
 *
 */
public class ReturnMessage {

	private int id;
	private String content;
	private Date returndate;
	private String contact;
	
	
	    
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReturndate() {
		return returndate;
	}
	public void setReturndate(Date returndate) {
		this.returndate = returndate;
	}
	
	
}

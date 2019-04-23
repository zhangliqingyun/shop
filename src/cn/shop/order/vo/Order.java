package cn.shop.order.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.shop.user.vo.User;

/**
 * ������ʵ�����
 * @author Administrator
 *
 */
public class Order {
     private Integer oid;
     private double total;   //����С��
     private Date ordertime; //����ʱ��
     private Integer state;  //����״̬
     private String name;    //�����ջ�������
     private String addr;    //�����ջ��� ��ַ
     private String phone;   //�����ջ��� �绰
     private String ordernumber; //�������
     
     //�û������uid
     private User user;      //�����漰�����û�id
     //�����ж������
     private Set<OrderItem> orderItems=new HashSet<OrderItem>();//�����漰���Ķ�������Ϣ
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}

	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}

	
	
}

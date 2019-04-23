package cn.shop.order.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.shop.user.vo.User;

/**
 * 订单的实体对象
 * @author Administrator
 *
 */
public class Order {
     private Integer oid;
     private double total;   //订单小计
     private Date ordertime; //订单时间
     private Integer state;  //订单状态
     private String name;    //订单收货人姓名
     private String addr;    //订单收货人 地址
     private String phone;   //订单收货人 电话
     private String ordernumber; //订单编号
     
     //用户对象的uid
     private User user;      //订单涉及到的用户id
     //订单中订单项集合
     private Set<OrderItem> orderItems=new HashSet<OrderItem>();//订单涉及到的订单项信息
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

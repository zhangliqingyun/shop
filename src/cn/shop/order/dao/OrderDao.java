package cn.shop.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.order.vo.Order;
import cn.shop.order.vo.OrderItem;
import cn.shop.utils.PageHibernateCallback;

/*
 * 
 * 订单的dao层
 */
public class OrderDao extends HibernateDaoSupport {

	//保存订单信息到数据库
	public void save(Order order) {
		this.getHibernateTemplate().save(order);
	}

	//dao层根据用户id查询订单数量
	public Integer findByUid(Integer uid) {
		String hql="select count(*) from Order o where o.user.uid=?";
		List<Long> list=this.getHibernateTemplate().find(hql,uid);
		if(list !=null && list.size()>0){
			return list.get(0).intValue();
		}
		return null;
	}

	//根据ID查询订单信息
	public List<Order> findByPageUid(Integer uid, int begin, Integer page) {
		String hql=" from Order o where o.user.uid=? order by ordertime desc";
		List<Order> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, new Object[]{uid}, begin, page));
		return list;
	}

	//根据订单号查询订单
	public Order findByOid(Integer oid) {
		return this.getHibernateTemplate().get(Order.class, oid);
	}

	//dao层更新订单
	public void update(Order currOrder) {
		this.getHibernateTemplate().update(currOrder);
	}

	//查询订单的数量
	public int findCount() {
		String hql="select count(*) from Order";
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//根据页数查询订单信息
	public List<Order> findByPage(int begin, int limit) {
		String hql=" from Order order by ordertime desc";
		List<Order> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, null,begin, limit));
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}

	//根据订单id查询订单项
	public List<OrderItem> findOrderItem(Integer oid) {
		String hql=" from OrderItem oi where oi.order.oid=?";
		List<OrderItem> list=this.getHibernateTemplate().find(hql,oid);
		if(list !=null && list.size()>0){
			return list;
		}
		return null;
	}

}

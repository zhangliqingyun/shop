package cn.shop.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.order.vo.Order;
import cn.shop.order.vo.OrderItem;
import cn.shop.utils.PageHibernateCallback;

/*
 * 
 * ������dao��
 */
public class OrderDao extends HibernateDaoSupport {

	//���涩����Ϣ�����ݿ�
	public void save(Order order) {
		this.getHibernateTemplate().save(order);
	}

	//dao������û�id��ѯ��������
	public Integer findByUid(Integer uid) {
		String hql="select count(*) from Order o where o.user.uid=?";
		List<Long> list=this.getHibernateTemplate().find(hql,uid);
		if(list !=null && list.size()>0){
			return list.get(0).intValue();
		}
		return null;
	}

	//����ID��ѯ������Ϣ
	public List<Order> findByPageUid(Integer uid, int begin, Integer page) {
		String hql=" from Order o where o.user.uid=? order by ordertime desc";
		List<Order> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, new Object[]{uid}, begin, page));
		return list;
	}

	//���ݶ����Ų�ѯ����
	public Order findByOid(Integer oid) {
		return this.getHibernateTemplate().get(Order.class, oid);
	}

	//dao����¶���
	public void update(Order currOrder) {
		this.getHibernateTemplate().update(currOrder);
	}

	//��ѯ����������
	public int findCount() {
		String hql="select count(*) from Order";
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//����ҳ����ѯ������Ϣ
	public List<Order> findByPage(int begin, int limit) {
		String hql=" from Order order by ordertime desc";
		List<Order> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, null,begin, limit));
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}

	//���ݶ���id��ѯ������
	public List<OrderItem> findOrderItem(Integer oid) {
		String hql=" from OrderItem oi where oi.order.oid=?";
		List<OrderItem> list=this.getHibernateTemplate().find(hql,oid);
		if(list !=null && list.size()>0){
			return list;
		}
		return null;
	}

}

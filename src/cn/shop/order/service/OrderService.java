package cn.shop.order.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.order.dao.OrderDao;
import cn.shop.order.vo.Order;
import cn.shop.order.vo.OrderItem;
import cn.shop.utils.PageBean;

/*
 * 
 * ������ҵ���
 */
@Transactional
public class OrderService {

	//ע��orderDao
	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	//���涩�������ݿ�
	public void save(Order order) {
		orderDao.save(order);
	}

	//�����û�ID��ѯ����
	public PageBean<Order> findByPageUid(Integer uid, Integer page) {
		PageBean<Order> pageBean=new PageBean<Order>();
		//���õ�ǰҳ��
		pageBean.setPage(page);
		//ÿҳ��ʾ��¼����
		int limit=5;
		pageBean.setLimit(limit);
		//����������
		Integer totalCount=null;
		totalCount=orderDao.findByUid(uid);
		pageBean.setTotalCount(totalCount);
		//��ҳ��
		Integer totalPage=null;
		if(totalCount % limit ==0){
			totalPage=totalCount/limit;
		}else{
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//ÿҳ��ʾ���ݵļ�¼����
		int begin=(page-1)*limit;
		List<Order> list=orderDao.findByPageUid(uid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//ҵ�����ݶ���id��ѯ����
	public Order findByOid(Integer oid) {
		return orderDao.findByOid(oid);
	}

	//���¶�����
	public void update(Order currOrder) {
		orderDao.update(currOrder);
	}

	//����ҳ�������еĶ���
	public PageBean<Order> findAll(Integer page) {
	    PageBean<Order> pageBean=new PageBean<Order>();
	    //���õ�ǰҳ
	    pageBean.setPage(page);
	    //����ÿҳ��ʾ�ļ�¼����
	    int limit=10;
	    pageBean.setLimit(limit);
	    //�ܵļ�¼��
	    int totalCount=0;
	    totalCount=orderDao.findCount();
	    pageBean.setTotalCount(totalCount);
	    //�ܵ�ҳ��
	    int totalPage=0;
	    if(totalCount % limit ==0){
	    	totalPage=totalCount/limit;
	    }else{
	    	totalPage=totalCount/limit+1;
	    }
	    pageBean.setTotalPage(totalPage);
	    //��ǰҳ��Ҫ��ʾ����Ϣ����
	    //��¼�Ŀ�ʼ����
	    int begin=(page - 1)*limit;
	    List<Order> list=orderDao.findByPage(begin, limit);
	    pageBean.setList(list);
		return pageBean;
	}

	//ҵ�����ݶ���id��ѯ������
	public List<OrderItem> findOrderItem(Integer oid) {
		return orderDao.findOrderItem(oid);
	}
}

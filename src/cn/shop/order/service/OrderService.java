package cn.shop.order.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.order.dao.OrderDao;
import cn.shop.order.vo.Order;
import cn.shop.order.vo.OrderItem;
import cn.shop.utils.PageBean;

/*
 * 
 * 订单的业务层
 */
@Transactional
public class OrderService {

	//注入orderDao
	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	//保存订单到数据库
	public void save(Order order) {
		orderDao.save(order);
	}

	//根据用户ID查询订单
	public PageBean<Order> findByPageUid(Integer uid, Integer page) {
		PageBean<Order> pageBean=new PageBean<Order>();
		//设置当前页数
		pageBean.setPage(page);
		//每页显示记录条数
		int limit=5;
		pageBean.setLimit(limit);
		//设置总条数
		Integer totalCount=null;
		totalCount=orderDao.findByUid(uid);
		pageBean.setTotalCount(totalCount);
		//总页数
		Integer totalPage=null;
		if(totalCount % limit ==0){
			totalPage=totalCount/limit;
		}else{
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//每页显示内容的记录集合
		int begin=(page-1)*limit;
		List<Order> list=orderDao.findByPageUid(uid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//业务层根据订单id查询订单
	public Order findByOid(Integer oid) {
		return orderDao.findByOid(oid);
	}

	//更新订单表
	public void update(Order currOrder) {
		orderDao.update(currOrder);
	}

	//带分页查找所有的订单
	public PageBean<Order> findAll(Integer page) {
	    PageBean<Order> pageBean=new PageBean<Order>();
	    //设置当前页
	    pageBean.setPage(page);
	    //设置每页显示的记录条数
	    int limit=10;
	    pageBean.setLimit(limit);
	    //总的记录数
	    int totalCount=0;
	    totalCount=orderDao.findCount();
	    pageBean.setTotalCount(totalCount);
	    //总的页数
	    int totalPage=0;
	    if(totalCount % limit ==0){
	    	totalPage=totalCount/limit;
	    }else{
	    	totalPage=totalCount/limit+1;
	    }
	    pageBean.setTotalPage(totalPage);
	    //当前页需要显示的信息集合
	    //记录的开始条数
	    int begin=(page - 1)*limit;
	    List<Order> list=orderDao.findByPage(begin, limit);
	    pageBean.setList(list);
		return pageBean;
	}

	//业务层根据订单id查询订单项
	public List<OrderItem> findOrderItem(Integer oid) {
		return orderDao.findOrderItem(oid);
	}
}

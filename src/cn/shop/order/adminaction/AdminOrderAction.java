package cn.shop.order.adminaction;

import java.util.List;

import cn.shop.order.service.OrderService;
import cn.shop.order.vo.Order;
import cn.shop.order.vo.OrderItem;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台管理订单的Action
 * @author Administrator
 *
 */
public class AdminOrderAction extends ActionSupport implements ModelDriven<Order>{
	//实现模型驱动接受的对象
	private Order order=new Order();
	//注入orderService
	private OrderService orderService;
	//接收page
	private Integer page;
	
	public void setPage(Integer page) {
		this.page = page;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public Order getModel() {
		return order;
	}
	
	//查找所有的订单带分页
	public String findAll(){
		//查询订单信息
		PageBean<Order> pageBean=orderService.findAll(page);
		//查询结果保存到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllSuccess";
	}
	
	//ajax异步查看订单详情的方法
	public String findOrderItem(){
		//根据订单id查询订单项
		List<OrderItem> list=orderService.findOrderItem(order.getOid());
		//查询到的订单项保存到值栈中
		ActionContext.getContext().getValueStack().set("list", list);
		return "findOrderItemSuccess";
	}
	
	//修改订单状态
	public String updateState(){
		//根据订单id查询订单
		order=orderService.findByOid(order.getOid());
		//修改订单状态
		order.setState(3);
		//更新订单状态
		orderService.update(order);
		return "updateStateSuccess";
	}
	
	//修改订单状态
	public String updateStateToFive(){
		//根据订单id查询订单
		order=orderService.findByOid(order.getOid());
		//修改订单状态
		order.setState(4);   
		//更新订单状态
		orderService.update(order);
		return "updateStateSuccess";
	}
	
	

}

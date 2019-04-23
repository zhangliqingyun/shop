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
 * ��̨��������Action
 * @author Administrator
 *
 */
public class AdminOrderAction extends ActionSupport implements ModelDriven<Order>{
	//ʵ��ģ���������ܵĶ���
	private Order order=new Order();
	//ע��orderService
	private OrderService orderService;
	//����page
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
	
	//�������еĶ�������ҳ
	public String findAll(){
		//��ѯ������Ϣ
		PageBean<Order> pageBean=orderService.findAll(page);
		//��ѯ������浽ֵջ��
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllSuccess";
	}
	
	//ajax�첽�鿴��������ķ���
	public String findOrderItem(){
		//���ݶ���id��ѯ������
		List<OrderItem> list=orderService.findOrderItem(order.getOid());
		//��ѯ���Ķ�����浽ֵջ��
		ActionContext.getContext().getValueStack().set("list", list);
		return "findOrderItemSuccess";
	}
	
	//�޸Ķ���״̬
	public String updateState(){
		//���ݶ���id��ѯ����
		order=orderService.findByOid(order.getOid());
		//�޸Ķ���״̬
		order.setState(3);
		//���¶���״̬
		orderService.update(order);
		return "updateStateSuccess";
	}
	
	//�޸Ķ���״̬
	public String updateStateToFive(){
		//���ݶ���id��ѯ����
		order=orderService.findByOid(order.getOid());
		//�޸Ķ���״̬
		order.setState(4);   
		//���¶���״̬
		orderService.update(order);
		return "updateStateSuccess";
	}
	
	

}

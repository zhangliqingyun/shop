package cn.shop.returnmessage.action;

import java.util.List;

import cn.shop.returnmessage.service.ReturnMessageService;
import cn.shop.returnmessage.vo.ReturnMessage;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * ��Ϣ������action
 * @author ������
 *
 */
public class ReturnMessageAction extends ActionSupport implements ModelDriven<ReturnMessage>{

	//ע��ģ������
	private ReturnMessage returnMessage = new ReturnMessage();
	
	//ע��ReturnMessageService
	private ReturnMessageService returnMessageService;
	
	//������ҳPage
	private Integer page;
	
	public void setPage(Integer page) {
		this.page = page;
	}

	public void setReturnMessageService(ReturnMessageService returnMessageService) {
		this.returnMessageService = returnMessageService;
	}

	public ReturnMessage getModel() {
		
		return returnMessage;
	}

	//��ת����ӷ�����Ϣ��ҳ��
	public String addpage(){
		
		return "addpage";
	}
	
	//��ӷ�����Ϣ�ķ���
	public String save(){
		//���淴����Ϣ
		returnMessageService.save(returnMessage.getContent(),returnMessage.getContact());
		return "save";
	}
	
	//��̨��ʾ���еķ�����Ϣ�ķ���
	public String list(){
		PageBean<ReturnMessage> pageBean = new PageBean<ReturnMessage>();
		//��ѯ���еķ�����Ϣ
		pageBean = returnMessageService.findAllReturnMessage(page);
		//���浽ֵջ��
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "list";
	}
}

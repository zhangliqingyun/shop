package cn.shop.returnmessage.action;

import java.util.List;

import cn.shop.returnmessage.service.ReturnMessageService;
import cn.shop.returnmessage.vo.ReturnMessage;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 信息反馈的action
 * @author 张立增
 *
 */
public class ReturnMessageAction extends ActionSupport implements ModelDriven<ReturnMessage>{

	//注入模型驱动
	private ReturnMessage returnMessage = new ReturnMessage();
	
	//注入ReturnMessageService
	private ReturnMessageService returnMessageService;
	
	//结束分页Page
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

	//跳转到添加反馈信息的页面
	public String addpage(){
		
		return "addpage";
	}
	
	//添加反馈信息的方法
	public String save(){
		//保存反馈信息
		returnMessageService.save(returnMessage.getContent(),returnMessage.getContact());
		return "save";
	}
	
	//后台显示所有的反馈信息的方法
	public String list(){
		PageBean<ReturnMessage> pageBean = new PageBean<ReturnMessage>();
		//查询所有的反馈信息
		pageBean = returnMessageService.findAllReturnMessage(page);
		//保存到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "list";
	}
}

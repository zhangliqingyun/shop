package cn.shop.convenience.action;

import cn.shop.convenience.service.ConvenienceService;
import cn.shop.convenience.vo.Convenience;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


/**
 * 便民信息action层
 * @author 张立增
 *
 */
public class ConvenienceAction extends ActionSupport implements ModelDriven<Convenience> {

	//实现模型驱动需要类
	private Convenience convenience = new Convenience();
	
	//注入ConvenienceService
	private ConvenienceService convenienceService; 

    private Integer page;
    
	public void setPage(Integer page) {
		this.page = page;
	}

	public void setConvenienceService(ConvenienceService convenienceService) {
		this.convenienceService = convenienceService;
	}

	public Convenience getModel() {
		return convenience;
	}
	
	//跳转到展示便民信息页面的方法
	public String show(){
		convenience = convenienceService.findById(convenience.getId());
		return "show";   
	}
	
	//保存便民信息的方法
	public String save(){
	   convenienceService.save(convenience);
	   return "saveSuccess";
	}
	
	//更新便民信息的方法
	public String update(){
		convenienceService.update(convenience);     
		return "updateSuccess";   
	}
	
	//根据id编辑编写信息的方法
	public String edit(){   
		convenience = convenienceService.findById(convenience.getId());   
		return "editSuccess";
	}
	
	//根据id删除便民信息的方法
	public String delete(){
		convenience = convenienceService.findById(convenience.getId());
		convenienceService.delete(convenience);
		return "deleteSuccess";
	}
	
	//便民信息集合
	public String list(){
		PageBean<Convenience> pageBean = new PageBean<Convenience>();
		pageBean = convenienceService.findListByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "list";
	}

	
}

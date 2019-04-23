package cn.shop.convenience.action;

import cn.shop.convenience.service.ConvenienceService;
import cn.shop.convenience.vo.Convenience;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


/**
 * ������Ϣaction��
 * @author ������
 *
 */
public class ConvenienceAction extends ActionSupport implements ModelDriven<Convenience> {

	//ʵ��ģ��������Ҫ��
	private Convenience convenience = new Convenience();
	
	//ע��ConvenienceService
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
	
	//��ת��չʾ������Ϣҳ��ķ���
	public String show(){
		convenience = convenienceService.findById(convenience.getId());
		return "show";   
	}
	
	//���������Ϣ�ķ���
	public String save(){
	   convenienceService.save(convenience);
	   return "saveSuccess";
	}
	
	//���±�����Ϣ�ķ���
	public String update(){
		convenienceService.update(convenience);     
		return "updateSuccess";   
	}
	
	//����id�༭��д��Ϣ�ķ���
	public String edit(){   
		convenience = convenienceService.findById(convenience.getId());   
		return "editSuccess";
	}
	
	//����idɾ��������Ϣ�ķ���
	public String delete(){
		convenience = convenienceService.findById(convenience.getId());
		convenienceService.delete(convenience);
		return "deleteSuccess";
	}
	
	//������Ϣ����
	public String list(){
		PageBean<Convenience> pageBean = new PageBean<Convenience>();
		pageBean = convenienceService.findListByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "list";
	}

	
}

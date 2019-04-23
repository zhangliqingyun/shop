package cn.shop.categorysecond.adminaction;

import java.util.List;

import cn.shop.category.service.CategoryService;
import cn.shop.category.vo.Category;
import cn.shop.categorysecond.service.CategorySecondService;
import cn.shop.categorysecond.vo.CategorySecond;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * ��̨���������action
 * @author Administrator
 *
 */
public class AdminCategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond>{
	//����ģ�������Ķ���
	private CategorySecond categorySecond=new CategorySecond();
	//ע��categorySecondService
	private CategorySecondService categorySecondService;
	//����page
	private Integer page;
	//ע��һ�������service
	private CategoryService categoryService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setCategorySecond(CategorySecond categorySecond) {
		this.categorySecond = categorySecond;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	public CategorySecond getModel() {
		return categorySecond;
	}

	//��ѯ���еĶ�������ķ���
	public String findAll(){
		PageBean<CategorySecond> pageBean=new PageBean<CategorySecond>();
		pageBean=categorySecondService.findAll(page);
		//��ѯ������浽ֵջ��
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllSuccess";
	}
	
	//��ת����ӵĶ�������ķ���
	public String add(){
		//��ѯ���е�һ������
		List<Category> cList=categoryService.findAll();
		//��ѯ������浽ֵջ��
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "addSuccess";
	}
	
	//�����������ķ���
	public String save(){
		categorySecondService.save(categorySecond);
		return "saveSuccess";
	}
	
	//ɾ����������
	public String delete(){
		//����csid��ѯ��������
		categorySecond=categorySecondService.findByCsid(categorySecond.getCsid());
		//ɾ����ѯ���Ķ�������
		categorySecondService.delete(categorySecond);
		return "deleteSuccess";
	}
	
	
	//�༭��������
	public String edit(){
		//����csid��ѯ��������
		categorySecond=categorySecondService.findByCsid(categorySecond.getCsid());
		//��ѯ���е�һ������
		List<Category> cList=categoryService.findAll();
		//���浽ֵջ��
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "editSuccess";
	}
	
	//���¶�������ķ���
	public String update(){
		//����csid��ѯ��������
		categorySecondService.update(categorySecond);
		return "updateSuccess";
	}
}

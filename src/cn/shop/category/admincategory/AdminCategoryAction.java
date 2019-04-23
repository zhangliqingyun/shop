package cn.shop.category.admincategory;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.shop.category.service.CategoryService;
import cn.shop.category.vo.Category;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/*
 * 
 * ��̨һ�������action
 */
public class AdminCategoryAction extends ActionSupport implements ModelDriven<Category> {
	//ʵ��ģ����������
	private Category category = new Category();
	//ע��categoryService
	private CategoryService categoryService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public Category getModel() {
		return category;
	}

	//��ѯ���е�һ������ķ���
	public String findAll(){
		List<Category> cList=categoryService.findAll();
		ServletActionContext.getContext().getValueStack().set("cList", cList);
		return "findAll";
	}
	
	//�������һ������ķ���
	public String save(){
		categoryService.save(category);
		return "saveSuccess";
	}
	
	//ɾ��һ������ķ���
	public String delete(){
		//����cid��ѯһ������
		category=categoryService.findByCid(category.getCid());
		categoryService.delete(category);
		return "deleteSuccess";
	}
	
	//�༭һ������
	public String edit(){
		//��ѯһ��������Ϣ
		category=categoryService.findByCid(category.getCid());
		return "editSuccess";
	}
	
	//�޸�һ������
	public String update(){
		categoryService.update(category);
		return "updateSuccess";
	}
}

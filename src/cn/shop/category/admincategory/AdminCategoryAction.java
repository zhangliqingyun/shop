package cn.shop.category.admincategory;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.shop.category.service.CategoryService;
import cn.shop.category.vo.Category;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/*
 * 
 * 后台一级分类的action
 */
public class AdminCategoryAction extends ActionSupport implements ModelDriven<Category> {
	//实现模型驱动的类
	private Category category = new Category();
	//注入categoryService
	private CategoryService categoryService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public Category getModel() {
		return category;
	}

	//查询所有的一个分类的方法
	public String findAll(){
		List<Category> cList=categoryService.findAll();
		ServletActionContext.getContext().getValueStack().set("cList", cList);
		return "findAll";
	}
	
	//保存添加一级分类的方法
	public String save(){
		categoryService.save(category);
		return "saveSuccess";
	}
	
	//删除一级分类的方法
	public String delete(){
		//根据cid查询一级分类
		category=categoryService.findByCid(category.getCid());
		categoryService.delete(category);
		return "deleteSuccess";
	}
	
	//编辑一级分类
	public String edit(){
		//查询一级分类信息
		category=categoryService.findByCid(category.getCid());
		return "editSuccess";
	}
	
	//修改一级分类
	public String update(){
		categoryService.update(category);
		return "updateSuccess";
	}
}

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
 * 后台二级分类的action
 * @author Administrator
 *
 */
public class AdminCategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond>{
	//接受模型驱动的对象
	private CategorySecond categorySecond=new CategorySecond();
	//注入categorySecondService
	private CategorySecondService categorySecondService;
	//接收page
	private Integer page;
	//注入一级分类的service
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

	//查询所有的二级分类的方法
	public String findAll(){
		PageBean<CategorySecond> pageBean=new PageBean<CategorySecond>();
		pageBean=categorySecondService.findAll(page);
		//查询结果保存到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllSuccess";
	}
	
	//跳转到添加的二级分类的方法
	public String add(){
		//查询所有的一级分类
		List<Category> cList=categoryService.findAll();
		//查询结果保存到值栈中
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "addSuccess";
	}
	
	//保存二级分类的方法
	public String save(){
		categorySecondService.save(categorySecond);
		return "saveSuccess";
	}
	
	//删除二级分类
	public String delete(){
		//根据csid查询二级分类
		categorySecond=categorySecondService.findByCsid(categorySecond.getCsid());
		//删除查询到的二级分类
		categorySecondService.delete(categorySecond);
		return "deleteSuccess";
	}
	
	
	//编辑二级分类
	public String edit(){
		//根据csid查询二级分类
		categorySecond=categorySecondService.findByCsid(categorySecond.getCsid());
		//查询所有的一级分类
		List<Category> cList=categoryService.findAll();
		//保存到值栈中
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "editSuccess";
	}
	
	//更新二级分类的方法
	public String update(){
		//根据csid查询二级分类
		categorySecondService.update(categorySecond);
		return "updateSuccess";
	}
}

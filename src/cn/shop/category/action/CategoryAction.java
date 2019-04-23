package cn.shop.category.action;

import com.opensymphony.xwork2.ActionSupport;

import cn.shop.category.service.CategoryService;

public class CategoryAction extends ActionSupport{

	private CategoryService categoryService;

	protected void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	
}

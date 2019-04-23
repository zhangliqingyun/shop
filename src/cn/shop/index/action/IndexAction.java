package cn.shop.index.action;

import java.util.List;

import cn.shop.category.service.CategoryService;
import cn.shop.category.vo.Category;
import cn.shop.convenience.service.ConvenienceService;
import cn.shop.convenience.vo.Convenience;
import cn.shop.product.service.ProductService;
import cn.shop.product.vo.Product;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class IndexAction extends ActionSupport{
	//注入一级分类的service
	private CategoryService categoryService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	//注入商品的service
	private ProductService productService;
		
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	//注入便民信息的service
	private ConvenienceService convenienceService;
	
	public void setConvenienceService(ConvenienceService convenienceService) {
		this.convenienceService = convenienceService;
	}

	//访问首页的方法
	public String execute(){
		//查询一级分类
		List<Category> cList=categoryService.findAll();
		//将所有的一级分类存到session
		ActionContext.getContext().getSession().put("cList", cList);
		//查询所有的热门商品
		List<Product> hList = productService.findHot();
		// 保存到值栈中:
		ActionContext.getContext().getValueStack().set("hList", hList);
		//查询最新商品
		List<Product> nList=productService.findNew();
		//保存到值栈
		ActionContext.getContext().getValueStack().set("nList", nList);
		//查询所有的便民信息
		List<Convenience> convenienceList = convenienceService.findAll();
		//保存到值栈中
		ActionContext.getContext().getValueStack().set("convenienceList", convenienceList);
		
		return "index";
	}
	
	
}

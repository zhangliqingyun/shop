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
	//ע��һ�������service
	private CategoryService categoryService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	//ע����Ʒ��service
	private ProductService productService;
		
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	//ע�������Ϣ��service
	private ConvenienceService convenienceService;
	
	public void setConvenienceService(ConvenienceService convenienceService) {
		this.convenienceService = convenienceService;
	}

	//������ҳ�ķ���
	public String execute(){
		//��ѯһ������
		List<Category> cList=categoryService.findAll();
		//�����е�һ������浽session
		ActionContext.getContext().getSession().put("cList", cList);
		//��ѯ���е�������Ʒ
		List<Product> hList = productService.findHot();
		// ���浽ֵջ��:
		ActionContext.getContext().getValueStack().set("hList", hList);
		//��ѯ������Ʒ
		List<Product> nList=productService.findNew();
		//���浽ֵջ
		ActionContext.getContext().getValueStack().set("nList", nList);
		//��ѯ���еı�����Ϣ
		List<Convenience> convenienceList = convenienceService.findAll();
		//���浽ֵջ��
		ActionContext.getContext().getValueStack().set("convenienceList", convenienceList);
		
		return "index";
	}
	
	
}

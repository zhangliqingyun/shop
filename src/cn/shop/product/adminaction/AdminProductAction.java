package cn.shop.product.adminaction;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.shop.categorysecond.service.CategorySecondService;
import cn.shop.categorysecond.vo.CategorySecond;
import cn.shop.product.service.ProductService;
import cn.shop.product.vo.Product;
import cn.shop.user.vo.User;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台商品管理的Action
 * @author Administrator
 *
 */
public class AdminProductAction extends ActionSupport implements ModelDriven<Product> {
	//实现模型驱动的类
	private Product product=new Product();
	//结束传过来的页数page
	private Integer page;
	//注入productService
	private ProductService productService;
	//注入categorySecondService
	private CategorySecondService categorySecondService;
	//接收文件
	private File upload;
	//接收文件的名字
	private String uploadFileName;
	//接收文件的MIME类型
	private String uploadContextType;
 
	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContextType(String uploadContextType) {
		this.uploadContextType = uploadContextType;
	}

	public void setCategorySecondservice(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Product getModel() {
		return product;
	}
	
	//否决的方法
	public String veto(){
		product = productService.findByPid(product.getPid());
		product.setShelves(2);   //审核不通过    
		productService.update(product);       
		return "veto";   
	}
	
	//审核通过的方法
	public String pass(){
		product = productService.findByPid(product.getPid());
		product.setShelves(1);
		productService.update(product);   
		return "pass";   
	}
	//跳转到审核商品页面的方法
	public String checkList(){    
		PageBean<Product> pageBean = productService.findCheckList(page);
		//保存商品到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "checkListPage";
	}

	//查找所有的商品的方法
	public String findAll(){
		//查询所有的商品 
		PageBean<Product> pageBean=productService.findByPage(page);
		//保存商品到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllSuccess";
	}
	
	//添加商品的方法
	public String add(){
		//查询所有的二级分类集合
		List<CategorySecond> csList=categorySecondService.findAll();
		//保存所有的二级分类到值栈中
		ActionContext.getContext().getValueStack().set("csList",csList);
		return "addSuccess";
	}
	
	//保存商品的方法
	public String save() throws IOException{
		//设置商品的属性值
		product.setPdate(new Date());
		if(upload != null){
			//获得上传文件的绝对路径
			String realPath=ServletActionContext.getServletContext().getRealPath("/products");
			//创建一个文件
			File destFile=new File(realPath+"//"+uploadFileName);
			//上传文件
			FileUtils.copyFile(upload, destFile);
			product.setImage("products/"+uploadFileName);
		}  
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("loginAdminUser");
		product.setUser(user);
		product.setShelves(1);    
		productService.save(product);      
		return "saveSuccess";	
	}
	
	//删除商品
	public String delete(){
		//根据商品id查询商品
		product=productService.findByPid(product.getPid());
		//得到图片路径
		String path=product.getImage();
		if(path != null){
			//得到图片绝对路径
			String realPath=ServletActionContext.getServletContext().getRealPath("/"+path);
			//删除图片
			File file=new File(realPath);
			file.delete();
		}
		productService.delete(product);
		return "deleteSuccess";
	}
	
	//编辑商品
	public String edit(){
		//根据商品id查询商品
		product=productService.findByPid(product.getPid());
		//查询所有的二级分类
		List<CategorySecond> csList=categorySecondService.findAll();
		//保存所有的二级分类到值栈中
		ActionContext.getContext().getValueStack().set("csList", csList);
		return "editSuccess";
	}
	
	//修改商品
	public String update() throws IOException{
		product.setPdate(new Date());
		if(upload != null){
			//删除之前的文件
			String path=product.getImage();   
			//得到文件的绝对路径
			String deletePath=ServletActionContext.getServletContext().getRealPath("/"+path);
			//删除文件
			File file=new File(deletePath);
			file.delete();
			//获取上传文件的绝对路径
			String realPath=ServletActionContext.getServletContext().getRealPath("/products");
			//创建一个文件
			File diskFile=new File(realPath+"//"+uploadFileName);
			//上传文件
			FileUtils.copyFile(upload,diskFile);
			product.setImage("products/"+uploadFileName);
		}
		productService.update(product);
		return "updateSuccess";
	}
}

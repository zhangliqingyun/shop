package cn.shop.product.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.shop.category.service.CategoryService;
import cn.shop.categorysecond.service.CategorySecondService;
import cn.shop.categorysecond.vo.CategorySecond;
import cn.shop.comments.service.CommentsService;
import cn.shop.comments.vo.Comments;
import cn.shop.convenience.service.ConvenienceService;
import cn.shop.convenience.vo.Convenience;
import cn.shop.product.service.ProductService;
import cn.shop.product.vo.Product;
import cn.shop.user.vo.User;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class ProductAction extends ActionSupport implements ModelDriven<Product>{

	//用于接受数据的模型驱动
	private Product product=new Product();
	
	private ProductService productService;
	//接受传过来的CID
	private Integer cid;
	
	//接收传过来的scid
	private Integer csid;
	
	//注入commentsservice
	private CommentsService commentsService;
	
	//接收上传文件的upload
	private File upload;
	
	//上传文件的名称
	private String uploadFileName;
	
	//上传文件 的MIME类型
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

	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}

	public Integer getCsid() {
		return csid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	public Integer getCid() {
		return cid;
	}

	//接受传过来的当前页page
	private int page;
	
	public void setPage(int page) {
		this.page = page;
	}

	//注入categoryService
	private CategoryService categoryService;
	
	//注入categorysecondService
	private CategorySecondService  categorySecondservice;  
	
	//接收搜索的内容
	private String inputMessage;
	
	//注入convenienceService
	private ConvenienceService convenienceService;
	
	//接收endprice
	private Integer endprice=1;
	
	//接收startprice
	private Integer startprice=1;          

	public void setEndprice(Integer endprice) {
		this.endprice = endprice;
	}

	public void setStartprice(Integer startprice) {
		this.startprice = startprice;
	}

	public void setConvenienceService(ConvenienceService convenienceService) {
		this.convenienceService = convenienceService;
	}

	public void setInputMessage(String inputMessage) {
		this.inputMessage = inputMessage;
	}

	public void setCategorySecondservice(CategorySecondService categorySecondservice) {
		this.categorySecondservice = categorySecondservice;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public  void setCid(Integer cid) {
		this.cid = cid;
	}

	
	public Product getModel() {
		return product;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	//搜索商品的方法
	public String search() throws UnsupportedEncodingException{
		
		String message = new String(inputMessage.getBytes("ISO-8859-1"),"UTF-8");//get方式提交，转成UTF-8格式       
		PageBean<Product> pageBean = productService.findByInputMessage(startprice,endprice,message,page); //通过输入框的内容模糊查询商品
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//查询所有的便民信息
		List<Convenience> convenienceList = convenienceService.findAll();
		//保存到值栈中
		ActionContext.getContext().getValueStack().set("convenienceList", convenienceList);
		ServletActionContext.getRequest().getSession().setAttribute("inputmessage",message);
		ServletActionContext.getRequest().getSession().setAttribute("startprice",startprice);
		ServletActionContext.getRequest().getSession().setAttribute("endprice",endprice);  
		return "search";             
	}
	
	//保存上传商品的方法
	public String save() throws IOException{   
		product.setIs_hot(0);  //不热门    
		product.setPdate(new Date());
		product.setIs_top(0);  //不置顶
		product.setShelves(0);//下架
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		product.setUser(user);   
		if(upload != null){	   
			//获得上传文件的绝对路劲
			String realPath = ServletActionContext.getServletContext().getRealPath("/products");
			//创建一个文件 
			File deskFile = new File(realPath+"//"+uploadFileName);
			//上传文件
			FileUtils.copyFile(upload, deskFile);
			product.setImage("products/"+uploadFileName);
		}
		productService.save(product);   
		return "saveSuccess";      
	}
	
	//跳转到添加商品页面的方法
	public String addproduct(){
		//查询所有的二级分类
		List<CategorySecond> csList = categorySecondservice.findAll();     
		//保存到值栈中
		ActionContext.getContext().getValueStack().set("csList",csList);       
		return "addproductpage";   
	}
	
	//根据商品id查询商品信息
	public String findByPid(){
		product=productService.findByPid(product.getPid());      
		List<Comments> commentsList = commentsService.findByProductId(product.getPid());//根据商品Id查询评论集合
		ActionContext.getContext().put("commentsList", commentsList);
		return "findByPid";
	}
	
	//根据一级分类cid查询商品
	public String findByCid(){
		//根据传过来的一级分类cid进行带有分页的查询商品
		PageBean<Product> pageBean= productService.findByPageCid(cid,page);
		//将PageBean存到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}
	
	//根据二级分类csid查询商品
	public String findByCsid(){
		//根据csid和page查询商品
		PageBean<Product> pageBean=productService.findByCsid(csid,page);
		//将PageBean存到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCsid";
	}
}

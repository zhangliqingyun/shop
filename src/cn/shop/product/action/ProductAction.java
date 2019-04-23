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

	//���ڽ������ݵ�ģ������
	private Product product=new Product();
	
	private ProductService productService;
	//���ܴ�������CID
	private Integer cid;
	
	//���մ�������scid
	private Integer csid;
	
	//ע��commentsservice
	private CommentsService commentsService;
	
	//�����ϴ��ļ���upload
	private File upload;
	
	//�ϴ��ļ�������
	private String uploadFileName;
	
	//�ϴ��ļ� ��MIME����
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

	//���ܴ������ĵ�ǰҳpage
	private int page;
	
	public void setPage(int page) {
		this.page = page;
	}

	//ע��categoryService
	private CategoryService categoryService;
	
	//ע��categorysecondService
	private CategorySecondService  categorySecondservice;  
	
	//��������������
	private String inputMessage;
	
	//ע��convenienceService
	private ConvenienceService convenienceService;
	
	//����endprice
	private Integer endprice=1;
	
	//����startprice
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
	
	//������Ʒ�ķ���
	public String search() throws UnsupportedEncodingException{
		
		String message = new String(inputMessage.getBytes("ISO-8859-1"),"UTF-8");//get��ʽ�ύ��ת��UTF-8��ʽ       
		PageBean<Product> pageBean = productService.findByInputMessage(startprice,endprice,message,page); //ͨ������������ģ����ѯ��Ʒ
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//��ѯ���еı�����Ϣ
		List<Convenience> convenienceList = convenienceService.findAll();
		//���浽ֵջ��
		ActionContext.getContext().getValueStack().set("convenienceList", convenienceList);
		ServletActionContext.getRequest().getSession().setAttribute("inputmessage",message);
		ServletActionContext.getRequest().getSession().setAttribute("startprice",startprice);
		ServletActionContext.getRequest().getSession().setAttribute("endprice",endprice);  
		return "search";             
	}
	
	//�����ϴ���Ʒ�ķ���
	public String save() throws IOException{   
		product.setIs_hot(0);  //������    
		product.setPdate(new Date());
		product.setIs_top(0);  //���ö�
		product.setShelves(0);//�¼�
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		product.setUser(user);   
		if(upload != null){	   
			//����ϴ��ļ��ľ���·��
			String realPath = ServletActionContext.getServletContext().getRealPath("/products");
			//����һ���ļ� 
			File deskFile = new File(realPath+"//"+uploadFileName);
			//�ϴ��ļ�
			FileUtils.copyFile(upload, deskFile);
			product.setImage("products/"+uploadFileName);
		}
		productService.save(product);   
		return "saveSuccess";      
	}
	
	//��ת�������Ʒҳ��ķ���
	public String addproduct(){
		//��ѯ���еĶ�������
		List<CategorySecond> csList = categorySecondservice.findAll();     
		//���浽ֵջ��
		ActionContext.getContext().getValueStack().set("csList",csList);       
		return "addproductpage";   
	}
	
	//������Ʒid��ѯ��Ʒ��Ϣ
	public String findByPid(){
		product=productService.findByPid(product.getPid());      
		List<Comments> commentsList = commentsService.findByProductId(product.getPid());//������ƷId��ѯ���ۼ���
		ActionContext.getContext().put("commentsList", commentsList);
		return "findByPid";
	}
	
	//����һ������cid��ѯ��Ʒ
	public String findByCid(){
		//���ݴ�������һ������cid���д��з�ҳ�Ĳ�ѯ��Ʒ
		PageBean<Product> pageBean= productService.findByPageCid(cid,page);
		//��PageBean�浽ֵջ��
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}
	
	//���ݶ�������csid��ѯ��Ʒ
	public String findByCsid(){
		//����csid��page��ѯ��Ʒ
		PageBean<Product> pageBean=productService.findByCsid(csid,page);
		//��PageBean�浽ֵջ��
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCsid";
	}
}

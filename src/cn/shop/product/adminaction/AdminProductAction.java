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
 * ��̨��Ʒ�����Action
 * @author Administrator
 *
 */
public class AdminProductAction extends ActionSupport implements ModelDriven<Product> {
	//ʵ��ģ����������
	private Product product=new Product();
	//������������ҳ��page
	private Integer page;
	//ע��productService
	private ProductService productService;
	//ע��categorySecondService
	private CategorySecondService categorySecondService;
	//�����ļ�
	private File upload;
	//�����ļ�������
	private String uploadFileName;
	//�����ļ���MIME����
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
	
	//����ķ���
	public String veto(){
		product = productService.findByPid(product.getPid());
		product.setShelves(2);   //��˲�ͨ��    
		productService.update(product);       
		return "veto";   
	}
	
	//���ͨ���ķ���
	public String pass(){
		product = productService.findByPid(product.getPid());
		product.setShelves(1);
		productService.update(product);   
		return "pass";   
	}
	//��ת�������Ʒҳ��ķ���
	public String checkList(){    
		PageBean<Product> pageBean = productService.findCheckList(page);
		//������Ʒ��ֵջ��
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "checkListPage";
	}

	//�������е���Ʒ�ķ���
	public String findAll(){
		//��ѯ���е���Ʒ 
		PageBean<Product> pageBean=productService.findByPage(page);
		//������Ʒ��ֵջ��
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllSuccess";
	}
	
	//�����Ʒ�ķ���
	public String add(){
		//��ѯ���еĶ������༯��
		List<CategorySecond> csList=categorySecondService.findAll();
		//�������еĶ������ൽֵջ��
		ActionContext.getContext().getValueStack().set("csList",csList);
		return "addSuccess";
	}
	
	//������Ʒ�ķ���
	public String save() throws IOException{
		//������Ʒ������ֵ
		product.setPdate(new Date());
		if(upload != null){
			//����ϴ��ļ��ľ���·��
			String realPath=ServletActionContext.getServletContext().getRealPath("/products");
			//����һ���ļ�
			File destFile=new File(realPath+"//"+uploadFileName);
			//�ϴ��ļ�
			FileUtils.copyFile(upload, destFile);
			product.setImage("products/"+uploadFileName);
		}  
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("loginAdminUser");
		product.setUser(user);
		product.setShelves(1);    
		productService.save(product);      
		return "saveSuccess";	
	}
	
	//ɾ����Ʒ
	public String delete(){
		//������Ʒid��ѯ��Ʒ
		product=productService.findByPid(product.getPid());
		//�õ�ͼƬ·��
		String path=product.getImage();
		if(path != null){
			//�õ�ͼƬ����·��
			String realPath=ServletActionContext.getServletContext().getRealPath("/"+path);
			//ɾ��ͼƬ
			File file=new File(realPath);
			file.delete();
		}
		productService.delete(product);
		return "deleteSuccess";
	}
	
	//�༭��Ʒ
	public String edit(){
		//������Ʒid��ѯ��Ʒ
		product=productService.findByPid(product.getPid());
		//��ѯ���еĶ�������
		List<CategorySecond> csList=categorySecondService.findAll();
		//�������еĶ������ൽֵջ��
		ActionContext.getContext().getValueStack().set("csList", csList);
		return "editSuccess";
	}
	
	//�޸���Ʒ
	public String update() throws IOException{
		product.setPdate(new Date());
		if(upload != null){
			//ɾ��֮ǰ���ļ�
			String path=product.getImage();   
			//�õ��ļ��ľ���·��
			String deletePath=ServletActionContext.getServletContext().getRealPath("/"+path);
			//ɾ���ļ�
			File file=new File(deletePath);
			file.delete();
			//��ȡ�ϴ��ļ��ľ���·��
			String realPath=ServletActionContext.getServletContext().getRealPath("/products");
			//����һ���ļ�
			File diskFile=new File(realPath+"//"+uploadFileName);
			//�ϴ��ļ�
			FileUtils.copyFile(upload,diskFile);
			product.setImage("products/"+uploadFileName);
		}
		productService.update(product);
		return "updateSuccess";
	}
}

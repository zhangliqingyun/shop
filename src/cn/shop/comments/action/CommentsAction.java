package cn.shop.comments.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import cn.shop.comments.service.CommentsService;
import cn.shop.comments.vo.Comments;
import cn.shop.product.service.ProductService;
import cn.shop.product.vo.Product;
import cn.shop.user.service.UserService;
import cn.shop.user.vo.User;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * ���۵�action��
 * @author ������
 *
 */
public class CommentsAction extends ActionSupport implements ModelDriven<Comments>{

	SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	//ע��service  
	private CommentsService commentsService;
	
	//ע��ģ��������Ҫ����
	private Comments comments = new Comments();
	
	//����userid
	private Integer userid;
	
	//����productid
	private Integer productid;
	
	//ע��userService
	private UserService userService;
	
	//ע��productService 
	private ProductService productService;  
	
	//����pid
	private Long pid;
	
	//����page
	private Integer page;
	
	//�����û����۵���Ϣ
	private String contentStart;   

	public void setContentStart(String contentStart) {
		this.contentStart = contentStart;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	
	public Comments getModel() {
		return comments;
	}

	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}
	
	//����ظ��ķ���
	public String savereply(){
		User user = userService.findUserByUid(userid);   
		Product product = productService.findByPid(productid);
		Date nowDate = new Date();        
		comments.setCdate(formate.format(nowDate));        
		comments.setUser(user);
		comments.setContent(comments.getContent()+contentStart);                 
		comments.setProduct(product);
		commentsService.save(comments);     
		return "savereplySuccess";    
	}
	
	//��ת����ӻظ�ҳ��� ����
	public String addplypage(){
		comments = commentsService.findById(comments.getId());     
		return "addplypage";     
	}
	
	//����idɾ�����۵ķ���
	public String delete(){
		comments = commentsService.findById(comments.getId());  
		commentsService.delete(comments);   //ɾ�����۵ķ���
		return "deleteSuccess";
	}
	
	//��ѯ���е�������Ϣ�ķ���������ҳ)
	public String list(){
		PageBean<Comments> pageBean = new PageBean<Comments>();
		pageBean = commentsService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);  
		return "list";   
	}
	
	//�������۵ķ���
	public String save() throws ParseException{ 
		User user = userService.findUserByUid(userid);   
		Product product = productService.findByPid(productid);
		Date nowDate = new Date();        
		comments.setCdate(formate.format(nowDate));        
		comments.setUser(user);
		comments.setProduct(product);
		commentsService.save(comments);   
		return "saveSuccess"; 
	}
	

}

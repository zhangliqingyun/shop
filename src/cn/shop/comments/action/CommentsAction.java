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
 * 评论的action层
 * @author 张立增
 *
 */
public class CommentsAction extends ActionSupport implements ModelDriven<Comments>{

	SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	//注入service  
	private CommentsService commentsService;
	
	//注入模型驱动需要的类
	private Comments comments = new Comments();
	
	//接收userid
	private Integer userid;
	
	//接收productid
	private Integer productid;
	
	//注入userService
	private UserService userService;
	
	//注入productService 
	private ProductService productService;  
	
	//接收pid
	private Long pid;
	
	//接收page
	private Integer page;
	
	//接收用户评论的信息
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
	
	//保存回复的方法
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
	
	//跳转到添加回复页面的 方法
	public String addplypage(){
		comments = commentsService.findById(comments.getId());     
		return "addplypage";     
	}
	
	//根据id删除评论的方法
	public String delete(){
		comments = commentsService.findById(comments.getId());  
		commentsService.delete(comments);   //删除评论的方法
		return "deleteSuccess";
	}
	
	//查询所有的评论信息的方法（带分页)
	public String list(){
		PageBean<Comments> pageBean = new PageBean<Comments>();
		pageBean = commentsService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);  
		return "list";   
	}
	
	//保存评论的方法
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

package cn.shop.user.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.shop.user.service.UserService;
import cn.shop.user.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	//模型驱动使用的对象
	private User user=new User();
	
	//注入UserService对象
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//接受用户输入的验证码
	private String checkcode;
	
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public User getModel() {
		
		return user;
	}
	//跳转到用户注册的方法
	public String registPage(){
		
		return "registPage";
	}

	//AJAX异步检验用户名调用的方法
	public String findByName() throws IOException{
		
		//创建Service进行查询
		User existUser=userService.findByUserName(user.getUsername());
		
		//获取Request对象，向页面输出
		HttpServletResponse response=ServletActionContext.getResponse(); 
		
		 //设置编码
		response.setContentType("text/html;charset=utf-8");
		
		//判断
		if(existUser!=null){
			//用户名不可以用
			response.getWriter().println("<font color='red'>用户名不可用</font>");
		}else{
			//用户名可以用
			response.getWriter().println("<font color='green'>用户名可以注册</font>");
		}
		
		return NONE;
	}
	
	//注册页面的方法
	public String regist(){
		//获取生成的随机验证码
		String randCheckCode=(String)ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		//判断验证码
		if(!checkcode.equalsIgnoreCase(randCheckCode)){
			this.addActionError("登录失败：验证码错误！");
			return "checkcodeFaile";
		}
		userService.save(user);
		this.addActionMessage("注册成功，赶紧去登录吧！");
		return "msg";
	}
	
	//激活用户的方法
	public String active(){
		//根据激活码查询用户
		User existUser=userService.findByCode(user.getCode());
		if(existUser==null){
			//查询不到用户
			this.addActionMessage("激活失败，验证码不正确");	
		}else{
			//查询到用户
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			this.addActionMessage("激活成功:请去登录!");
		}
		return "msg";
	}
	
	//跳转到登录页面的方法
	public String loginPage(){
		return "loginPage";
	}
	
	//登录的方法
	public String login(){
		User existUser=userService.login(user);
		//判断
		if(existUser == null){
			//登录失败
			this.addActionError("登录失败：用户名或密码错误");
			return LOGIN;
		}else{
			//登录成功
			//保存信息到session
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			//页面调转
			return "loginSuccess";
		}
	}
	
	//退出的方法    
	public String quit(){
		//销毁session
		//ServletActionContext.getRequest().getSession().invalidate();
		ServletActionContext.getRequest().getSession().setAttribute("existUser", null);   
		return "quit";
	}
	
	//管理员管理用户的方法
	public String manager(){
		//查询所有的注册用户
		List<User> listRegistUser = userService.findAllUser();
		//保存到session中
		ActionContext.getContext().put("listRegistUser", listRegistUser);
		return "manager";
	}
	
	//管理员删除用户的方法
	public String delete(){
		//根据uid查询要删除得用户
		User userDelete = userService.findUserByUid(user.getUid());
		//删除用户
		userService.delete(userDelete);
		return "delete";
	}
}

package cn.shop.adminuser.action;

import org.apache.struts2.ServletActionContext;

import cn.shop.adminuser.service.AdminUserService;
import cn.shop.adminuser.vo.AdminUser;
import cn.shop.user.service.UserService;
import cn.shop.user.vo.User;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {
	//实现模型驱动的类
	private AdminUser adminUser=new AdminUser();
	//注入AdminUserService
	private AdminUserService adminUserService;
	
	//注入userService
	private UserService userService;
	
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}

	public AdminUser getModel() {
		return adminUser;     
	}

	//登录到管理员后台的方法
	public String login(){
		AdminUser existAdminUser=adminUserService.login(adminUser);
		if(existAdminUser == null){
			//不存在这个用户
			this.addActionError("亲！您的账号或者密码错误！");
			return "loginFail";
		}else{
			//保存到session中
			ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", existAdminUser);
			User loginAdminUser = userService.findByUserName(adminUser.getUsername());     
			ServletActionContext.getRequest().getSession().setAttribute("loginAdminUser", loginAdminUser);
			return "loginSuccess";
		}
	}
	
	//退出的方法
	public String logout(){
		//销毁session   
		//ServletActionContext.getRequest().getSession().invalidate();    
		ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", null);
		ServletActionContext.getRequest().getSession().setAttribute("loginAdminUser", null);
		return "logout";   
	}
}

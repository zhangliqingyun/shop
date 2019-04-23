package cn.shop.adminuser.action;

import org.apache.struts2.ServletActionContext;

import cn.shop.adminuser.service.AdminUserService;
import cn.shop.adminuser.vo.AdminUser;
import cn.shop.user.service.UserService;
import cn.shop.user.vo.User;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {
	//ʵ��ģ����������
	private AdminUser adminUser=new AdminUser();
	//ע��AdminUserService
	private AdminUserService adminUserService;
	
	//ע��userService
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

	//��¼������Ա��̨�ķ���
	public String login(){
		AdminUser existAdminUser=adminUserService.login(adminUser);
		if(existAdminUser == null){
			//����������û�
			this.addActionError("�ף������˺Ż����������");
			return "loginFail";
		}else{
			//���浽session��
			ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", existAdminUser);
			User loginAdminUser = userService.findByUserName(adminUser.getUsername());     
			ServletActionContext.getRequest().getSession().setAttribute("loginAdminUser", loginAdminUser);
			return "loginSuccess";
		}
	}
	
	//�˳��ķ���
	public String logout(){
		//����session   
		//ServletActionContext.getRequest().getSession().invalidate();    
		ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", null);
		ServletActionContext.getRequest().getSession().setAttribute("loginAdminUser", null);
		return "logout";   
	}
}

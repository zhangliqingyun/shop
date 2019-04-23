package cn.shop.interceptor;

import org.apache.struts2.ServletActionContext;

import cn.shop.adminuser.vo.AdminUser;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 后台管理的拦截器
 * @author Administrator
 *
 */
public class PrivilegeInterceptor extends MethodFilterInterceptor{

	//执行拦截的方法
	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		//得到要拦截的session
		AdminUser adminUser=(AdminUser)ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(adminUser == null){
			//没有登录
			ActionSupport actionSupport=(ActionSupport)actionInvocation.getAction();
			actionSupport.addActionError("亲！您还没登录");
			return "loginFail";
		}else{
			//登录成功
			return actionInvocation.invoke();
		}
		
	}

}

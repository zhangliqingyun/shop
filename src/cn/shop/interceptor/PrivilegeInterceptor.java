package cn.shop.interceptor;

import org.apache.struts2.ServletActionContext;

import cn.shop.adminuser.vo.AdminUser;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * ��̨�����������
 * @author Administrator
 *
 */
public class PrivilegeInterceptor extends MethodFilterInterceptor{

	//ִ�����صķ���
	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		//�õ�Ҫ���ص�session
		AdminUser adminUser=(AdminUser)ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(adminUser == null){
			//û�е�¼
			ActionSupport actionSupport=(ActionSupport)actionInvocation.getAction();
			actionSupport.addActionError("�ף�����û��¼");
			return "loginFail";
		}else{
			//��¼�ɹ�
			return actionInvocation.invoke();
		}
		
	}

}

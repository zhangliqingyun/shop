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

	//ģ������ʹ�õĶ���
	private User user=new User();
	
	//ע��UserService����
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//�����û��������֤��
	private String checkcode;
	
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public User getModel() {
		
		return user;
	}
	//��ת���û�ע��ķ���
	public String registPage(){
		
		return "registPage";
	}

	//AJAX�첽�����û������õķ���
	public String findByName() throws IOException{
		
		//����Service���в�ѯ
		User existUser=userService.findByUserName(user.getUsername());
		
		//��ȡRequest������ҳ�����
		HttpServletResponse response=ServletActionContext.getResponse(); 
		
		 //���ñ���
		response.setContentType("text/html;charset=utf-8");
		
		//�ж�
		if(existUser!=null){
			//�û�����������
			response.getWriter().println("<font color='red'>�û���������</font>");
		}else{
			//�û���������
			response.getWriter().println("<font color='green'>�û�������ע��</font>");
		}
		
		return NONE;
	}
	
	//ע��ҳ��ķ���
	public String regist(){
		//��ȡ���ɵ������֤��
		String randCheckCode=(String)ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		//�ж���֤��
		if(!checkcode.equalsIgnoreCase(randCheckCode)){
			this.addActionError("��¼ʧ�ܣ���֤�����");
			return "checkcodeFaile";
		}
		userService.save(user);
		this.addActionMessage("ע��ɹ����Ͻ�ȥ��¼�ɣ�");
		return "msg";
	}
	
	//�����û��ķ���
	public String active(){
		//���ݼ������ѯ�û�
		User existUser=userService.findByCode(user.getCode());
		if(existUser==null){
			//��ѯ�����û�
			this.addActionMessage("����ʧ�ܣ���֤�벻��ȷ");	
		}else{
			//��ѯ���û�
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			this.addActionMessage("����ɹ�:��ȥ��¼!");
		}
		return "msg";
	}
	
	//��ת����¼ҳ��ķ���
	public String loginPage(){
		return "loginPage";
	}
	
	//��¼�ķ���
	public String login(){
		User existUser=userService.login(user);
		//�ж�
		if(existUser == null){
			//��¼ʧ��
			this.addActionError("��¼ʧ�ܣ��û������������");
			return LOGIN;
		}else{
			//��¼�ɹ�
			//������Ϣ��session
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			//ҳ���ת
			return "loginSuccess";
		}
	}
	
	//�˳��ķ���    
	public String quit(){
		//����session
		//ServletActionContext.getRequest().getSession().invalidate();
		ServletActionContext.getRequest().getSession().setAttribute("existUser", null);   
		return "quit";
	}
	
	//����Ա�����û��ķ���
	public String manager(){
		//��ѯ���е�ע���û�
		List<User> listRegistUser = userService.findAllUser();
		//���浽session��
		ActionContext.getContext().put("listRegistUser", listRegistUser);
		return "manager";
	}
	
	//����Աɾ���û��ķ���
	public String delete(){
		//����uid��ѯҪɾ�����û�
		User userDelete = userService.findUserByUid(user.getUid());
		//ɾ���û�
		userService.delete(userDelete);
		return "delete";
	}
}

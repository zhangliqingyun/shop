package cn.shop.adminuser.service;

import cn.shop.adminuser.dao.AdminUserDao;
import cn.shop.adminuser.vo.AdminUser;

/*
 * ��̨�����ҵ���
 */
public class AdminUserService  {
   //ע��AdminUserDao
	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}

	//����Ա��¼��̨�ַ���
	public AdminUser login(AdminUser adminUser) {
		return adminUserDao.login(adminUser);
	}
	
}

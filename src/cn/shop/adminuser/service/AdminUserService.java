package cn.shop.adminuser.service;

import cn.shop.adminuser.dao.AdminUserDao;
import cn.shop.adminuser.vo.AdminUser;

/*
 * 后台管理的业务层
 */
public class AdminUserService  {
   //注入AdminUserDao
	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}

	//管理员登录后台分方法
	public AdminUser login(AdminUser adminUser) {
		return adminUserDao.login(adminUser);
	}
	
}

package cn.shop.adminuser.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.adminuser.vo.AdminUser;

/*
 * 
 * 后台管理的dao层
 */
public class AdminUserDao extends HibernateDaoSupport {

	//管理员登录到后台的方法
	public AdminUser login(AdminUser adminUser) {
		String hql=" from AdminUser where username=? and password=?";
		List<AdminUser> list=this.getHibernateTemplate().find(hql,adminUser.getUsername(),adminUser.getPassword());
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

}

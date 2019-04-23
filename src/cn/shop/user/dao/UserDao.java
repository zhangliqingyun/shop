package cn.shop.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.user.vo.User;

/*
 * 用户模块持久层对象
 */
public class UserDao extends HibernateDaoSupport {

	//根据用户名查询
	public User findByUserName(String userName){
		String hql=" from User where UserName=?";
		List<User> list=this.getHibernateTemplate().find(hql,userName);
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	//保存用户注册信息 
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}

	//根据激活码查询用户的方法
	public User findByCode(String code) {
		String hql = "from User where code = ?";
		List<User> list = this.getHibernateTemplate().find(hql,code);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	//更改用户为激活状态的方法
	public void update(User existUser) {
		this.getHibernateTemplate().update(existUser);
	}

	//用户登录的方法
	public User login(User user) {
		String hql=" from User where username=? and password=? and state=?";
		List<User> list=this.getHibernateTemplate().find(hql,user.getUsername(),user.getPassword(),1);
		//判断
		if(list!=null&&list.size()>0){
			//有这个用户，可以登录
			return list.get(0);
		}
		return null;
	}

	//查询所有的注册用户的方法
	public List<User> findAllUser() {
		String hql=" from User";
		List<User> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	//根据uid查询要删除得用户
	public User findUserByUid(Integer uid) {
		String hql=" from User where uid=?";
		List<User> list = this.getHibernateTemplate().find(hql,uid);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	//删除用户
	public void delete(User userDelete) {
		this.getHibernateTemplate().delete(userDelete);
	}

	
}
 
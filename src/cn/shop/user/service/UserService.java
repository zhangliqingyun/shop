package cn.shop.user.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.user.dao.UserDao;
import cn.shop.user.vo.User;
import cn.shop.utils.MailUtils;
import cn.shop.utils.UUIDUtils;

/*
 * 用户模块业务层代码
 */
@Transactional
public class UserService {

	//注入UserDao
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	//通过用户名查询用户
	public User findByUserName(String userName){
		return userDao.findByUserName(userName);
	}

	//保存注册信息的方法
	public void save(User user) {
		user.setState(1);// 0:未激活状态；1：已激活状态
		String code=UUIDUtils.getUUID()+UUIDUtils.getUUID();
		user.setCode(code);
		userDao.save(user);
		MailUtils.sendMail(user.getEmail(), code);
	}

	//根据激活码查询用户的方法
	public User findByCode(String code) {
		return userDao.findByCode(code);
	}

	//更新用户状态为激活的方法
	public void update(User existUser) {
		userDao.update(existUser);
	}

	//用户登录的方法
	public User login(User user) {
		return userDao.login(user);
	}

	//查询所有的注册用户的方法
	public List<User> findAllUser() {
		return userDao.findAllUser();
	}

	//根据uid查询要删除得用户
	public User findUserByUid(Integer uid) {
		return userDao.findUserByUid(uid);
	}

	//删除用户
	public void delete(User userDelete) {
		userDao.delete(userDelete);
	}

	
	
}

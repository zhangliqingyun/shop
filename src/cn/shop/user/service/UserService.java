package cn.shop.user.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.user.dao.UserDao;
import cn.shop.user.vo.User;
import cn.shop.utils.MailUtils;
import cn.shop.utils.UUIDUtils;

/*
 * �û�ģ��ҵ������
 */
@Transactional
public class UserService {

	//ע��UserDao
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	//ͨ���û�����ѯ�û�
	public User findByUserName(String userName){
		return userDao.findByUserName(userName);
	}

	//����ע����Ϣ�ķ���
	public void save(User user) {
		user.setState(1);// 0:δ����״̬��1���Ѽ���״̬
		String code=UUIDUtils.getUUID()+UUIDUtils.getUUID();
		user.setCode(code);
		userDao.save(user);
		MailUtils.sendMail(user.getEmail(), code);
	}

	//���ݼ������ѯ�û��ķ���
	public User findByCode(String code) {
		return userDao.findByCode(code);
	}

	//�����û�״̬Ϊ����ķ���
	public void update(User existUser) {
		userDao.update(existUser);
	}

	//�û���¼�ķ���
	public User login(User user) {
		return userDao.login(user);
	}

	//��ѯ���е�ע���û��ķ���
	public List<User> findAllUser() {
		return userDao.findAllUser();
	}

	//����uid��ѯҪɾ�����û�
	public User findUserByUid(Integer uid) {
		return userDao.findUserByUid(uid);
	}

	//ɾ���û�
	public void delete(User userDelete) {
		userDao.delete(userDelete);
	}

	
	
}

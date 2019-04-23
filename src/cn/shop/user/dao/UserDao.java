package cn.shop.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.user.vo.User;

/*
 * �û�ģ��־ò����
 */
public class UserDao extends HibernateDaoSupport {

	//�����û�����ѯ
	public User findByUserName(String userName){
		String hql=" from User where UserName=?";
		List<User> list=this.getHibernateTemplate().find(hql,userName);
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	//�����û�ע����Ϣ 
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}

	//���ݼ������ѯ�û��ķ���
	public User findByCode(String code) {
		String hql = "from User where code = ?";
		List<User> list = this.getHibernateTemplate().find(hql,code);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	//�����û�Ϊ����״̬�ķ���
	public void update(User existUser) {
		this.getHibernateTemplate().update(existUser);
	}

	//�û���¼�ķ���
	public User login(User user) {
		String hql=" from User where username=? and password=? and state=?";
		List<User> list=this.getHibernateTemplate().find(hql,user.getUsername(),user.getPassword(),1);
		//�ж�
		if(list!=null&&list.size()>0){
			//������û������Ե�¼
			return list.get(0);
		}
		return null;
	}

	//��ѯ���е�ע���û��ķ���
	public List<User> findAllUser() {
		String hql=" from User";
		List<User> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	//����uid��ѯҪɾ�����û�
	public User findUserByUid(Integer uid) {
		String hql=" from User where uid=?";
		List<User> list = this.getHibernateTemplate().find(hql,uid);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	//ɾ���û�
	public void delete(User userDelete) {
		this.getHibernateTemplate().delete(userDelete);
	}

	
}
 
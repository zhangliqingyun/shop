package cn.shop.category.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.opensymphony.xwork2.ActionContext;

import cn.shop.category.vo.Category;

/*
 * 
 * һ���˵��ĳ־ò�
 */
public class CategoryDao extends HibernateDaoSupport{

	//��ѯ����һ������
	public List<Category> findAll() {
		String hql=" from Category";
		List<Category> list=this.getHibernateTemplate().find(hql);
		return list;
	}

	//����һ������ķ���
	public void save(Category category) {
	    this.getHibernateTemplate().save(category);
	}

	//ɾ��һ������ķ���
	public void delete(Category category) {
	     this.getHibernateTemplate().delete(category);
	}

	//����cid��ѯһ���û�
	public Category findByCid(Integer cid) {
		return this.getHibernateTemplate().get(Category.class,cid);
	}

	//�޸�һ������
	public void update(Category category) {
		 this.getHibernateTemplate().update(category);
	}

}

package cn.shop.category.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.opensymphony.xwork2.ActionContext;

import cn.shop.category.vo.Category;

/*
 * 
 * 一级菜单的持久层
 */
public class CategoryDao extends HibernateDaoSupport{

	//查询所有一级分类
	public List<Category> findAll() {
		String hql=" from Category";
		List<Category> list=this.getHibernateTemplate().find(hql);
		return list;
	}

	//保存一级分类的方法
	public void save(Category category) {
	    this.getHibernateTemplate().save(category);
	}

	//删除一级分类的方法
	public void delete(Category category) {
	     this.getHibernateTemplate().delete(category);
	}

	//根据cid查询一级用户
	public Category findByCid(Integer cid) {
		return this.getHibernateTemplate().get(Category.class,cid);
	}

	//修改一级分类
	public void update(Category category) {
		 this.getHibernateTemplate().update(category);
	}

}

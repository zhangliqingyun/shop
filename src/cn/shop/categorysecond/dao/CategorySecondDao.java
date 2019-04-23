package cn.shop.categorysecond.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.categorysecond.vo.CategorySecond;
import cn.shop.utils.PageHibernateCallback;

public class CategorySecondDao extends HibernateDaoSupport{

	//查询二级分类的条数
	public int findCount() {
		String hql="select count(*) from CategorySecond";
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//查询二级分类的信息
	public List<CategorySecond> findCategorySecond(int begin, int limit) {
		String hql=" from CategorySecond order by csid desc";
		List<CategorySecond> list=this.getHibernateTemplate().execute(new PageHibernateCallback<CategorySecond>(hql, null, begin,limit));
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}

	//保存二级分类的方法
	public void save(CategorySecond categorySecond) {
		this.getHibernateTemplate().save(categorySecond);
	}

	//根据CSID查询要删除的二级分类
	public CategorySecond findByCsid(Integer csid) {
		return this.getHibernateTemplate().get(CategorySecond.class, csid);
	}

	//删除二级分类的方法
	public void delete(CategorySecond categorySecond) {
	   this.getHibernateTemplate().delete(categorySecond);
	}

	//更新二级分类的方法
	public void update(CategorySecond categorySecond) {
		this.getHibernateTemplate().update(categorySecond);
	}

	//查询所有的二级分类
	public List<CategorySecond> findAll() {
		String hql=" from CategorySecond";
		return this.getHibernateTemplate().find(hql);
	}

}

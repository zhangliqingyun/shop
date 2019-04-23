package cn.shop.categorysecond.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.categorysecond.vo.CategorySecond;
import cn.shop.utils.PageHibernateCallback;

public class CategorySecondDao extends HibernateDaoSupport{

	//��ѯ�������������
	public int findCount() {
		String hql="select count(*) from CategorySecond";
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//��ѯ�����������Ϣ
	public List<CategorySecond> findCategorySecond(int begin, int limit) {
		String hql=" from CategorySecond order by csid desc";
		List<CategorySecond> list=this.getHibernateTemplate().execute(new PageHibernateCallback<CategorySecond>(hql, null, begin,limit));
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}

	//�����������ķ���
	public void save(CategorySecond categorySecond) {
		this.getHibernateTemplate().save(categorySecond);
	}

	//����CSID��ѯҪɾ���Ķ�������
	public CategorySecond findByCsid(Integer csid) {
		return this.getHibernateTemplate().get(CategorySecond.class, csid);
	}

	//ɾ����������ķ���
	public void delete(CategorySecond categorySecond) {
	   this.getHibernateTemplate().delete(categorySecond);
	}

	//���¶�������ķ���
	public void update(CategorySecond categorySecond) {
		this.getHibernateTemplate().update(categorySecond);
	}

	//��ѯ���еĶ�������
	public List<CategorySecond> findAll() {
		String hql=" from CategorySecond";
		return this.getHibernateTemplate().find(hql);
	}

}

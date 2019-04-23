package cn.shop.convenience.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.shop.convenience.vo.Convenience;
import cn.shop.utils.PageHibernateCallback;


/**
 * 便民信息的dao层
 * @author 张立增
 *
 */
@Repository
public class ConvenienceDao extends HibernateDaoSupport{

	//查询所有的便民信息
	public List<Convenience> findAll() {   
		String hql = "From Convenience";
		List<Convenience> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	//查询所有的数据集合数量
	public int findTotalCount() {
		String hql = "select count(*) from Convenience";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//根据开始索引和页码查询数据集合
	public List<Convenience> findListByStartAndPage(int startIndex, Integer pageSize) {
		String hql = "from Convenience";
		List<Convenience> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Convenience>(hql, null, startIndex, pageSize));
		return list;   
	}

	//根据id查询便民信息
	public Convenience findById(int id) {
        String hql = "from Convenience where id="+id;
        List<Convenience> list = this.getHibernateTemplate().find(hql);
        if(list != null && list.size()>0){
        	return list.get(0);   
        }
		return null;
	}

	 //删除便民信息类
	public void delete(Convenience convenience) {
		this.getHibernateTemplate().delete(convenience);      
	}

	//更新便民信息的方法
	public void update(Convenience convenience) {   
		this.getHibernateTemplate().update(convenience);     
	}

	//保存便民信息的方法
	public void save(Convenience convenience) {
		this.getHibernateTemplate().save(convenience);   
	}
     
}

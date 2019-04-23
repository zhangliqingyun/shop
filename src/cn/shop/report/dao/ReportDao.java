package cn.shop.report.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.shop.report.vo.Report;
import cn.shop.utils.PageHibernateCallback;

/**
 * 举报的dao层
 * @author 张立增
 *
 */
@Repository
public class ReportDao extends HibernateDaoSupport{

	//保存举报信息的方法
	public void save(Report report) {
		this.getHibernateTemplate().save(report);   
	}

	//查询总的记录条数
	public int findTotalCount() {
		String hql = "select count(*) from Report where isdeal='0'";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//查询要显示的记录集合
	public List<Report> findListByStartAndLimit(int startIndex, int pageSize) {
	    String hql = "from Report where isdeal='0'";   
	    List<Report> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Report>(hql, null, startIndex, pageSize));
		return list;
	}

	//根据Id查找举报信息
	public Report findById(Integer id) {
		String hql = "from Report where id="+id;
		List<Report> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	//更新举报信息
	public void update(Report report) {
		this.getHibernateTemplate().update(report);  
	}
   
}

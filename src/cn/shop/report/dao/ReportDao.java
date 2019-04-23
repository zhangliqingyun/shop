package cn.shop.report.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.shop.report.vo.Report;
import cn.shop.utils.PageHibernateCallback;

/**
 * �ٱ���dao��
 * @author ������
 *
 */
@Repository
public class ReportDao extends HibernateDaoSupport{

	//����ٱ���Ϣ�ķ���
	public void save(Report report) {
		this.getHibernateTemplate().save(report);   
	}

	//��ѯ�ܵļ�¼����
	public int findTotalCount() {
		String hql = "select count(*) from Report where isdeal='0'";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//��ѯҪ��ʾ�ļ�¼����
	public List<Report> findListByStartAndLimit(int startIndex, int pageSize) {
	    String hql = "from Report where isdeal='0'";   
	    List<Report> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Report>(hql, null, startIndex, pageSize));
		return list;
	}

	//����Id���Ҿٱ���Ϣ
	public Report findById(Integer id) {
		String hql = "from Report where id="+id;
		List<Report> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	//���¾ٱ���Ϣ
	public void update(Report report) {
		this.getHibernateTemplate().update(report);  
	}
   
}

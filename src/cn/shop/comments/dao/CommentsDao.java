package cn.shop.comments.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.shop.comments.vo.Comments;
import cn.shop.utils.PageHibernateCallback;

/**
 * ���۵�dao��
 * @author ������
 *
 */
@Repository
public class CommentsDao extends HibernateDaoSupport {

	//�������۵ķ���
	public void save(Comments comments) {
		this.getHibernateTemplate().save(comments);   
	}

	//��ѯ�ܵļ�¼����
	public int findTotalCount() {
		String hql = "select count(*) from Comments";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();     
		}
		return 0;
	}

	//��ѯҪ��ʾ�ļ�¼����
	public List<Comments> findListByStartAndLimit(int startIndex, int pageSize){
	    String hql = "from Comments order by cdate desc";     
	    List<Comments> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Comments>(hql, null, startIndex, pageSize));
		return list;  
	}

	//����idɾ�����۵ķ���
	public Comments findById(Integer id) {
		String hql = "from Comments where id="+id;
		List<Comments> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0);       
		}
		return null;
	}

	 //ɾ�����۵ķ���
	public void delete(Comments comments) {
		this.getHibernateTemplate().delete(comments);     
	}

	//������ƷId��ѯ���ۼ���
	public List<Comments> findByProductId(Integer pid) {
		String hql = "from Comments where productid="+pid+"order by cdate asc";           
		List<Comments> list = this.getHibernateTemplate().find(hql);
		return list;
	}

}

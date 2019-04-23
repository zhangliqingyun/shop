package cn.shop.comments.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.shop.comments.vo.Comments;
import cn.shop.utils.PageHibernateCallback;

/**
 * 评论的dao层
 * @author 张立增
 *
 */
@Repository
public class CommentsDao extends HibernateDaoSupport {

	//保存评论的方法
	public void save(Comments comments) {
		this.getHibernateTemplate().save(comments);   
	}

	//查询总的记录条数
	public int findTotalCount() {
		String hql = "select count(*) from Comments";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();     
		}
		return 0;
	}

	//查询要显示的记录集合
	public List<Comments> findListByStartAndLimit(int startIndex, int pageSize){
	    String hql = "from Comments order by cdate desc";     
	    List<Comments> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Comments>(hql, null, startIndex, pageSize));
		return list;  
	}

	//根据id删除评论的方法
	public Comments findById(Integer id) {
		String hql = "from Comments where id="+id;
		List<Comments> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0);       
		}
		return null;
	}

	 //删除评论的方法
	public void delete(Comments comments) {
		this.getHibernateTemplate().delete(comments);     
	}

	//根据商品Id查询评论集合
	public List<Comments> findByProductId(Integer pid) {
		String hql = "from Comments where productid="+pid+"order by cdate asc";           
		List<Comments> list = this.getHibernateTemplate().find(hql);
		return list;
	}

}

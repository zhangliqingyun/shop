package cn.shop.returnmessage.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.returnmessage.vo.ReturnMessage;
import cn.shop.utils.PageHibernateCallback;

/**
 * 反馈信息的持久层
 * @author 张立增
 *
 */
public class ReturnMessageDao extends HibernateDaoSupport{

	//保存反馈信息订单方法
	public void save(ReturnMessage returnMessage) {   
		this.getHibernateTemplate().save(returnMessage);
	}

	//查询所有的反馈信息
	public List<ReturnMessage> findAllReturnMessage() {
		String hql = " from ReturnMessage";
		List<ReturnMessage> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	//查询总的记录条数
	public int findTotalCount() {
		String hql = "select count(*) from ReturnMessage";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list !=null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//通过开始索引和每页显示记录查询结果集
	public List<ReturnMessage> findListByStartAndLimit(int startIndex, int pageSize) {
	    String hql ="from ReturnMessage order by returndate desc";
	    List<ReturnMessage> list = this.getHibernateTemplate().execute(new PageHibernateCallback<ReturnMessage>(hql, null, startIndex, pageSize));
		return list;
	}

}

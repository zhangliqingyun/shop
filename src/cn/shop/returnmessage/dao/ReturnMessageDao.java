package cn.shop.returnmessage.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.returnmessage.vo.ReturnMessage;
import cn.shop.utils.PageHibernateCallback;

/**
 * ������Ϣ�ĳ־ò�
 * @author ������
 *
 */
public class ReturnMessageDao extends HibernateDaoSupport{

	//���淴����Ϣ��������
	public void save(ReturnMessage returnMessage) {   
		this.getHibernateTemplate().save(returnMessage);
	}

	//��ѯ���еķ�����Ϣ
	public List<ReturnMessage> findAllReturnMessage() {
		String hql = " from ReturnMessage";
		List<ReturnMessage> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	//��ѯ�ܵļ�¼����
	public int findTotalCount() {
		String hql = "select count(*) from ReturnMessage";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list !=null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//ͨ����ʼ������ÿҳ��ʾ��¼��ѯ�����
	public List<ReturnMessage> findListByStartAndLimit(int startIndex, int pageSize) {
	    String hql ="from ReturnMessage order by returndate desc";
	    List<ReturnMessage> list = this.getHibernateTemplate().execute(new PageHibernateCallback<ReturnMessage>(hql, null, startIndex, pageSize));
		return list;
	}

}

package cn.shop.convenience.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.shop.convenience.vo.Convenience;
import cn.shop.utils.PageHibernateCallback;


/**
 * ������Ϣ��dao��
 * @author ������
 *
 */
@Repository
public class ConvenienceDao extends HibernateDaoSupport{

	//��ѯ���еı�����Ϣ
	public List<Convenience> findAll() {   
		String hql = "From Convenience";
		List<Convenience> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	//��ѯ���е����ݼ�������
	public int findTotalCount() {
		String hql = "select count(*) from Convenience";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//���ݿ�ʼ������ҳ���ѯ���ݼ���
	public List<Convenience> findListByStartAndPage(int startIndex, Integer pageSize) {
		String hql = "from Convenience";
		List<Convenience> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Convenience>(hql, null, startIndex, pageSize));
		return list;   
	}

	//����id��ѯ������Ϣ
	public Convenience findById(int id) {
        String hql = "from Convenience where id="+id;
        List<Convenience> list = this.getHibernateTemplate().find(hql);
        if(list != null && list.size()>0){
        	return list.get(0);   
        }
		return null;
	}

	 //ɾ��������Ϣ��
	public void delete(Convenience convenience) {
		this.getHibernateTemplate().delete(convenience);      
	}

	//���±�����Ϣ�ķ���
	public void update(Convenience convenience) {   
		this.getHibernateTemplate().update(convenience);     
	}

	//���������Ϣ�ķ���
	public void save(Convenience convenience) {
		this.getHibernateTemplate().save(convenience);   
	}
     
}

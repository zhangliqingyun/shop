package cn.shop.cart2.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.shop.cart2.vo.Cart;

/**
 * ���ﳵ��dao��
 * @author ������
 *
 */
@Repository
public class CartDao extends HibernateDaoSupport{

	//���ݵ�¼�û�Id��ѯ���ﳵ
	public Cart findByUserId(Integer uid) {
		String hql = "from Cart where uid="+uid;  
		List<Cart> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0);    
		}
		return null;
	}

	 //���湺�ﳵ�ķ���
	public void save(Cart cart) {
		this.getHibernateTemplate().save(cart);    
	}

	//���¹��ﳵ
	public void update(Cart cart) {   
		this.getHibernateTemplate().update(cart);   
	}

	//ͨ�����ﳵid��ѯ���ﳵ
	public Cart findByCartId(Integer id) {  
		String hql = "from Cart where id="+id;
		List<Cart> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0);      
		}
		return null;
	}

}

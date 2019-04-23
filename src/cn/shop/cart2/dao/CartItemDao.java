package cn.shop.cart2.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.shop.cart2.vo.CartItem;

/**
 * �������dao��
 * @author ������
 *
 */
@Repository
public class CartItemDao extends HibernateDaoSupport{

	//���湺����
	public void save(CartItem cartItem) {
		this.getHibernateTemplate().save(cartItem);  
	}

	//���¹�����
	public void update(CartItem cartItem) {
		this.getHibernateTemplate().update(cartItem);    
	}

	 //ͨ����Ʒid�͹��ﳵid��ѯ������ 
	public CartItem findByPid(Integer pid, Integer id) {
	    String hql = "from CartItem where pid="+pid+" and cartid="+id;
	    List<CartItem> list = this.getHibernateTemplate().find(hql);
	    if(list != null && list.size()>0){
	    	return list.get(0);   
	    }   
		return null;
	}


	 //��ѯ�ж��ٹ�����
	public Integer findCount(Integer cartId) {
		String hql ="select count(*) from CartItem where cartid= "+cartId;
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();    
		}
		return 0;   
	}

	//ͨ�����ﳵIdȡ��������
	public List<CartItem> findListByCartId(Integer id) {   
		  String hql = "from CartItem where cartid="+id;   
		  List<CartItem> list = this.getHibernateTemplate().find(hql);   
	      return list;  
	}

    //ͬ��id��ѯ������
	public CartItem findById(Integer id) {
		String hql ="from CartItem where id="+id;
		List<CartItem> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0);        
		}
		return null;
	}

	//ɾ��������
	public void delete(CartItem cartItem) {
		this.getHibernateTemplate().delete(cartItem);  
	}

	

}

package cn.shop.cart2.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.shop.cart2.vo.CartItem;

/**
 * 购物项的dao层
 * @author 张立增
 *
 */
@Repository
public class CartItemDao extends HibernateDaoSupport{

	//保存购物项
	public void save(CartItem cartItem) {
		this.getHibernateTemplate().save(cartItem);  
	}

	//更新购物项
	public void update(CartItem cartItem) {
		this.getHibernateTemplate().update(cartItem);    
	}

	 //通过商品id和购物车id查询购物项 
	public CartItem findByPid(Integer pid, Integer id) {
	    String hql = "from CartItem where pid="+pid+" and cartid="+id;
	    List<CartItem> list = this.getHibernateTemplate().find(hql);
	    if(list != null && list.size()>0){
	    	return list.get(0);   
	    }   
		return null;
	}


	 //查询有多少购物项
	public Integer findCount(Integer cartId) {
		String hql ="select count(*) from CartItem where cartid= "+cartId;
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();    
		}
		return 0;   
	}

	//通过购物车Id取出购物项
	public List<CartItem> findListByCartId(Integer id) {   
		  String hql = "from CartItem where cartid="+id;   
		  List<CartItem> list = this.getHibernateTemplate().find(hql);   
	      return list;  
	}

    //同过id查询购物项
	public CartItem findById(Integer id) {
		String hql ="from CartItem where id="+id;
		List<CartItem> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0);        
		}
		return null;
	}

	//删除购物项
	public void delete(CartItem cartItem) {
		this.getHibernateTemplate().delete(cartItem);  
	}

	

}

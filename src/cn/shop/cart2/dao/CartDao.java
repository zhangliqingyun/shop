package cn.shop.cart2.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.shop.cart2.vo.Cart;

/**
 * 购物车的dao层
 * @author 张立增
 *
 */
@Repository
public class CartDao extends HibernateDaoSupport{

	//根据登录用户Id查询购物车
	public Cart findByUserId(Integer uid) {
		String hql = "from Cart where uid="+uid;  
		List<Cart> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0);    
		}
		return null;
	}

	 //保存购物车的方法
	public void save(Cart cart) {
		this.getHibernateTemplate().save(cart);    
	}

	//更新购物车
	public void update(Cart cart) {   
		this.getHibernateTemplate().update(cart);   
	}

	//通过购物车id查询购物车
	public Cart findByCartId(Integer id) {  
		String hql = "from Cart where id="+id;
		List<Cart> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0);      
		}
		return null;
	}

}

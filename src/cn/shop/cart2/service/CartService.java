package cn.shop.cart2.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.cart2.dao.CartDao;
import cn.shop.cart2.vo.Cart;

/**
 * 购物车的service层
 * @author 张立增
 *
 */
@Transactional
@Service
public class CartService {

	//注入dao
	private CartDao cartDao;

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	//根据登录用户Id查询购物车
	public Cart findByUserId(Integer uid) {
		return cartDao.findByUserId(uid);
	}

	 //保存购物车的方法
	public void save(Cart cart) {
		cartDao.save(cart);
	}

	//更新购物车
	public void update(Cart cart) {
		cartDao.update(cart);  
	}

	//通过购物车id查询购物车
	public Cart findByCartId(Integer id) {
		return cartDao.findByCartId(id);
	}
	
	
}

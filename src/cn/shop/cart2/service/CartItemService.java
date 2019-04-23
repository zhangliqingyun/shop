package cn.shop.cart2.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.cart2.dao.CartItemDao;
import cn.shop.cart2.vo.CartItem;

/**
 * 购物项的service层
 * @author 张立增
 *
 */
@Transactional
@Service
public class CartItemService {

	//注入CartItemDao
	private CartItemDao cartItemDao;

	public void setCartItemDao(CartItemDao cartItemDao) {
		this.cartItemDao = cartItemDao;
	}

	//保存购物项
	public void save(CartItem cartItem) {
		cartItemDao.save(cartItem);
	}

	//更新购物项
	public void update(CartItem cartItem) {
		cartItemDao.update(cartItem);
	}

	 //通过商品id和购物车id查询购物项 
	public CartItem findByPid(Integer pid, Integer id) {
		return cartItemDao.findByPid(pid,id);
	}

	 //查询有多少购物项
	public Integer findCount(Integer cartId) {
		return cartItemDao.findCount(cartId);
	}

	//通过购物车Id取出购物项
	public List<CartItem> findListByCartId(Integer id) {
		return cartItemDao.findListByCartId(id);
	}

	 //同过id查询购物项
	public CartItem findById(Integer id) {
		return cartItemDao.findById(id);
	}

	//删除购物项
	public void delete(CartItem cartItem) {
		cartItemDao.delete(cartItem);   
	}

	
	
	
	   
}

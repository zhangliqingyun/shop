package cn.shop.cart2.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.cart2.dao.CartItemDao;
import cn.shop.cart2.vo.CartItem;

/**
 * �������service��
 * @author ������
 *
 */
@Transactional
@Service
public class CartItemService {

	//ע��CartItemDao
	private CartItemDao cartItemDao;

	public void setCartItemDao(CartItemDao cartItemDao) {
		this.cartItemDao = cartItemDao;
	}

	//���湺����
	public void save(CartItem cartItem) {
		cartItemDao.save(cartItem);
	}

	//���¹�����
	public void update(CartItem cartItem) {
		cartItemDao.update(cartItem);
	}

	 //ͨ����Ʒid�͹��ﳵid��ѯ������ 
	public CartItem findByPid(Integer pid, Integer id) {
		return cartItemDao.findByPid(pid,id);
	}

	 //��ѯ�ж��ٹ�����
	public Integer findCount(Integer cartId) {
		return cartItemDao.findCount(cartId);
	}

	//ͨ�����ﳵIdȡ��������
	public List<CartItem> findListByCartId(Integer id) {
		return cartItemDao.findListByCartId(id);
	}

	 //ͬ��id��ѯ������
	public CartItem findById(Integer id) {
		return cartItemDao.findById(id);
	}

	//ɾ��������
	public void delete(CartItem cartItem) {
		cartItemDao.delete(cartItem);   
	}

	
	
	
	   
}

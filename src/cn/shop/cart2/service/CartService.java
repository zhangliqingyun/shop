package cn.shop.cart2.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.cart2.dao.CartDao;
import cn.shop.cart2.vo.Cart;

/**
 * ���ﳵ��service��
 * @author ������
 *
 */
@Transactional
@Service
public class CartService {

	//ע��dao
	private CartDao cartDao;

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	//���ݵ�¼�û�Id��ѯ���ﳵ
	public Cart findByUserId(Integer uid) {
		return cartDao.findByUserId(uid);
	}

	 //���湺�ﳵ�ķ���
	public void save(Cart cart) {
		cartDao.save(cart);
	}

	//���¹��ﳵ
	public void update(Cart cart) {
		cartDao.update(cart);  
	}

	//ͨ�����ﳵid��ѯ���ﳵ
	public Cart findByCartId(Integer id) {
		return cartDao.findByCartId(id);
	}
	
	
}

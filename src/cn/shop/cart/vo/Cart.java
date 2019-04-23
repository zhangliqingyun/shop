package cn.shop.cart.vo;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/*
 * 
 * ��װһ�����ﳵ��
 */
@SuppressWarnings("serial")
public class Cart implements Serializable {

	//�������:keyΪpid,valueΪCartItem
	private Map<Integer,CartItem> map = new LinkedHashMap<Integer,CartItem>();
	//��С��
	private double total;
	
	//�������ת���ɵ���
	public Collection<CartItem> getCartItems(){
		return map.values();
	}
	
	public double getTotal() {
		return total;
	}

	//���ﳵ�Ĺ���
	//1.��ӹ�����
	public void addCart(CartItem cartItem){
		
		//��ȡpid
		Integer pid=cartItem.getProduct().getPid();
		//�жϹ��ﳵ���Ƿ��Ѿ�������ӵĹ�����
		if(map.containsKey(pid)){
			//���ڣ��������������ӣ��ܼ�=�ܼ�+С��
			CartItem _cartItem=map.get(pid);//�õ����ﳵ��ԭ�����ڵĶ���
			_cartItem.setCount(_cartItem.getCount()+cartItem.getCount());//����������=ԭ���Ĺ���������+���ڵĹ�����
			
		}else{
			//�����ڣ���ӹ�����ܼ�=�ܼ�+С��
			map.put(pid, cartItem);
		}
		//������С��
		total+=cartItem.getSubtotal();
	}
	//2.ɾ��������
	public void removeCart(Integer pid){
		//���������Ƴ����ﳵ
		CartItem cartItem=map.remove(pid);
		//�ܼ�=�ܼ�-�Ƴ��������С��
		total-=cartItem.getSubtotal();
	}
	//3.��չ��ﳵ
	public void clearCart(){
		//������й�����
		map.clear();
		//��С����0
		total=0;
	}
}

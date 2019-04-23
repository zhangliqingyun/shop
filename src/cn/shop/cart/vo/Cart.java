package cn.shop.cart.vo;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/*
 * 
 * 封装一个购物车类
 */
@SuppressWarnings("serial")
public class Cart implements Serializable {

	//购物项集合:key为pid,value为CartItem
	private Map<Integer,CartItem> map = new LinkedHashMap<Integer,CartItem>();
	//总小计
	private double total;
	
	//购物项集合转换成单例
	public Collection<CartItem> getCartItems(){
		return map.values();
	}
	
	public double getTotal() {
		return total;
	}

	//购物车的功能
	//1.添加购物项
	public void addCart(CartItem cartItem){
		
		//获取pid
		Integer pid=cartItem.getProduct().getPid();
		//判断购物车中是否已经存在添加的购物项
		if(map.containsKey(pid)){
			//存在：购物项数量增加；总计=总计+小计
			CartItem _cartItem=map.get(pid);//得到购物车中原来存在的对象
			_cartItem.setCount(_cartItem.getCount()+cartItem.getCount());//购物项数量=原来的购物项数量+现在的购物项
			
		}else{
			//不存在：添加购物项；总计=总计+小计
			map.put(pid, cartItem);
		}
		//设置总小计
		total+=cartItem.getSubtotal();
	}
	//2.删除购物项
	public void removeCart(Integer pid){
		//将购物项移除购物车
		CartItem cartItem=map.remove(pid);
		//总计=总计-移除购物项的小计
		total-=cartItem.getSubtotal();
	}
	//3.清空购物车
	public void clearCart(){
		//清空所有购物项
		map.clear();
		//总小计清0
		total=0;
	}
}

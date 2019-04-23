package cn.shop.cart2.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.shop.cart2.service.CartItemService;
import cn.shop.cart2.service.CartService;
import cn.shop.cart2.vo.Cart;
import cn.shop.cart2.vo.CartItem;
import cn.shop.product.service.ProductService;
import cn.shop.product.vo.Product;
import cn.shop.user.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * ���ﳵ��action��
 * @author ������
 *
 */
public class CartAction extends ActionSupport implements ModelDriven<Cart> {

	//ע��ģ��������Ҫ����
	private Cart cart = new Cart();
	
	//ע��service
	private CartService cartService;
	
	//���մ�������pid
	private Integer pid;
    
	//���մ�������count
	private Integer count;  
	
	//ע��productService
	private ProductService productService;

	//ע��cartItemService
	private CartItemService cartItemService;  
	
	public void setCartItemService(CartItemService cartItemService) {
		this.cartItemService = cartItemService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public Cart getModel() {
		return cart;
	}
	
	//��չ��ﳵ�ķ���
	public String clearCart(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser"); //ȡ����¼�û�    
		Cart cart = cartService.findByUserId(user.getUid()); 	     //�����û�id��ѯ�����ﳵ
		List<CartItem> list = cartItemService.findListByCartId(cart.getId());//ͬ�����ﳵid��ѯ������
		if(list != null && list.size()>0){
			for(int i=0;i<list.size();i++){   //����ɾ������ �Ĺ�����   
				cartItemService.delete(list.get(i));        
			}
		}
		cart.setTotal(0);         //���ﳵ���ܼ���Ϊ0  
		cartService.update(cart); //���¹��ﳵ
		return "clearCartSuccess";   
	}   
	
	//չʾ���ﳵ�����еĹ�����ķ���
	public  String list(){
		/**
		 *ͨ����¼�û�ȡ���Լ��Ĺ��ﳵ����ͨ�����ﳵȡ��������
		 */
		//ȡ����¼�û�
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");   
		//���ݵ�¼�û�Id��ѯ���ﳵ   
		cart = cartService.findByUserId(user.getUid()); 
		if(cart == null){     //û�й��ﳵ�򴴽�һ�����ﳵ
			cart = new Cart();
			cart.setUser(user);
			cart.setTotal(0);  
			cartService.save(cart);  //���湺�ﳵ�ķ���
		}
		cart = cartService.findByUserId(user.getUid());  
		List<CartItem> cartItemList = cartItemService.findListByCartId(cart.getId());   //ͨ�����ﳵIdȡ��������
		ActionContext.getContext().put("cartItemList", cartItemList);
		ServletActionContext.getRequest().getSession().setAttribute("cart", cart);     
		return "list";
	}
	//��ӹ��ﳵ�� ����
	public String addCart(){
		Product product = productService.findByPid(pid);  
		//ȡ����¼�û�
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");   
		//���ݵ�¼�û�Id��ѯ���ﳵ
		cart = cartService.findByUserId(user.getUid());   
		if(cart ==null){     //���ﳵ�������򴴽�һ��
			cart = new Cart();
			cart.setUser(user);
			cart.setTotal(count*product.getShop_price());  
			cartService.save(cart);  //���湺�ﳵ�ķ���
			
			//���һ��������
			CartItem cartItem = new CartItem();
			cartItem.setCart(cart);
			cartItem.setNumber(count);
			cartItem.setProduct(product);
			cartItem.setSubtotal(count*product.getShop_price());
			cartItemService.save(cartItem);       //���湺����   
			ServletActionContext.getRequest().getSession().setAttribute("cartItem", cartItem);
		}else{
			CartItem cartItem = cartItemService.findByPid(pid,cart.getId());  //ͨ����Ʒid�͹��ﳵid��ѯ������ 
			if(cartItem == null){
				cartItem = new CartItem();  
				cartItem.setNumber(count);           //����������
				cartItem.setSubtotal(count*product.getShop_price()); //������С�� 
				cartItem.setProduct(product);        //���������Ʒ  
				cartItem.setCart(cart);
				cartItemService.save(cartItem);       //���湺����     
			}else{
				cartItem.setNumber(count+cartItem.getNumber());      //����������=֮ǰ������+���ڵ�����
				cartItem.setSubtotal(count*product.getShop_price()+cartItem.getSubtotal()); //������С�� 
				cartItemService.update(cartItem);   //���¹�����
			}
			 cart.setTotal(cart.getTotal()+count*product.getShop_price()); //���ﳵ���ܼ�
			 cartService.update(cart);   //���¹��ﳵ  
			 ServletActionContext.getRequest().getSession().setAttribute("cartItem", cartItem);
		}
		ServletActionContext.getRequest().getSession().setAttribute("product", product);
		Integer cartitemnumber = cartItemService.findCount(cart.getId());   //ͨ�����ﳵId��ѯ�ж��ٹ�����
		ServletActionContext.getRequest().getSession().setAttribute("cartitemnumber", cartitemnumber);
		
		return "addCartSuccess";   
	}

}

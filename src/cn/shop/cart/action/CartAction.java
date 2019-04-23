package cn.shop.cart.action;

import org.apache.struts2.ServletActionContext;

import cn.shop.cart.vo.Cart;
import cn.shop.cart.vo.CartItem;
import cn.shop.product.service.ProductService;
import cn.shop.product.vo.Product;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 
 * ���ﳵ
 */
public class CartAction extends ActionSupport{
    //����ҳ���ύ��pid
	private Integer pid;
	//����ҳ���ύ��count
	private Integer count;
	//ע��productService
	private ProductService productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	//�����Ʒ�����ﳵ
	public String addCart(){
		//�������������
		CartItem cartItem=new CartItem();
		//��ӹ��������Ʒ��Ϣ
		//����pid��ѯ��Ʒ��Ϣ
		Product product=productService.findByPid(pid);
		cartItem.setProduct(product);
		//��ӹ����������
		cartItem.setCount(count);
		//����������ӵ����ﳵ
		Cart cart=getCart();
		cart.addCart(cartItem);
		return "addCart";
	}

	//��չ��ﳵ�ķ���
	public String clearCart(){
		Cart cart=getCart();
		cart.clearCart();
		return "clearCart";
	}
	
	//ɾ��һ�����
	public String deleteCart(){
		Cart cart=getCart();
		cart.removeCart(pid);
		return "deleteCart";
	}
	
	//��ת�����ﳵ
	public String myCart(){
		return "myCart";
	}
	
	//�õ����ﳵ�ķ���
	private Cart getCart() {
		Cart cart=(Cart)ServletActionContext.getRequest().getSession().getAttribute("cart");
		if(cart ==null){
			cart=new Cart();
			ServletActionContext.getRequest().getSession().setAttribute("cart",cart);
		}
		return cart;
	}
}

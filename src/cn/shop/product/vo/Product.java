package cn.shop.product.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.shop.cart2.vo.CartItem;
import cn.shop.categorysecond.vo.CategorySecond;
import cn.shop.comments.vo.Comments;
import cn.shop.user.vo.User;

/*
 * 
 * 商品的实体对象
 */
public class Product {
	
	private Integer pid;
	private String pname;
	private Double market_price;
	private Double shop_price;
	private String image;
	private String pdesc;
	private Integer is_hot;
	private Date pdate;
	private Integer is_top; //置顶标志（1：置顶）
	private Integer shelves;//上架标志（1：上架)
	private Integer num;
	
	private User user;     //商品和用户为多对一关系
	
	private Set<Comments> comments = new HashSet<Comments>();  //商品与评论为一对多关系
	   
	//二级分类的外键ID
	private CategorySecond categorySecond;   
	
	private CartItem cartItem;            //商品和购物项为一对一关系   
	
	
	public CartItem getCartItem() {
		return cartItem;
	}
	public void setCartItem(CartItem cartItem) {
		this.cartItem = cartItem;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public Set<Comments> getComments() {
		return comments;
	}
	public void setComments(Set<Comments> comments) {
		this.comments = comments;
	}
	public Integer getIs_top() {
		return is_top;
	}
	public void setIs_top(Integer isTop) {
		is_top = isTop;
	}
	public Integer getShelves() {
		return shelves;
	}
	public void setShelves(Integer shelves) {
		this.shelves = shelves;
	}
	
	
	public CategorySecond getCategorySecond() {
		return categorySecond;
	}
	public void setCategorySecond(CategorySecond categorySecond) {
		this.categorySecond = categorySecond;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getMarket_price() {
		return market_price;
	}
	public void setMarket_price(Double marketPrice) {
		market_price = marketPrice;
	}
	public Double getShop_price() {
		return shop_price;
	}
	public void setShop_price(Double shopPrice) {
		shop_price = shopPrice;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public Integer getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(Integer isHot) {
		is_hot = isHot;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
	
}

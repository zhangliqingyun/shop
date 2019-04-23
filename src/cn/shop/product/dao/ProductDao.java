package cn.shop.product.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.product.vo.Product;
import cn.shop.utils.PageHibernateCallback;

/*
 * 商品持久层的代码
 * 
 */
public class ProductDao extends HibernateDaoSupport{

	//首页查询所有热门商品
	public List<Product> findHot() {   
		// 使用离线条件查询.
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		// 查询热门的商品,条件就是is_host = 1
		criteria.add(Restrictions.eq("is_hot", 1));
		criteria.add(Restrictions.eq("shelves", 1));
		// 按时间倒序排序输出:
		criteria.addOrder(Order.desc("pdate"));
		// 执行查询:显示
		List<Product> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}

	//查询首页的最新商品
	public List<Product> findNew() {
		//1.使用离线条件查询
		DetachedCriteria criteria=DetachedCriteria.forClass(Product.class);
		//2.倒序输出
		criteria.addOrder(Order.desc("pdate"));
		criteria.add(Restrictions.eq("shelves", 1));
		//3.执行查询
		List<Product> list=this.getHibernateTemplate().findByCriteria(criteria,0,10);
		return list;
	}

	//根据Pid查询商品信息
	public Product findByPid(Integer pid) {
		return this.getHibernateTemplate().get(Product.class, pid);
	}

	//根据Cid查询商品的总数
	public int findCountCid(Integer cid) {  
		String hql="select count(*) from Product p where p.shelves=1 and p.categorySecond.category.cid=?";
		List<Long> list=this.getHibernateTemplate().find(hql,cid);
		if(list != null &&list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//根据Cid查询需要显示的商品集合
	public List<Product> findByPageCid(Integer cid, int begin, int limit) {
		String hql = "select p from Product p join p.categorySecond cs join cs.category c where p.shelves=1 and c.cid = ?";
		List<Product> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{cid}, begin, limit));
		if(list !=null && list.size()>0){
			return list;
		}
		return null;
	}

	//根据csid查询商品的总数
	public int findCountCsid(Integer csid) {
		String hql="select count(*) from Product p where p.shelves=1 and p.categorySecond.csid=?";
		List<Long> list=this.getHibernateTemplate().find(hql,csid);
		if(list != null &&list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//根据csid查询商品
	public List<Product> findByPageCsid(Integer csid, int begin, int limit) {
		String hql="select p from Product p join p.categorySecond cs where p.shelves=1 and cs.csid=?";
		List<Product> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{csid}, begin, limit));
		if(list !=null && list.size()>0){
			return list;
		}
		return null;
	}

	//查询所有的商品
	public int findCount() {
		String hql=" select count(*) from Product where shelves=1";
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//根据页数查询商品信息
	public List<Product> findByPage(int begin, int limit) {
		String hql=" from Product where shelves=1  order by pdate desc ";
		List<Product> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql,null, begin, limit));
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}

	//保存商品
	public void save(Product product) {
		this.getHibernateTemplate().save(product);
	}

	//删除图片
	public void delete(Product product) {
		this.getHibernateTemplate().delete(product);
	}

	//修改商品
	public void update(Product product) {
		this.getHibernateTemplate().update(product);
	}

	//查询需要审核的集合数量
	public int findCheckCount() {
		String hql=" select count(*) from Product where shelves=0";   
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){  
			return list.get(0).intValue();
		}
		return 0;
	}

	//查询需要审核的集合
	public List<Product> findCheckByPage(int begin, int limit) {
		String hql=" from Product where shelves=0  order by pdate desc ";  
		List<Product> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql,null, begin, limit));
		if(list != null && list.size()>0){
			return list;  
		}
		return null;
	}

	//查询符合搜索内容的数量
	public int findByInputMessageCount(Integer startprice, Integer endprice, String message) {
		String hql = "";
		if(startprice == 1){
			if(endprice == 1){  
				hql="select count(*) from Product where shelves=1 and pname like '%"+message+"%'"; 
			}else{
				hql="select count(*) from Product where shelves=1 and shop_price <"+endprice+" and pname like '%"+message+"%'"; 
			}
		}else{
			if(endprice == 1){
				hql="select count(*) from Product where shelves=1 and shop_price >"+startprice+" and pname like '%"+message+"%'"; 
			}else{
				hql="select count(*) from Product where shelves=1 and shop_price >"+startprice+" and shop_price <"+endprice+" and pname like '%"+message+"%'"; 
			}
		}     
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){  
			return list.get(0).intValue();  
		}
		return 0;
	}

	//查询符合搜索内容的集合
	public List<Product> findByInputMessagePage(Integer startprice, Integer endprice, String message, int begin,int limit) {
		//String hql=" from Product where pname like '%"+message+"%' order by pdate desc ";    
		String hql = "";  
		if(startprice == 1){   
			if(endprice == 1){
				hql=" from Product where shelves=1 and pname like '%"+message+"%' order by is_top desc "; 
			}else{
				hql=" from Product where shelves=1 and shop_price <"+endprice+" and pname like '%"+message+"%' order by is_top desc "; 
			}
		}else{
			if(endprice == 1){    
				hql=" from Product where shelves=1 and shop_price >"+startprice+" and pname like '%"+message+"%' order by is_top desc ";   
			}else{
				hql=" from Product where shelves=1 and shop_price >"+startprice+" and shop_price <"+endprice+" and pname like '%"+message+"%' order by is_top desc "; 
			}
		}        
		List<Product> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql,null, begin, limit));
		if(list != null && list.size()>0){
			return list;
		}
		return null;     
	}

}

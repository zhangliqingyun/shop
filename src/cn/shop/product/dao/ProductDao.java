package cn.shop.product.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.shop.product.vo.Product;
import cn.shop.utils.PageHibernateCallback;

/*
 * ��Ʒ�־ò�Ĵ���
 * 
 */
public class ProductDao extends HibernateDaoSupport{

	//��ҳ��ѯ����������Ʒ
	public List<Product> findHot() {   
		// ʹ������������ѯ.
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		// ��ѯ���ŵ���Ʒ,��������is_host = 1
		criteria.add(Restrictions.eq("is_hot", 1));
		criteria.add(Restrictions.eq("shelves", 1));
		// ��ʱ�䵹���������:
		criteria.addOrder(Order.desc("pdate"));
		// ִ�в�ѯ:��ʾ
		List<Product> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}

	//��ѯ��ҳ��������Ʒ
	public List<Product> findNew() {
		//1.ʹ������������ѯ
		DetachedCriteria criteria=DetachedCriteria.forClass(Product.class);
		//2.�������
		criteria.addOrder(Order.desc("pdate"));
		criteria.add(Restrictions.eq("shelves", 1));
		//3.ִ�в�ѯ
		List<Product> list=this.getHibernateTemplate().findByCriteria(criteria,0,10);
		return list;
	}

	//����Pid��ѯ��Ʒ��Ϣ
	public Product findByPid(Integer pid) {
		return this.getHibernateTemplate().get(Product.class, pid);
	}

	//����Cid��ѯ��Ʒ������
	public int findCountCid(Integer cid) {  
		String hql="select count(*) from Product p where p.shelves=1 and p.categorySecond.category.cid=?";
		List<Long> list=this.getHibernateTemplate().find(hql,cid);
		if(list != null &&list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//����Cid��ѯ��Ҫ��ʾ����Ʒ����
	public List<Product> findByPageCid(Integer cid, int begin, int limit) {
		String hql = "select p from Product p join p.categorySecond cs join cs.category c where p.shelves=1 and c.cid = ?";
		List<Product> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{cid}, begin, limit));
		if(list !=null && list.size()>0){
			return list;
		}
		return null;
	}

	//����csid��ѯ��Ʒ������
	public int findCountCsid(Integer csid) {
		String hql="select count(*) from Product p where p.shelves=1 and p.categorySecond.csid=?";
		List<Long> list=this.getHibernateTemplate().find(hql,csid);
		if(list != null &&list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//����csid��ѯ��Ʒ
	public List<Product> findByPageCsid(Integer csid, int begin, int limit) {
		String hql="select p from Product p join p.categorySecond cs where p.shelves=1 and cs.csid=?";
		List<Product> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{csid}, begin, limit));
		if(list !=null && list.size()>0){
			return list;
		}
		return null;
	}

	//��ѯ���е���Ʒ
	public int findCount() {
		String hql=" select count(*) from Product where shelves=1";
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	//����ҳ����ѯ��Ʒ��Ϣ
	public List<Product> findByPage(int begin, int limit) {
		String hql=" from Product where shelves=1  order by pdate desc ";
		List<Product> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql,null, begin, limit));
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}

	//������Ʒ
	public void save(Product product) {
		this.getHibernateTemplate().save(product);
	}

	//ɾ��ͼƬ
	public void delete(Product product) {
		this.getHibernateTemplate().delete(product);
	}

	//�޸���Ʒ
	public void update(Product product) {
		this.getHibernateTemplate().update(product);
	}

	//��ѯ��Ҫ��˵ļ�������
	public int findCheckCount() {
		String hql=" select count(*) from Product where shelves=0";   
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){  
			return list.get(0).intValue();
		}
		return 0;
	}

	//��ѯ��Ҫ��˵ļ���
	public List<Product> findCheckByPage(int begin, int limit) {
		String hql=" from Product where shelves=0  order by pdate desc ";  
		List<Product> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql,null, begin, limit));
		if(list != null && list.size()>0){
			return list;  
		}
		return null;
	}

	//��ѯ�����������ݵ�����
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

	//��ѯ�����������ݵļ���
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

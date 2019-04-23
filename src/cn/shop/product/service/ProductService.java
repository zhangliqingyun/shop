package cn.shop.product.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.product.dao.ProductDao;
import cn.shop.product.vo.Product;
import cn.shop.utils.PageBean;

/*
 * 
 * 商品业务层的代码
 */
@Transactional
public class ProductService {
	
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	//查询所有的热门商品
	public List<Product> findHot() {
		return productDao.findHot();
	}

	//查询最新商品的方法
	public List<Product> findNew() {
		return productDao.findNew();
	}

	//根据Pid查询商品信息
	public Product findByPid(Integer pid) {
		return productDao.findByPid(pid);
	}

	//根据一级分类cid查询带分页的商品
	public PageBean<Product> findByPageCid(Integer cid, int page) {
		PageBean<Product> pageBean=new PageBean<Product>();
		//设置当前页
	     pageBean.setPage(page);
		//设置记录总条数
	     int totalCount=0;
	     totalCount=productDao.findCountCid(cid);
	     pageBean.setTotalCount(totalCount);
		//设置每页显示的记录条数
	     int limit=8;
	     pageBean.setLimit(limit);
		//设置总页数
	     int totalPage=0;
	     if(totalCount % limit == 0){
	    	 totalPage=totalCount/limit;
	     }else{
	    	 totalPage=totalCount/limit+1;
	     }
	     pageBean.setTotalPage(totalPage);
	     //设置每页显示的商品集合
	     int begin=(page-1)*limit;
	     List<Product> list=productDao.findByPageCid(cid,begin,limit);
	     pageBean.setList(list);
		return pageBean;
	}

	//根据csid和page查询商品
	public PageBean<Product> findByCsid(Integer csid, int page) {
		PageBean<Product> pageBean=new PageBean<Product>();
		//设置当前页
	     pageBean.setPage(page);
		//设置记录总条数
	     int totalCount=0;
	     totalCount=productDao.findCountCsid(csid);
	     pageBean.setTotalCount(totalCount);
		//设置每页显示的记录条数
	     int limit=8;
	     pageBean.setLimit(limit);
		//设置总页数
	     int totalPage=0;
	     if(totalCount % limit == 0){
	    	 totalPage=totalCount/limit;
	     }else{
	    	 totalPage=totalCount/limit+1;
	     }
	     pageBean.setTotalPage(totalPage);
	     //设置每页显示的商品集合
	     int begin=(page-1)*limit;
	     List<Product> list=productDao.findByPageCsid(csid,begin,limit);
	     pageBean.setList(list);
		return pageBean;
	}

	//通过page查询商品
	public PageBean<Product> findByPage(Integer page) {
		PageBean<Product> pageBean=new PageBean<Product>();
		//设置当前页数
		pageBean.setPage(page);
		//设置每页显示的记录数
		int limit=10;
		pageBean.setLimit(limit);
		//设置总的记录数
		int totalCount=productDao.findCount();
		pageBean.setTotalCount(totalCount);
		//设置总的页数
		int totalPage=0;
		if(totalCount % limit ==0){
			totalPage=totalCount/limit;
		}else{
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//设置显示的商品信息集合
		//设置开始的地方
		int begin=(page-1)*limit;
		List<Product> list=productDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//保存商品信息
	public void save(Product product) {
		productDao.save(product);
	}

	//删除图片
	public void delete(Product product) {
		productDao.delete(product);
	}

	//修改商品
	public void update(Product product) {
		productDao.update(product);
	}

	//跳转到审核商品页面的方法
	public PageBean<Product> findCheckList(Integer page) {
		PageBean<Product> pageBean=new PageBean<Product>();
		//设置当前页数
		pageBean.setPage(page);
		//设置每页显示的记录数
		int limit=10;
		pageBean.setLimit(limit);
		//设置总的记录数
		int totalCount=productDao.findCheckCount(); //查询需要审核的集合数量 
		pageBean.setTotalCount(totalCount);
		//设置总的页数
		int totalPage=0;
		if(totalCount % limit ==0){
			totalPage=totalCount/limit;
		}else{
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//设置显示的商品信息集合
		//设置开始的地方
		int begin=(page-1)*limit;
		List<Product> list=productDao.findCheckByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//通过输入框的内容模糊查询商品
	public PageBean<Product> findByInputMessage(Integer startprice, Integer endprice, String message, int page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit);
		int totalCount = 0;
		totalCount = productDao.findByInputMessageCount(startprice,endprice,message);  //查询符合搜索内容的数量
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount/limit;
		}else{
			totalPage = totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);  
		int begin = (page-1)*limit;
		List<Product> list = productDao.findByInputMessagePage(startprice,endprice,message,begin, limit);//查询符合搜索内容的集合
		pageBean.setList(list);
		return pageBean;
	}

	
}

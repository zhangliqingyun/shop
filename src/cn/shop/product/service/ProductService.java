package cn.shop.product.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.product.dao.ProductDao;
import cn.shop.product.vo.Product;
import cn.shop.utils.PageBean;

/*
 * 
 * ��Ʒҵ���Ĵ���
 */
@Transactional
public class ProductService {
	
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	//��ѯ���е�������Ʒ
	public List<Product> findHot() {
		return productDao.findHot();
	}

	//��ѯ������Ʒ�ķ���
	public List<Product> findNew() {
		return productDao.findNew();
	}

	//����Pid��ѯ��Ʒ��Ϣ
	public Product findByPid(Integer pid) {
		return productDao.findByPid(pid);
	}

	//����һ������cid��ѯ����ҳ����Ʒ
	public PageBean<Product> findByPageCid(Integer cid, int page) {
		PageBean<Product> pageBean=new PageBean<Product>();
		//���õ�ǰҳ
	     pageBean.setPage(page);
		//���ü�¼������
	     int totalCount=0;
	     totalCount=productDao.findCountCid(cid);
	     pageBean.setTotalCount(totalCount);
		//����ÿҳ��ʾ�ļ�¼����
	     int limit=8;
	     pageBean.setLimit(limit);
		//������ҳ��
	     int totalPage=0;
	     if(totalCount % limit == 0){
	    	 totalPage=totalCount/limit;
	     }else{
	    	 totalPage=totalCount/limit+1;
	     }
	     pageBean.setTotalPage(totalPage);
	     //����ÿҳ��ʾ����Ʒ����
	     int begin=(page-1)*limit;
	     List<Product> list=productDao.findByPageCid(cid,begin,limit);
	     pageBean.setList(list);
		return pageBean;
	}

	//����csid��page��ѯ��Ʒ
	public PageBean<Product> findByCsid(Integer csid, int page) {
		PageBean<Product> pageBean=new PageBean<Product>();
		//���õ�ǰҳ
	     pageBean.setPage(page);
		//���ü�¼������
	     int totalCount=0;
	     totalCount=productDao.findCountCsid(csid);
	     pageBean.setTotalCount(totalCount);
		//����ÿҳ��ʾ�ļ�¼����
	     int limit=8;
	     pageBean.setLimit(limit);
		//������ҳ��
	     int totalPage=0;
	     if(totalCount % limit == 0){
	    	 totalPage=totalCount/limit;
	     }else{
	    	 totalPage=totalCount/limit+1;
	     }
	     pageBean.setTotalPage(totalPage);
	     //����ÿҳ��ʾ����Ʒ����
	     int begin=(page-1)*limit;
	     List<Product> list=productDao.findByPageCsid(csid,begin,limit);
	     pageBean.setList(list);
		return pageBean;
	}

	//ͨ��page��ѯ��Ʒ
	public PageBean<Product> findByPage(Integer page) {
		PageBean<Product> pageBean=new PageBean<Product>();
		//���õ�ǰҳ��
		pageBean.setPage(page);
		//����ÿҳ��ʾ�ļ�¼��
		int limit=10;
		pageBean.setLimit(limit);
		//�����ܵļ�¼��
		int totalCount=productDao.findCount();
		pageBean.setTotalCount(totalCount);
		//�����ܵ�ҳ��
		int totalPage=0;
		if(totalCount % limit ==0){
			totalPage=totalCount/limit;
		}else{
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//������ʾ����Ʒ��Ϣ����
		//���ÿ�ʼ�ĵط�
		int begin=(page-1)*limit;
		List<Product> list=productDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//������Ʒ��Ϣ
	public void save(Product product) {
		productDao.save(product);
	}

	//ɾ��ͼƬ
	public void delete(Product product) {
		productDao.delete(product);
	}

	//�޸���Ʒ
	public void update(Product product) {
		productDao.update(product);
	}

	//��ת�������Ʒҳ��ķ���
	public PageBean<Product> findCheckList(Integer page) {
		PageBean<Product> pageBean=new PageBean<Product>();
		//���õ�ǰҳ��
		pageBean.setPage(page);
		//����ÿҳ��ʾ�ļ�¼��
		int limit=10;
		pageBean.setLimit(limit);
		//�����ܵļ�¼��
		int totalCount=productDao.findCheckCount(); //��ѯ��Ҫ��˵ļ������� 
		pageBean.setTotalCount(totalCount);
		//�����ܵ�ҳ��
		int totalPage=0;
		if(totalCount % limit ==0){
			totalPage=totalCount/limit;
		}else{
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//������ʾ����Ʒ��Ϣ����
		//���ÿ�ʼ�ĵط�
		int begin=(page-1)*limit;
		List<Product> list=productDao.findCheckByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//ͨ������������ģ����ѯ��Ʒ
	public PageBean<Product> findByInputMessage(Integer startprice, Integer endprice, String message, int page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit);
		int totalCount = 0;
		totalCount = productDao.findByInputMessageCount(startprice,endprice,message);  //��ѯ�����������ݵ�����
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount/limit;
		}else{
			totalPage = totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);  
		int begin = (page-1)*limit;
		List<Product> list = productDao.findByInputMessagePage(startprice,endprice,message,begin, limit);//��ѯ�����������ݵļ���
		pageBean.setList(list);
		return pageBean;
	}

	
}

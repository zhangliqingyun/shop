package cn.shop.categorysecond.service;

import java.util.List;

import cn.shop.categorysecond.dao.CategorySecondDao;
import cn.shop.categorysecond.vo.CategorySecond;
import cn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionSupport;

public class CategorySecondService extends ActionSupport {
	private CategorySecondDao categorySecondDao;

	public void setCategorySecondDao(CategorySecondDao categorySecondDao) {
		this.categorySecondDao = categorySecondDao;
	}

	//��ѯ���еĶ�������
	public PageBean<CategorySecond> findAll(Integer page) {
		PageBean<CategorySecond> pageBean=new PageBean<CategorySecond>();
		//���õ�ǰҳ
		pageBean.setPage(page);
		//����ÿҳ��ʾ�ļ�¼��
		int limit=10;
		pageBean.setLimit(limit);
		//�����ܵļ�¼��
		int totalCount=0;
		totalCount=categorySecondDao.findCount();
		pageBean.setTotalCount(totalCount);
		//�����ܵ�ҳ��
		int  totalPage=0;
		if(totalCount % limit == 0){
			totalPage=totalCount/limit;
		}else{
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//���õ�ǰҳҪ��ʾ�ļ�¼��Ϣ����
		//���ÿ�ʼ��λ��
		int begin=(page-1)*limit;
		List<CategorySecond> list=categorySecondDao.findCategorySecond(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//�����������ķ���
	public void save(CategorySecond categorySecond) {
		categorySecondDao.save(categorySecond);
	}

	//����CSID��ѯҪɾ���Ķ�������
	public CategorySecond findByCsid(Integer csid) {
		return categorySecondDao.findByCsid(csid);
	}

	//ɾ����������ķ���
	public void delete(CategorySecond categorySecond) {
		categorySecondDao.delete(categorySecond);
	}

	//���¶�������ķ���
	public void update(CategorySecond categorySecond) {
		categorySecondDao.update(categorySecond);
	}

	//��ѯ���еĶ�������
	public List<CategorySecond> findAll() {
		return categorySecondDao.findAll();
	}
	
}

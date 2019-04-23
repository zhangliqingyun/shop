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

	//查询所有的二级分类
	public PageBean<CategorySecond> findAll(Integer page) {
		PageBean<CategorySecond> pageBean=new PageBean<CategorySecond>();
		//设置当前页
		pageBean.setPage(page);
		//设置每页显示的记录数
		int limit=10;
		pageBean.setLimit(limit);
		//设置总的记录数
		int totalCount=0;
		totalCount=categorySecondDao.findCount();
		pageBean.setTotalCount(totalCount);
		//设置总的页数
		int  totalPage=0;
		if(totalCount % limit == 0){
			totalPage=totalCount/limit;
		}else{
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//设置当前页要显示的记录信息集合
		//设置开始的位置
		int begin=(page-1)*limit;
		List<CategorySecond> list=categorySecondDao.findCategorySecond(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//保存二级分类的方法
	public void save(CategorySecond categorySecond) {
		categorySecondDao.save(categorySecond);
	}

	//根据CSID查询要删除的二级分类
	public CategorySecond findByCsid(Integer csid) {
		return categorySecondDao.findByCsid(csid);
	}

	//删除二级分类的方法
	public void delete(CategorySecond categorySecond) {
		categorySecondDao.delete(categorySecond);
	}

	//更新二级分类的方法
	public void update(CategorySecond categorySecond) {
		categorySecondDao.update(categorySecond);
	}

	//查询所有的二级分类
	public List<CategorySecond> findAll() {
		return categorySecondDao.findAll();
	}
	
}

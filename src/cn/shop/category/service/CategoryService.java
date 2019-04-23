package cn.shop.category.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.category.dao.CategoryDao;
import cn.shop.category.vo.Category;

/*
 * 
 * 一级菜单的业务层
 */
@Transactional
public class CategoryService {
	private CategoryDao categoryDao;

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	//查询所有一级分类
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	//保存一级分类的方法
	public void save(Category category) {
		categoryDao.save(category);
	}

	//删除一级分类的方法
	public void delete(Category category) {
		categoryDao.delete(category);
	}

	//根据cid查询一级分类
	public Category findByCid(Integer cid) {
		return categoryDao.findByCid(cid);
	}

	//修改一级分类
	public void update(Category category) {
		categoryDao.update(category);
	}

	
}

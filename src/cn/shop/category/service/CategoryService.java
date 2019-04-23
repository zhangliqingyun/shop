package cn.shop.category.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.category.dao.CategoryDao;
import cn.shop.category.vo.Category;

/*
 * 
 * һ���˵���ҵ���
 */
@Transactional
public class CategoryService {
	private CategoryDao categoryDao;

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	//��ѯ����һ������
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	//����һ������ķ���
	public void save(Category category) {
		categoryDao.save(category);
	}

	//ɾ��һ������ķ���
	public void delete(Category category) {
		categoryDao.delete(category);
	}

	//����cid��ѯһ������
	public Category findByCid(Integer cid) {
		return categoryDao.findByCid(cid);
	}

	//�޸�һ������
	public void update(Category category) {
		categoryDao.update(category);
	}

	
}

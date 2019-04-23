package cn.shop.convenience.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.convenience.dao.ConvenienceDao;
import cn.shop.convenience.vo.Convenience;
import cn.shop.utils.PageBean;


/**
 * 便民信息的service层
 * @author 张立增
 *
 */
@Transactional
@Service
public class ConvenienceService {
    
	//注入ConvenienceDao
	private ConvenienceDao convenienceDao;

	public void setConvenienceDao(ConvenienceDao convenienceDao) {
		this.convenienceDao = convenienceDao;
	}

	//查询所有的便民信息
	public List<Convenience> findAll() {
		return convenienceDao.findAll();
	}

	//根据页码查询数据集合
	public PageBean<Convenience> findListByPage(Integer page) {
		PageBean<Convenience> pageBean = new PageBean<Convenience>();
		int limit = 10;
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		int totalCount = 0;
		totalCount = convenienceDao.findTotalCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount/limit;
		}else{
			totalPage = totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		int startIndex = (page-1)*limit;
		List<Convenience> list = convenienceDao.findListByStartAndPage(startIndex,limit);      
		pageBean.setList(list);
		return pageBean;
	}

	//根据id查询便民信息
	public Convenience findById(int id) {
		return convenienceDao.findById(id);
	}

    //删除便民信息类
	public void delete(Convenience convenience) {
		convenienceDao.delete(convenience);
	}

	//更新便民信息的方法
	public void update(Convenience convenience) {
		convenienceDao.update(convenience);
	}

	//保存便民信息的方法
	public void save(Convenience convenience) {
		convenienceDao.save(convenience);
	}
	
	
}

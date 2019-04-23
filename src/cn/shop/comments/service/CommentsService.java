package cn.shop.comments.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.comments.dao.CommentsDao;
import cn.shop.comments.vo.Comments;
import cn.shop.report.vo.Report;
import cn.shop.utils.PageBean;

/**
 * 评论的service层
 * @author 张立增
 *
 */
@Transactional
@Service
public class CommentsService {

	//注入Dao 
	private CommentsDao commentsDao;

	public void setCommentsDao(CommentsDao commentsDao) {
		this.commentsDao = commentsDao;
	}

	//保存评论的方法
	public void save(Comments comments) {
		commentsDao.save(comments);
	}

	//查询所有的评论信息的方法（带分页)
	public PageBean<Comments> findByPage(Integer page) {
		PageBean<Comments> pageBean = new PageBean<Comments>();
		//每页显示的记录条数
		int limit = 10;    
		pageBean.setLimit(limit);
		//设置当前页
		pageBean.setPage(page);
		//设置总的记录条数
		int totalCount = 0;  
		totalCount = commentsDao.findTotalCount();
		pageBean.setTotalCount(totalCount);
		//设置总的页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount/limit;
		}else{
			totalPage = totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//设置开始显示的记录
		int startIndex = (page-1)*limit;
		//设置要显示的记录集合
		List<Comments> list = commentsDao.findListByStartAndLimit(startIndex,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//根据id删除评论的方法
	public Comments findById(Integer id) {
		return commentsDao.findById(id);  
	}

	 //删除评论的方法
	public void delete(Comments comments) {
		commentsDao.delete(comments);
	}

	//根据商品Id查询评论集合
	public List<Comments> findByProductId(Integer pid) {
		return commentsDao.findByProductId(pid);
	}
	
	
	
}

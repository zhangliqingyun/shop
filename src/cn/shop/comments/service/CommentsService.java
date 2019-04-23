package cn.shop.comments.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.comments.dao.CommentsDao;
import cn.shop.comments.vo.Comments;
import cn.shop.report.vo.Report;
import cn.shop.utils.PageBean;

/**
 * ���۵�service��
 * @author ������
 *
 */
@Transactional
@Service
public class CommentsService {

	//ע��Dao 
	private CommentsDao commentsDao;

	public void setCommentsDao(CommentsDao commentsDao) {
		this.commentsDao = commentsDao;
	}

	//�������۵ķ���
	public void save(Comments comments) {
		commentsDao.save(comments);
	}

	//��ѯ���е�������Ϣ�ķ���������ҳ)
	public PageBean<Comments> findByPage(Integer page) {
		PageBean<Comments> pageBean = new PageBean<Comments>();
		//ÿҳ��ʾ�ļ�¼����
		int limit = 10;    
		pageBean.setLimit(limit);
		//���õ�ǰҳ
		pageBean.setPage(page);
		//�����ܵļ�¼����
		int totalCount = 0;  
		totalCount = commentsDao.findTotalCount();
		pageBean.setTotalCount(totalCount);
		//�����ܵ�ҳ��
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount/limit;
		}else{
			totalPage = totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//���ÿ�ʼ��ʾ�ļ�¼
		int startIndex = (page-1)*limit;
		//����Ҫ��ʾ�ļ�¼����
		List<Comments> list = commentsDao.findListByStartAndLimit(startIndex,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//����idɾ�����۵ķ���
	public Comments findById(Integer id) {
		return commentsDao.findById(id);  
	}

	 //ɾ�����۵ķ���
	public void delete(Comments comments) {
		commentsDao.delete(comments);
	}

	//������ƷId��ѯ���ۼ���
	public List<Comments> findByProductId(Integer pid) {
		return commentsDao.findByProductId(pid);
	}
	
	
	
}

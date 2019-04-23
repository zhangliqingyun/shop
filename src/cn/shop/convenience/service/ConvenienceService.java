package cn.shop.convenience.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.convenience.dao.ConvenienceDao;
import cn.shop.convenience.vo.Convenience;
import cn.shop.utils.PageBean;


/**
 * ������Ϣ��service��
 * @author ������
 *
 */
@Transactional
@Service
public class ConvenienceService {
    
	//ע��ConvenienceDao
	private ConvenienceDao convenienceDao;

	public void setConvenienceDao(ConvenienceDao convenienceDao) {
		this.convenienceDao = convenienceDao;
	}

	//��ѯ���еı�����Ϣ
	public List<Convenience> findAll() {
		return convenienceDao.findAll();
	}

	//����ҳ���ѯ���ݼ���
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

	//����id��ѯ������Ϣ
	public Convenience findById(int id) {
		return convenienceDao.findById(id);
	}

    //ɾ��������Ϣ��
	public void delete(Convenience convenience) {
		convenienceDao.delete(convenience);
	}

	//���±�����Ϣ�ķ���
	public void update(Convenience convenience) {
		convenienceDao.update(convenience);
	}

	//���������Ϣ�ķ���
	public void save(Convenience convenience) {
		convenienceDao.save(convenience);
	}
	
	
}

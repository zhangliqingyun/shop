package cn.shop.returnmessage.service;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.returnmessage.dao.ReturnMessageDao;
import cn.shop.returnmessage.vo.ReturnMessage;
import cn.shop.utils.PageBean;

/**
 * ������Ϣ��ҵ���
 * @author ������
 *
 */
@Transactional
public class ReturnMessageService {

	//ע��ReturnMessageDao
	private ReturnMessageDao returnMessageDao;

	public void setReturnMessageDao(ReturnMessageDao returnMessageDao) {
		this.returnMessageDao = returnMessageDao;
	}

	//���淴����Ϣ�ķ���
	public void save(String content,String contact) {
		//ʵ����������Ϣ
		ReturnMessage returnMessage = new ReturnMessage();
		returnMessage.setContent(content);
		returnMessage.setReturndate(new Date());
		returnMessage.setContact(contact);   
		//���淴����Ϣ
		returnMessageDao.save(returnMessage);
	}

	//��ѯ���еķ�����Ϣ
	public PageBean<ReturnMessage> findAllReturnMessage(Integer page) {
		PageBean<ReturnMessage> pageBean = new PageBean<ReturnMessage>();
		//ÿҳ��ʾ�ļ�¼����
		int limit = 10;    
		pageBean.setLimit(limit);
		//���õ�ǰҳ
		pageBean.setPage(page);
		//�����ܵļ�¼����
		int totalCount = 0;  
		totalCount = returnMessageDao.findTotalCount();
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
		List<ReturnMessage> list = returnMessageDao.findListByStartAndLimit(startIndex,limit);
		pageBean.setList(list);
		return pageBean;
	}

}

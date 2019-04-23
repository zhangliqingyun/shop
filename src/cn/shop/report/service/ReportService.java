package cn.shop.report.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.report.dao.ReportDao;
import cn.shop.report.vo.Report;
import cn.shop.returnmessage.vo.ReturnMessage;
import cn.shop.utils.PageBean;

/**
 * �ٱ����service��
 * @author ������
 *
 */
@Service
@Transactional
public class ReportService {

	//ע��dao
	private ReportDao reportDao;  

	public void setReportDao(ReportDao reportDao) {
		this.reportDao = reportDao;
	}

	//����ٱ���Ϣ�ķ���
	public void save(Report report) {
		reportDao.save(report);
	}

	//��ѯ���еľٱ���Ϣ����ҳ�ķ���
	public PageBean<Report> findListByPage(Integer page) {
		PageBean<Report> pageBean = new PageBean<Report>();
		//ÿҳ��ʾ�ļ�¼����
		int limit = 10;    
		pageBean.setLimit(limit);
		//���õ�ǰҳ
		pageBean.setPage(page);
		//�����ܵļ�¼����
		int totalCount = 0;  
		totalCount = reportDao.findTotalCount();
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
		List<Report> list = reportDao.findListByStartAndLimit(startIndex,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//����Id���Ҿٱ���Ϣ
	public Report findById(Integer id) {
		return reportDao.findById(id);
	}

	//���¾ٱ���Ϣ
	public void update(Report report) {
		reportDao.update(report);
	}
	
	

}

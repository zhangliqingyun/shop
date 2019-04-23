package cn.shop.report.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shop.report.dao.ReportDao;
import cn.shop.report.vo.Report;
import cn.shop.returnmessage.vo.ReturnMessage;
import cn.shop.utils.PageBean;

/**
 * 举报类的service层
 * @author 张立增
 *
 */
@Service
@Transactional
public class ReportService {

	//注入dao
	private ReportDao reportDao;  

	public void setReportDao(ReportDao reportDao) {
		this.reportDao = reportDao;
	}

	//保存举报信息的方法
	public void save(Report report) {
		reportDao.save(report);
	}

	//查询所有的举报信息带分页的方法
	public PageBean<Report> findListByPage(Integer page) {
		PageBean<Report> pageBean = new PageBean<Report>();
		//每页显示的记录条数
		int limit = 10;    
		pageBean.setLimit(limit);
		//设置当前页
		pageBean.setPage(page);
		//设置总的记录条数
		int totalCount = 0;  
		totalCount = reportDao.findTotalCount();
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
		List<Report> list = reportDao.findListByStartAndLimit(startIndex,limit);
		pageBean.setList(list);
		return pageBean;
	}

	//根据Id查找举报信息
	public Report findById(Integer id) {
		return reportDao.findById(id);
	}

	//更新举报信息
	public void update(Report report) {
		reportDao.update(report);
	}
	
	

}

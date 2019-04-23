package cn.shop.returnmessage.service;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.returnmessage.dao.ReturnMessageDao;
import cn.shop.returnmessage.vo.ReturnMessage;
import cn.shop.utils.PageBean;

/**
 * 反馈信息的业务层
 * @author 张立增
 *
 */
@Transactional
public class ReturnMessageService {

	//注入ReturnMessageDao
	private ReturnMessageDao returnMessageDao;

	public void setReturnMessageDao(ReturnMessageDao returnMessageDao) {
		this.returnMessageDao = returnMessageDao;
	}

	//保存反馈信息的方法
	public void save(String content,String contact) {
		//实例化反馈信息
		ReturnMessage returnMessage = new ReturnMessage();
		returnMessage.setContent(content);
		returnMessage.setReturndate(new Date());
		returnMessage.setContact(contact);   
		//保存反馈信息
		returnMessageDao.save(returnMessage);
	}

	//查询所有的反馈信息
	public PageBean<ReturnMessage> findAllReturnMessage(Integer page) {
		PageBean<ReturnMessage> pageBean = new PageBean<ReturnMessage>();
		//每页显示的记录条数
		int limit = 10;    
		pageBean.setLimit(limit);
		//设置当前页
		pageBean.setPage(page);
		//设置总的记录条数
		int totalCount = 0;  
		totalCount = returnMessageDao.findTotalCount();
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
		List<ReturnMessage> list = returnMessageDao.findListByStartAndLimit(startIndex,limit);
		pageBean.setList(list);
		return pageBean;
	}

}

package cn.shop.utils;

import java.util.List;

/*
 * 
 * ��װһ����ҳ��
 */
public class PageBean<T>{
	 //��ǰҳ��
	private int page;
	//��¼������
	private int totalCount;
	//ÿҳ��ʾ��¼����
	private int limit;
	//��ҳ��
	private int totalPage;
	//ÿҳ��ʾ���ݵļ�¼����
	private List<T> list;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}

package cn.shop.utils;

import java.util.List;

/*
 * 
 * 封装一个分页类
 */
public class PageBean<T>{
	 //当前页数
	private int page;
	//记录总条数
	private int totalCount;
	//每页显示记录条数
	private int limit;
	//总页数
	private int totalPage;
	//每页显示内容的记录集合
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

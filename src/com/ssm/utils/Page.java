package com.ssm.utils;
/**
 * 分页实体bean
 * @author wangwei
 *
 */
public class Page {
	
	//总条数
	private int totalRows;
	
	//当前页
	private int pageNo;
	
	//每页显示条数
	private int pagesize;

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

}

package com.ssm.controller;

import javax.servlet.http.HttpServletRequest;

public class PageController {

	/**
	 * 获取当前页
	 * @param request
	 * @return
	 */
	public int getPageNo(HttpServletRequest request){
		int parseInt = Integer.parseInt(request.getParameter("pager.pageNo"));
		
		return parseInt;
	}
	
	public int getPageSize(HttpServletRequest request){
		int parseInt = Integer.parseInt(request.getParameter("pager.pageSize"));
		return parseInt;
	}
}

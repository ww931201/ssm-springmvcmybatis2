package com.ssm.interceptors;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ssm.po.User;

public class SecurityInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = Logger.getLogger(SecurityInterceptor.class);

	private List<String> excludeUrls;

	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

	/**
	 * 完成页面的render后调用
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {

	}

	/**
	 * 在调用controller具体方法后拦截
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception {

	}

	/**
	 * 在调用controller具体方法前拦截
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		
	/*	String requestURI = request.getRequestURI();//	/ssm-springmvcmybatis/ItemList
		String contextPath = request.getContextPath();//	/ssm-springmvcmybatis
		String url = requestURI.substring(contextPath.length());// /ItemList
		//如果有在spring-mvc.xml中配置不拦截的直接返回true
		//excludeUrls在spring-mvc.xml的<property name="excludeUrls">配置一个list集合
		//excludeUrls表示不拦截的list，直接返回true
		
		if(requestURI.indexOf("login.action") >=0){ 
			return true;
		}
		
		Object users = request.getSession().getAttribute("user");
		if(users==null){
			request.getRequestDispatcher("/system/login/login.jsp").forward(request, response);
			return false;
		}
		
		if (!excludeUrls.contains(url)) {
			return true;
		}else{
			//如果是拦截的url地址需要判断session中获取user对象
			
			Object user = request.getSession().getAttribute("user");
			
			if(user==null){
				//session过期了
				request.setAttribute("msg", "您没有访问此资源的权限！<br/>请联系超管赋予您<br/>[" + url + "]<br/>的资源访问权限！");
				request.getRequestDispatcher("/WEB-INF/error/noSecurity.jsp").forward(request, response);
				return false;
			}else{
				//session没有过期
				//user去数据库获取对应的权限查询url地址
				if(user.getId().getRoleId.getPermissions){有权限返回return true;
					return true;
				}else{//没有权限则跳转页面返回false
					request.setAttribute("msg", "您没有访问此资源的权限！<br/>请联系超管赋予您<br/>[" + url + "]<br/>的资源访问权限！");
					request.getRequestDispatcher("/WEB-INF/error/noSecurity.jsp").forward(request, response);
					return false;
				}
				return false;
			}
		}*/
		
		/**方式二*/
		
		String requestURI = request.getRequestURI();//	/ssm-springmvcmybatis/ItemList
		String contextPath = request.getContextPath();//	/ssm-springmvcmybatis
		String url = requestURI.substring(contextPath.length());// /ItemList
		//如果有在spring-mvc.xml中配置不拦截的直接返回true
		//excludeUrls在spring-mvc.xml的<property name="excludeUrls">配置一个list集合
		//excludeUrls表示不拦截的list，直接返回true
		
		User user = (User) request.getSession().getAttribute("user");
		
		if(excludeUrls.contains(url)){
			return true; 
		}else{
			
			if(requestURI.indexOf("login.action") >= 0){
				return true;
			}
			if(requestURI.indexOf("loginUser.action") >= 0){
				return true;
			}
			if(user==null){
				request.getRequestDispatcher("/system/login/login.jsp").forward(request, response);
				return false;
				
			}else{
				return true;
			}
		}
		
	}
}

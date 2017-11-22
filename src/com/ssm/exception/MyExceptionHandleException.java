package com.ssm.exception;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 自定义异常处理器
 * @author wangwei
 * 实现异常处理器HandlerExceptionResolver，重写resolveException方法
 * 
 * 
 * 异常处理器配置:在springmvc中配置
 */
public class MyExceptionHandleException implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception exception) {
		//定义异常信息
		String msg = "";
		
		// 如果是自定义异常，读取异常信息
		if(exception instanceof MyException){
			
			msg = exception.getMessage();
			
		}else{
			// 如果是运行时异常，则取错误堆栈，从堆栈中获取异常信息
			Writer out = new StringWriter();
			PrintWriter s = new PrintWriter(out);
			exception.printStackTrace(s);
			msg = out.toString();
		}
		
		// 返回错误页面，给用户友好页面显示错误信息
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("msg", msg);
		modelAndView.setViewName("error");
		
		return modelAndView;
	}
	

}

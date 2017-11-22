package com.ssm.exception;

/**
 * 
 * 
 * 自定义异常类
 * 
 * @author wangwei
 *
 */
public class MyException extends Exception{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	//定义异常信息
	private String msg;

	public MyException(String msg) {
		super();
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public MyException() {
		super();
	}

}

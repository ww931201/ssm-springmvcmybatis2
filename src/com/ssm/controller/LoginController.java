package com.ssm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.po.User;
import com.ssm.service.UserService;

@Controller
public class LoginController{
	
	@Autowired
	private UserService userService;
	/**
	 * 首次进入跳转到登录页面
	 * @return
	 */
	@RequestMapping("/login")
	public String login(){
		
		
		return "login/login";
	}
	
	/**
	 * 登录用户名密码验证
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loginUser")
	public User loginUser(User user,HttpServletRequest request,HttpSession session){
		
		/*String username = user.getUsername();
		  String password = user.getPassword();
		System.out.println(username + " - " + password);
		Map<String, String> map = new HashMap<String, String>();
		if(username.equals("xiaoxu") && password.equals("2134")){
			session.setAttribute("user", user); 
			map.put("status", "true");
		}else{
			map.put("status", "false");
			map.put("message", "用户名或密码错误"); 
		}
		 return map;*/
		 User users = new User();
		 User userResult = userService.findUser(user);
		 
		 if(userResult!=null){
			 session.setAttribute("user", user);
			 users.setStatus("true");
		 }else{
			 users.setStatus("false");
			 users.setMessage("用户名或密码错误，请核对后进行登录");
		 }
		 return users;
	}
	
	@RequestMapping("/PageList")
	public String PageList (){
		
		return "main";
	}
	
	/**
	 * 退出登录，清除session
	 * @return
	 */
	@RequestMapping("/LogOut")
	public String LogOut(HttpServletRequest request,HttpSession session){
		//获取session，从request获取，或者直接从session获取
		//1.request.getSession().removeAttribute("user");
		
		session.removeAttribute("user");
		return "redirect:/login.action";
	} 

}

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>系统-登录</title>
<link href="/system/login/skin16/style.css" rel="stylesheet" type="text/css" id="skin"/>
<script type="text/javascript" src="/libs/js/jquery.js"></script>
<script type="text/javascript" src="/libs/js/login.js"></script>

<!--居中显示start-->
<script type="text/javascript" src="/libs/js/method/center-plugin.js"></script>
<!--居中显示end-->
<style>
/*提示信息*/	
#cursorMessageDiv {
	position: absolute;
	z-index: 99999;
	border: solid 1px #cc9933;
	background: #ffffcc;
	padding: 2px;
	margin: 0px;
	display: none;
	line-height:150%;
}
/*提示信息*/
</style>
<script type="text/javascript">
	var  themeColor = window.localStorage.getItem("qui_theme");
	if (themeColor != null) document.cookie="qui_theme="+themeColor;

	//var b = true;
	// 禁止登录页内嵌
	if (window != top){
		parent.location.href = location.href; 
	}

	var UA = navigator.userAgent.toLowerCase();

    var browerKernel = {
        isWebkit: function() {
            if (/webkit/i.test(UA)) return true;
            else return false;
        },
	    isFirefox: function() {
            if (/firefox/i.test(UA)) return true;
            else return false;
		}
    }
</script>
</head>
<body >
	<div class="login_main">
		<div class="login_top">
			<div class="login_title"></div>
		</div>
		<div class="login_middle">
			<div class="login_middleleft"></div>
			<div class="login_middlecenter">
					<form id="loginForm" action="login.do" class="login_form" method="post">
					<div class="login_user"><input name="username" type="text" id="username"></div>
					<div class="login_pass"><input name="password" type="password" id="password"></div>
					<div class="clear"></div> 
					<div class="login_button">
						<div class="login_button_left"><input type="button" onclick="login()"/></div>
						<div class="login_button_right"><input type="reset" value=""/></div>
						<div style="width: 150px; margin-left: 270px">
						</div>
						<div class="clear"></div>
					</div>
					</form>
					<div class="login_info" style="display:none;"></div>
			</div>
			<div class="login_middleright"></div>
			<div class="clear"></div>
		</div> 
		<div class="login_bottom">
			<div class="login_copyright">版权所有 ©：小王工作室</div>
		</div>
	</div>
<script>
	$(function(){
		//居中
		 $('.login_main').center();
		 document.getElementById("username").focus();
		 $("#username").keydown(function(event){
		 	if(event.keyCode==13){
				login()
			}
		 })
		 $("#password").keydown(function(event){
		 	if(event.keyCode==13){
				login()
			}
		 })
		 
	})

	//登录
	function login() {
		var errorMsg = "";
		var loginName = document.getElementById("username");
		var password = document.getElementById("password");
		if(!loginName.value){
			errorMsg += "&nbsp;&nbsp;用户名不能为空!";
		}
		if(!password.value){
			errorMsg += "&nbsp;&nbsp;密码不能为空!";
		}

		if(errorMsg != ""){
			$(".login_info").html(errorMsg);
			$(".login_info").show();
		}
		else{
			$(".login_info").show();
			$(".login_info").html("&nbsp;&nbsp;正在登录中...");
			//登录处理
			$.post("/loginUser.action",
				  $("#loginForm").serialize(),
				  function(result){
					  console.log(result);
					  if(result == null){
						  $(".login_info").html("&nbsp;&nbsp;登陆失败！");
						  return false;
					  }
					  if(result.status=="true"||result.status==true){
					  	  $(".login_info").html("&nbsp;&nbsp;登录成功，正在转到主页...");
						  window.location="/PageList.action";  
					  }
					  else{
					  	 $(".login_info").html("&nbsp;&nbsp;"+result.message);
					  }
					  
				  },"json");
		}
	}
</script>
</body>
</html>




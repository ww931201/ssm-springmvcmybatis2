<%@page import="java.nio.file.Path"%>
<%@page language="java" pageEncoding="UTF-8"%>
<%
	String Path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ Path + "/"; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--框架必需start-->
<script type="text/javascript" src="<%=basePath%>/libs/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>/libs/js/language/cn.js"></script>
<script type="text/javascript" src="<%=basePath%>/libs/js/framework.js"></script>
<link href="<%=basePath%>/libs/css/import_basic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>/"/>
<link rel="stylesheet" type="text/css" id="customSkin"/>
<!--框架必需end-->

<!-- 日期控件start -->
<script type="text/javascript" src="<%=basePath%>/libs/js/form/datePicker/WdatePicker.js"></script>
<!-- 日期控件end -->

<!-- 树组件start -->
<script type="text/javascript" src="<%=basePath%>/libs/js/tree/ztree/ztree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=basePath%>/libs/js/tree/ztree/ztree.css"></link>
<!-- 树组件end -->

<!-- 树形下拉框start -->
<script type="text/javascript" src="<%=basePath%>/libs/js/form/selectTree.js"></script>
<!-- 树形下拉框end -->

<!-- 表单验证start -->
<script src="<%=basePath%>/libs/js/form/validationRule.js" type="text/javascript"></script>
<script src="<%=basePath%>/libs/js/form/validation.js" type="text/javascript"></script>
<!-- 表单验证end -->

<!-- 表单异步提交start -->
<script src="<%=basePath%>/libs/js/form/form.js" type="text/javascript"></script>
<!-- 表单异步提交end -->
<style>
.textinput{
	width:300px;
}
</style>
</head>
<body>
	<form id="myFormId" action="<%=basePath%>/saveUser.action" method="post" target="frmright">
	<div class="box1" id="formContent" whiteBg="true">
	<table class="tableStyle" formMode="transparent">
		<input type="hidden" name="userinfor.userId" value="" />
		<tr>
			<td width="250">标题：</td>
			<td>
			<input type="text" name="userinfor.userLoginName" value="" class="validate[required,custom[noSpecialCaracters]]" watermark="请输入英文或数字"/><span class="star">*</span>
			</td>
		</tr>
		<tr>
			<td width="150">分类：</td>
			<td>
			<input type="text" name="userinfor.userLoginName" value="" class="validate[required,custom[noSpecialCaracters]]" watermark="请输入英文或数字"/><span class="star">*</span>
			</td>
		</tr>
		<tr>
			<td width="150">游玩时间：</td>
			<td>
			<input type="text" name="userinfor.userLoginName" value="" class="validate[required,custom[noSpecialCaracters]]" watermark="请输入英文或数字"/><span class="star">*</span>
			</td>
		</tr>
		<tr>
			<td width="150">地点：</td>
			<td>
			<input type="text" name="userinfor.userLoginName" value="" class="validate[required,custom[noSpecialCaracters]]" watermark="请输入英文或数字"/><span class="star">*</span>
			</td>
		</tr>
		<tr>
			<td width="150">作者：</td>
			<td>
			<input type="text" name="userinfor.userLoginName" value="" class="validate[required,custom[noSpecialCaracters]]" watermark="请输入英文或数字"/><span class="star">*</span>
			</td>
		</tr>
		<tr>
			<td width="150">正文内容：</td>
			<td>
			<input type="text" name="userinfor.userLoginName" value="" class="validate[required,custom[noSpecialCaracters]]" watermark="请输入英文或数字"/><span class="star">*</span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="提交"/>
				<input type="button" value="取消" onclick="top.Dialog.close()"/>
			</td>
		</tr>
	</table>
	</div>
	</form>
<!-- 异步提交start -->
<script type="text/javascript">
function initComplete(){
    //表单提交
    $('#myFormId').submit(function(){ 
	    //判断表单的客户端验证是否通过
			var valid = $('#myFormId').validationEngine({returnIsValid: true});
			if(valid){
			   $(this).ajaxSubmit({
			        //表单提交成功后的回调
			        success: function(responseText, statusText, xhr, $form){
			            top.Dialog.alert(responseText.message,function(){
			            	closeWin();
			            })
			        }
			    }); 
			 }
		    //阻止表单默认提交事件
		    return false; 
	});
}

//重置
function closeWin(){
	var update = false;
	var isupdate = '<s:property value="userinfor.userId"/>';
	if(isupdate != ''){
		update = true;
	}else{
		update = false;
	}
	//刷新数据
	top.frmright.refresh(update);
	//关闭窗口
	top.Dialog.close();
}
</script>
<!-- 异步提交end -->	
</body>
</html>
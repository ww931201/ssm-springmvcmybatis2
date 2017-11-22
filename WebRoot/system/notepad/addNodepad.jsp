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

<!-- 日期选择框start -->
<script type="text/javascript" src="<%=basePath%>/libs/js/form/datePicker/WdatePicker.js"></script>
<!-- 日期选择框end -->
<style>
/*文本框样式*/
.textinput{
	width:600px;
	height: 30px;
	line-height: 30px;
}
.textinput_hover{
	width:600px;
	height: 30px;
	line-height: 30px;
}
.textinput_click{
	width:600px;
	height: 30px;
	line-height: 30px;
}
.tableStyle tr td{
	font-size: 13px;
}
</style>
<script type="text/javascript" charset="utf-8" src="<%=basePath%>libs/thirdparty/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=basePath%>libs/thirdparty/ueditor/ueditor.all.js"></script>

<!--ueEditor编辑器start-->
</head>
<body>
	<form id="myFormId"  method="post"  onsubmit="return false;">
	<div class="box1" id="formContent" whiteBg="true">
	<table class="tableStyle" formMode="transparent">
		<input type="hidden" name="" value="" />
		<tr>
			<td width="100">标题：</td> 
			<td>
			<input type="text" name="headlined" value="${notepad.headlined}" class="" watermark=""/>
			</td>
		</tr>
		<tr>
			<td width="100">分类：</td>
			<td>
			<input type="text" name="classifies" value="${notepad.classifies}" class="" watermark=""/>
			</td>
		</tr>
		<tr>
			<td width="100">游玩时间：</td>
			<td>
			<input type="text" name="playtime"  value="${notepad.playtime}" class="date" style="width:200px;" dateFmt="yyyy-MM-dd HH:mm:ss" class="validate[required]"/><span class="star">*</span></td>
			</td>
		</tr>
		<tr>
			<td width="100">地点：</td>
			<td>
			<input type="text" name="sitename" value="${notepad.sitename}" class="" watermark=""/>
			</td>
		</tr>
		<tr>
			<td width="100">作者：</td>
			<td>
			<input type="text" name="author" value="${notepad.author}" class="" watermark=""/>
			</td>
		</tr>
		<tr>
			<td width="100">正文内容：</td>
			<td>
				  <!-- 加载编辑器的容器 -->
			    <script id="container" name="content" type="text/plain">
					${notepad.content}
   				 </script>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="submitHandler()">提交</button>
				<input type="button" value="取消" onclick="top.Dialog.close()"/>
			</td>
		</tr>
	</table>
	</div>
	</form>
<!-- 异步提交start -->
<script type="text/javascript">
function submitHandler() {
	console.log($('#myFormId').serializeArray());
	var valid = $('#myFormId').validationEngine({returnIsValid: true});
	if(valid){
		$.post("<%=basePath%>saveNodepad.action", $('#myFormId').serializeArray(), function(data) {
			console.log(data);
			top.Dialog.alert(data.message, function(){
            	if(!data.content){		            		
	            	closeWin();
            	} else {
            		top.Dialog.alert(data.content);
            	}
            })
		});
	 }else{
		 top.Dialog.alert('表单填写不正确，请按要求修改红色框内容!');
		} 
	
}

function initComplete(){
}

//重置
function closeWin(){
	var update = false;
	var isupdate = '';
	if(isupdate != ''){
		update = true;
	}else{
		update = false;
	}
	//刷新数据
	//top.frmright.refresh(update);
	top.frmright.document.getElementsByTagName("iframe")[1].contentWindow.refresh(update);
	//关闭窗口
	top.Dialog.close();
}
</script>

<script type="text/javascript">
       // 自定义的编辑器配置项,此处定义的配置项将覆盖editor_config.js中的同名配置
       var ue = UE.getEditor('container');
       /* ue.ready(function() {
           //设置编辑器的内容
           ue.setContent('hello');
           //获取html内容，返回: <p>hello</p>
           var html = ue.getContent();
           //获取纯文本内容，返回: hello
           var txt = ue.getContentTxt();
       }); */
</script>
			    
</body>
</html>
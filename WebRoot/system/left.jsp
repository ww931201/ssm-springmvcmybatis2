<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--框架必需start-->
<script type="text/javascript" src="../../libs/js/jquery.js"></script>
<script type="text/javascript" src="../../libs/js/language/cn.js"></script>
<script type="text/javascript" src="../../libs/js/framework.js"></script>
<link href="../../libs/css/import_basic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" id="skin" prePath="../../" scrollerY="false"/>
<link rel="stylesheet" type="text/css" id="customSkin"/>
<!--框架必需end-->

<!-- 树型抽屉导航start-->
<script type="text/javascript" src="../../libs/js/tree/ztree/ztree.js"></script>
<link href="../../libs/js/tree/ztree/ztree.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../libs/js/nav/treeAccordion_addtab.js"></script>
<!-- 树型抽屉导航end -->
<script type="text/javascript">
	var zNodes =[
		{ id:3001, parentId:0, name:"我的空间",icon:"skin/click.gif"},
		{ id:101, parentId:3001, name:"主页",tabUrl:"<%=basePath%>ItemList.action", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		{ id:102, parentId:3001, name:"记事本",tabUrl:"<%=basePath%>ToNotepad.action", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		{ id:103, parentId:3001, name:"相册",tabUrl:"../../sample_skin/normal/form-pop.html", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		{ id:104, parentId:3001, name:"视频",tabUrl:"../../sample_skin/normal/form-pop.html", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		{ id:105, parentId:3001, name:"消费记录",tabUrl:"../../sample_skin/normal/form-pop.html", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		{ id:106, parentId:3001, name:"个人档",tabUrl:"../../sample_skin/normal/form-pop.html", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		{ id:107, parentId:3001, name:"留言板",tabUrl:"../../sample_skin/normal/form-pop.html", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		{ id:108, parentId:3001, name:"个人中心",tabUrl:"../../sample_skin/normal/form-pop.html", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		
		/* { id:3002, parentId:0, name:"表格模板",icon:"skin/click.gif"},
		{ id:201, parentId:3002, name:"页面中的grid表格",tabUrl:"../../sample_skin/normal/grid-page.html", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		{ id:202, parentId:3002, name:"弹窗中的grid表格",tabUrl:"../../sample_skin/normal/grid-pop.html", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		{ id:203, parentId:3002, name:"页面中的table表格",tabUrl:"../../sample_skin/normal/table-page.html", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"},
		{ id:204, parentId:3002, name:"弹窗中的table表格",tabUrl:"../../sample_skin/normal/table-pop.html", target:"frmright",iconOpen:"../../libs/icons/tree_close.gif",iconClose:"../../libs/icons/tree_open.gif",icon:"skin/titlebar_arrow.gif"} */
		
	];
	var fixedObj=60;
	function customHeightSet(contentHeight){
		$("#scrollContent").height(contentHeight-fixedObj);
	}
</script>
</head>
<body leftFrame="true">
<div class="padding_top5 ali02" style="height:55px;">
<table width="100%">
	<tr>
		<td width="85%" class="ali03"><input type="text" id="searchKey" value=""></td>
		<td><span class="img_find hand" title="点击查找节点" keepDefaultStyle="true" onclick="findNode()"></span></td>
	</tr>
	<tr>
		<td colspan="2" class="ali02"><a onclick="showAll()">全部展开</a>&nbsp;&nbsp;<a onclick="hideAll()">全部收缩</a></td>
	</tr>
</table>
</div>
<div id="scrollContent" style="overflow-x:hidden;">
	<div>
		<ul id="treeDemo" class="ztree ztree_accordition"></ul>
	</div>
</div>				
</body>
</html>
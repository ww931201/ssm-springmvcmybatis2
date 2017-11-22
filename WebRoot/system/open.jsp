<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--框架必需start-->
<script type="text/javascript" src="../../libs/js/jquery.js"></script>
<script type="text/javascript" src="../../libs/js/language/cn.js"></script>
<script type="text/javascript" src="../../libs/js/framework.js"></script>
<link href="../../libs/css/import_basic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" id="skin" prePath="../../"/>
<link rel="stylesheet" type="text/css" id="customSkin"/>
<!--框架必需end-->

<!--动态选项卡start-->
<script type="text/javascript" src="../../libs/js/nav/dynamicTab.js"></script>
<!--动态选项卡end-->

<script>
function tabAddHandler(mid,mtitle,murl){
		tab.add( {
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});
	tab.activate(mid)
}
 var tab;	
$( function() {
	 tab = new TabView( {
		containerId :'tab_menu',
		pageid :'page',
		cid :'tab1',
		position :"top"
	});
	tab.add( {
		id :'tab_index',
		title :"快捷导航",
		url :"nav.jsp",
		isClosed :false
	});
	
	$("body").bind("dynamicTabActived",function(e,tabId){
		if(tabId=="tab_index"){
			top.frmleft.hideAll();
		}
		else{
			top.frmleft.getNodesByParam("id",tabId);
		}
	})
});
function customHeightSet(contentHeight){
	$("#page").height(contentHeight-30);
}
</script>
</head>
<body>
<div id="tab_menu"></div>
<div id="page"></div>
</body>
</html>
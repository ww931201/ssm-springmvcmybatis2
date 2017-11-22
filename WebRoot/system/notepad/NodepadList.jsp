<%@page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>记事本</title>
<!--框架必需start-->
<script type="text/javascript" src="<%=basePath%>/libs/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>/libs/js/language/cn.js"></script>
<script type="text/javascript" src="<%=basePath%>/libs/js/framework.js"></script>
<link href="<%=basePath%>/libs/css/import_basic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>/"/>
<link rel="stylesheet" type="text/css" id="customSkin"/>
<!--框架必需end-->

<!--数据表格start-->
<script src="<%=basePath%>/libs/js/table/quiGrid.js" type="text/javascript"></script>
<!--数据表格end-->

<!--表单异步提交start-->
<script src="<%=basePath%>/libs/js/form/form.js" type="text/javascript"></script>
<!--表单异步提交end-->
</head>
<body>
<div class="box2" panelTitle="记事本查询" id="searchPanel">
	<form action="<%=basePath%>/getUsersOfPager.action" id="queryForm" method="post">
		<input type="hidden" id="parentId" name="parentId" value="1"/>
		<table>
			<tr>
				<td>标题：</td>
				<td>
					<input type="text" id="searchInput" name="userinfor.userName" />
					<input type="text" style="width:2px;display:none;"/>
				</td>
				<td>作者：</td>
				<td>
					<input type="text" id="searchInput" name="userinfor.userName" />
					<input type="text" style="width:2px;display:none;"/>
				</td>
				<td>地点：</td>
				<td>
					<input type="text" id="searchInput" name="userinfor.userName" />
					<input type="text" style="width:2px;display:none;"/>
				</td>
				<td>时间：</td>
				<td>
					<input type="text" id="searchInput" name="userinfor.userName" /> --
					<input type="text" id="searchInput" name="userinfor.userName" />
					<input type="text" style="width:2px;display:none;"/>
				</td>
				<td><button type="button" onclick="searchHandler()"><span class="icon_find">查询</span></button></td>
				<td><button type="button" onclick="resetSearch()"><span class="icon_reload">重置</span></button></td>
			</tr>
		</table>
	</form>
</div>

	<div class="padding_right5">
		<div id="dataBasic"></div>
    </div>

<script type="text/javascript">
 //设定不可编辑的节点id
   // var noeditArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"];
		
//grid
var grid = null;

function initComplete(){
	//当提交表单刷新本页面时关闭弹窗
	top.Dialog.close();
	
	grid = $("#dataBasic").quiGrid({
		columns:[
			{ display: '标题', name: 'headlined',     align: 'left', width: "20%"},
		    { display: '分类', name: 'classifies', 	 align: 'left', width: "20%"},
		    { display: '时间', name: 'createtimes', align: 'left', width: "30%"},
		    { display: '作者', name: 'author', 	 align: 'left',  width:"30%"} ,
       		{ display: '操作', isAllowHide: false, align: 'left', width:100,
					 render: function (rowdata, rowindex, value, column){
                 	    return '<div class="padding_top4 padding_left5">'
                                 + '<span class="img_list hand" title="查看" onclick="onView(' + rowdata.id + ')"></span>'
                                 + '<span class="img_edit hand" title="修改" onclick="onEdit(' + rowdata.id + ')"></span>' 
                                 + '<span class="img_delete hand" title="删除" onclick="onDelete(' + rowdata.id+','+rowindex + ')"></span>'
                             + '</div>';
	                 }
	            }
		  ],
	 url: '<%=basePath%>NotepadList.action', sortName: 'id',rownumbers:true,checkbox:true,
     height: '100%', width:"100%",pageSize:10,percentWidthMode:true,
    
     toolbar:{
    	 items:[
    		  {text: '新增', click: addUnit,    iconClass: 'icon_add'},
    		  { line : true },
    		  {text: '批量删除', click: deleteUnit, iconClass: 'icon_delete'},
    		  { line : true },
    		]
     	}
	});
	
	//监听查询框的回车事件
	 $("#searchInput").keydown(function(event){
	 	if(event.keyCode==13){
			searchHandler();
		}
	 })
	 
	 $("#searchPanel").bind("stateChange",function(e,state){
		grid.resetHeight();
	});
}

//新增
function addUnit() {
	top.Dialog.open({
			URL:"<%=basePath%>addNodepad.action",
			Title:"添加记事本",Width:800,Height:800});
}
//查看
function onView(rowid){
	top.Dialog.open({
		URL:"<%=basePath%>toShowNodepad.action?id="+rowid ,
		Title:"查看记事本",Width:800,Height:800});
}

//修改	
function onEdit(rowid){
	top.Dialog.open({
		URL:"<%=basePath%>toUpdateNodepad.action?id="+rowid ,
		Title:"修改记事本",Width:800,Height:800});
}
//删除	
function onDelete(rowid,rowidx){
	top.Dialog.confirm("确定要删除该记录吗？",function(){
	  	//删除记录
	  	$.post("<%=basePath%>/deleteNodepad.action",
	  			{"ids":rowid},
	  			function(result){
	  				handleResult(result.status);
				},"json");
				//刷新表格
				grid.loadData();
		});
}
	
	
//批量删除
function deleteUnit() {
	var rows = grid.getSelectedRows();
	var rowsLength = rows.length;
	
	if(rowsLength == 0) {
		top.Dialog.alert("请选中要删除的记录!");
		return;
	}
	top.Dialog.confirm("确定要删除吗？",function(){
			$.post("<%=basePath%>/deleteUser.action",
					//获取所有选中行
					getSelectId(grid),
					function(result){
						handleResult(result.status);
					},
					"json");
		});
}
//删除后的提示
function handleResult(result){
	if(result == 1){
		top.Dialog.alert("删除成功！",null,null,null,1);
		grid.loadData();
	}else{
		top.Dialog.alert("删除失败！");
	}
}

//获取所有选中行获取选中行的id 格式为 ids=1&ids=2 
function getSelectId(grid) {
	var selectedRows = grid.getSelectedRows();
	var selectedRowsLength = selectedRows.length;
	var ids = "";
	
	for(var i = 0;i<selectedRowsLength;i++) {
		ids += selectedRows[i].userId + ",";
	}
	return {"ids":ids};
}

//导出本页
function exportPageData(){
	exportData(true);
}

//查询
function searchHandler(){
	var query = $("#queryForm").formToArray(); 
	//alert(JSON.stringify(query))
    grid.setOptions({ params : query});
    //页号重置为1
    grid.setNewPage(1);
    grid.loadData();//加载数据
}

//重置查询
function resetSearch(){
	$("#queryForm")[0].reset();
   $('#search').click();
}

//刷新表格数据并重置排序和页数
function refresh(isUpdate){
	if(!isUpdate){
		//重置排序
    	grid.options.sortName='userId';
    	grid.options.sortOrder="desc";
    	//页号重置为1
		grid.setNewPage(1);
	}
	
	grid.loadData();
}

</script>	
</body>
</html>
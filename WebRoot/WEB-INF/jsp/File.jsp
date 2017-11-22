<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.5.3/jquery.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.5.3/easyui-lang-zh_CN.js"></script>  

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jquery-easyui-1.5.3/themes/default/easyui.css">  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jquery-easyui-1.5.3/themes/icon.css">  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/styles/common.css">  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jquery-easyui-1.5.3/themes/demo.css">  
<title>Insert title here</title>
</head>
<body>

<div id="progressDlg" class="easyui-dialog" title="执行进度" style="width: 600px;hight:400px;" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true,collapsible:true, buttons: '#progressDlgBtns'">  
        <div style="padding: 10px 60px 20px 60px">  
          <div id="p" class="easyui-progressbar" style="width:400px;"></div>  
        </div>  
    </div>  
    <div id="progressDlgBtns" style="width: 600px;">  
        <a href="javascript:void(0)" class="easyui-linkbutton" style="padding: 4px;" onclick="javascript:$('#progressDlg').dialog('close')">关闭</a>  
    </div>  
    
    
    <div id="importDlg" class="easyui-dialog" title="批量导入" style="width:400px;padding:30px 70px 50px 70px">  
         <form id="importForm" method="post"  enctype="multipart/form-data">  
             <div style="margin-bottom:20px">  
                <input id="uploadFile" class="easyui-filebox" name="uploadFile" data-options="prompt:'请选择要导入的文件……'" style="width:100%">  
            </div>  
            <div>  
                <a href="#" id="doImportBtn"  class="easyui-linkbutton" style="width:100%">上传</a>  
                <a href="#" id="cancelImportBtn"  class="easyui-linkbutton" style="width:100%">取消</a>  
            </div>  
         </form>    
    </div>  

</body>
</html>
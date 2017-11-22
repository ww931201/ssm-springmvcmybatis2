<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="box1"  overflow="true" panelHeight="400" id="formContent" whiteBg="true">
	<table class="tableStyle" formMode="view" style="height: 300">
			<tr>
				<td width="50%">标题</td>
				<td>${notepad.headlined}</td>
			</tr>
			<tr>
				<td>分类</td>
				<td>${notepad.classifies}</td>
			</tr>
			<tr>
				<td>游玩时间</td>
				<td>${notepad.playtime}</td>
			</tr>
			<tr>
				<td>创建时间</td>
				<td>${notepad.createtimes}</td>
			</tr>
			<tr>
				<td>地点</td>
				<td>${notepad.sitename}</td>
			</tr>
			<tr>
				<td>作者</td>
				<td>${notepad.author}</td>
			</tr>
			<tr>
				<td>正文内容</td>
				<td>${notepad.content}</td>
			</tr>
		</table>
	</div>
</body>
</html>
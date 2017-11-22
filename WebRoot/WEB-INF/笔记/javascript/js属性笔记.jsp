<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">

		/*效果*/
		$("#div1").show();
		$("#div1").hide();
		//DOM转换为jQuery对象 
		$(document.getElementById("div1")).show();
		$(document.getElementById("div1")).hide();
		/*设置值*/
		$("#div1").css("display","block");
		$("#div1").css("display","none");
		$("#div1").attr("display","block");
		$("#div1").attr("display","none");
		//jQuery转为DOM
		$("#div2").get(0).style.display = "none";
		$("#div2").get(0).style.display = "block";
		$("#div2")[0].style.display = "none";
		$("#div2")[0].style.display = "block";
		document.getElementById("div1").style.display = "block";
		document.getElementById("div1").style.display = "none";
		/*jQuery获取值*/  
		alert($("#div1").attr("display"));
		alert($("#div1").html()); 
		alert($("#div1").text());
		alert($("#div1").val()); //value值
		/*DOM获取值*/ 
		alert(document.getElementById("div1").innerHTML);
		//设置html值
		document.getElementById("div1").innerHTML = "123456789";
		document.getElementById("div1").innerText = "123456";
		//获取html值，1.获取html 2.获取内容
		alert(document.getElementById("div1").innerHTML);
		alert(document.getElementById("div1").innerText);
		alert(document.getElementById("div1").style.display);
		alert($(document.getElementById("div1")).css("display"));
		alert($(document.getElementById("div1")).attr("display"));
		/*样式*/ 
		$("#div1").addClass("dcls");
		//$("#div1").removeClass("dcls");
		$("#div1").removeAttr("class");
		/*js添加属性*/ 
		$("#div1")[0].setAttribute("id","asd");//添加id属性 
		//创建div追加到div对象中 
		$("#div1").append($("<div id='123' />"));
		//使用js创建div对象 
		var divas = document.createElement("div");
		divas.setAttribute("id", "132456");
		var divss = document.getElementById("div1");
		//js使用appendChild(),追加
		divss.appendChild(divas);
		divas.value = "1234567";
		alert(divas.value);
		//empty()删除匹配的元素集合中所有的子节点。
</script>
</head>
<body>


</body>
</html>
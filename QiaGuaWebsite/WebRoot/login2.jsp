<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>恰瓜，一起来恰瓜！--注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is login2 page">
	
	<link rel="stylesheet" type="text/css" href="CSS/login.css">
  	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
	  <script>
		function check(){
			var reg = new RegExp("^[a-z0-9A-Z]+([._\\-]*[a-z0-9A-Z])*@([a-z0-9A-Z]+[-a-z0-9A-Z]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
			var msg = document.getElementById("isTell");//要验证的对象
			var obj = document.getElementById("isEmail"); 
		　　if(obj.value == ""){ //必须输入邮箱
		　　　　alert("请输入邮箱!");
		　　　　return false;
		　　}else if(!reg.test(obj.value)){ //正则验证不通过，格式不对
		　　　　alert("请输入有效的邮箱号码!");
		　　　　return false;
		　　}else if(msg.value == ""){ //正则验证不通过，格式不对
		　　　　alert("请输入手机号码!");
		　　　　return false;
		　　}else if(!(/^1[3456789]\d{9}$/.test(msg.value))){ //正则验证不通过，格式不对
		　　　　alert("请输入11位有效的手机号码!");
		　　　　return false;
		　　}else{//是否可以增加信息
				<%
				if(request.getSession().getAttribute("ID")!=null){
					Integer ID = (Integer) request.getSession().getAttribute("ID");
					System.out.println("--login2即将要验证的ID是:"+ID+"--");
					request.getSession().setAttribute("ID",ID);
					%>
						alert("请等待邮箱及手机号验证！");
						return true;
					<%
				}
				else{
					%>
						　alert("请求失败！ID丢失");
					<%
				}
				%>
		　　　　return false;
		　　}
		}
	  </script>
  </head>
<body onLoad="createCode()">
	<center>
		<img class="title" src="images/main/name.png">
		<div class="sign-in"><p><span class="sign-of">注册</span>&nbsp;|&nbsp;<a class="sign-in" href="Sign-in.jsp">登录</a></p></div>
		<div class="circle theBlue NO1"><p class="number">1</p><p class="bar-words" style="width: 150px;margin-left: -40px;color: #d2d4d4;">开启你的恰瓜生活！</p> </div>
		<div class="circle theBlue NO2"><p class="number">2</p><p class="bar-words" style="width: 150px;margin-left: -46px;color: #d2d4d4;">邮箱、手机号绑定</p> </div>
		<div class="circle NO3"><p class="number">3</p><p class="bar-words" style="width: 150px;margin-left: -42px;color: #d2d4d4;">完善注册信息</p> </div>
		<div class="circle NO4"><p class="number">4</p><p class="bar-words" style="width: 150px;margin-left: -42px;color: #d2d4d4;">注册完成</p> </div>
		<div class="title-bar"></div>
		<div class="bar-status-2"></div>
		<form action="LoginServlet" method="post" class="submit-form2" onsubmit="return check()">
			<table>
				<tr>
					<td><p><span style="color: red;">*</span>邮箱名：</p> </td>
					<td><input type="validMail" name="userMail" id="isEmail" step='1'></td>
				</tr>
				<tr>
					<td><p><span style="color: red;">*</span>手机：</p></td>
					<td><input type="tel" name="userTell" id="isTell" maxlength="11"></td>
					
				</tr>
				<tr>
					<td><p></p> </td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><p></p> </td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2"><input id="Button1" class="submit-button" type="submit" value="下一步" /></td>
				</tr>
			</table>
		</form>
	</center>
	
</body>





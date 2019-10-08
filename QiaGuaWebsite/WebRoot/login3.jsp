<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<style>
	.radio-style>input{
	    display: none;
	}
	.radio-style>label{
	    position: relative;
	    margin-right: 20px;
	}
	.radio-style>label::before{
	    display: inline-block;
	    content: "";
	    width: 16px;
	    height: 16px;
	    border-radius: 50%;
	    border: 1px solid rgb(219, 219, 219);
	    margin-right: 6px;
	    vertical-align: bottom;
	}
	.radio-style>input:checked+label::before{
	    background-color: rgb(129, 213, 219);
	}
	.radio-style>input:checked+label::after{
	    display: inline-block;
	    content: "";
	    width: 6px;
	    height: 6px;
	    border-radius: 50%;
	    position: absolute;
	    left: 6px;
	    bottom: 6px;
	    background-color: white;
	}
	</style>
  </head>
<body onLoad="createCode()">
	<center>
		<img class="title" src="images/main/name.png">
		<div class="sign-in"><p><span class="sign-of">注册</span>&nbsp;|&nbsp;<a class="sign-in" href="Sign-in.jsp">登录</a></p></div>
		<div class="circle theBlue NO1"><p class="number">1</p><p class="bar-words" style="width: 150px;margin-left: -40px;color: #d2d4d4;">开启你的恰瓜生活！</p> </div>
		<div class="circle theBlue NO2"><p class="number">2</p><p class="bar-words" style="width: 150px;margin-left: -46px;color: #d2d4d4;">邮箱、手机号绑定</p> </div>
		<div class="circle theBlue NO3"><p class="number">3</p><p class="bar-words" style="width: 150px;margin-left: -42px;color: #d2d4d4;">完善注册信息</p> </div>
		<div class="circle NO4"><p class="number">4</p><p class="bar-words" style="width: 150px;margin-left: -42px;color: #d2d4d4;">注册完成</p> </div>
		<div class="title-bar"></div>
		<div class="bar-status-3"></div>
		<form action="LoginServlet" method="post" class="submit-form2">
		<% 
		Integer ID= (Integer)request.getSession().getAttribute("ID");
		request.getSession().setAttribute("ID",ID); 
		%>
			<table>
				<tr>
					<td><p>姓名：</p> </td>
					<td><input type="text" name="userIDName" id="IDName"></td>
				</tr>
				<tr>
					<td><p>性别：</p></td>
					<td class="radio-style">
						<input type="radio" name="userSender" id="male" value="m">
		                <label for="male" style="cursor:pointer">男&nbsp;</label>
		                <input type="radio" name="userSender" id="female" value="f">
		                <label for="female" style="cursor:pointer">女&nbsp;</label>
					</td>
				</tr>
				<tr>
					<td><p>身份证号：</p> </td>
					<td><input type="text" name="userIDNumber" id="IDNumber" maxlength="18"></td>
				</tr>
				<tr>
					<td><p></p> </td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2"><input id="Button3" class="submit-button" type="submit" value="下一步" name="button3" /></td>
				</tr>
			</table>
		</form>
	</center>
	
</body>





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
    <meta http-equiv="refresh" content="5;URL=main.jsp">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is login4 page">
	
	<link rel="stylesheet" type="text/css" href="CSS/login.css">
  	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
	 
  </head>
<body onLoad="createCode()">
		<script>
			function countDown(){
				//获取初始时间
				var time = document.getElementById("Time");
				
				//获取到id为time标签中的数字时间
				if(time.innerHTML == 0){
					//等于0时清除计时，并跳转该指定页面
					window.location.href="main.jsp";
				}else{
					time.innerHTML = time.innerHTML-1;
				}
			}
			//1000毫秒调用一次
			window.setInterval("countDown()",1000);
		</script>
	<center>
		<img class="title" src="images/main/name.png">
		<div class="sign-in"><p><span class="sign-of">注册</span>&nbsp;|&nbsp;<a class="sign-in" href="Sign-in.jsp">登录</a></p></div>
		<div class="circle theBlue NO1"><p class="number">1</p><p class="bar-words" style="width: 150px;margin-left: -40px;color: #d2d4d4;">开启你的恰瓜生活！</p> </div>
		<div class="circle theBlue NO2"><p class="number">2</p><p class="bar-words" style="width: 150px;margin-left: -46px;color: #d2d4d4;">邮箱、手机号绑定</p> </div>
		<div class="circle theBlue NO3"><p class="number">3</p><p class="bar-words" style="width: 150px;margin-left: -42px;color: #d2d4d4;">完善注册信息</p> </div>
		<div class="circle theBlue NO4"><p class="number">4</p><p class="bar-words" style="width: 150px;margin-left: -42px;color: #d2d4d4;">注册完成</p> </div>
		<div class="title-bar-finish"></div>
		<div style="color: #5eb7eb;margin-top: 100px;font-size: 72px;font-family: 'FangSong';margin-left: 60px;">注册成功！</div>
		<p class="login-style"><span id="Time" >5</span>秒后将跳转至主页......</p>
	</center>
	
</body>






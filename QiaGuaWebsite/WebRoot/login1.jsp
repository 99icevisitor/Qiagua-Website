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
	<meta http-equiv="description" content="This is login1 page">
	
	<link rel="stylesheet" type="text/css" href="CSS/login.css">
  	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
	  <script language="javascript" type="text/javascript">  
	  	var code ; //在全局 定义验证码   
	     function createCode()   
	     {    
	       code = "";   
	       var codeLength = 6;//验证码的长度   
	       var checkCode = document.getElementById("checkCode");   
	       var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符，当然也可以用中文的      
	       for(var i=0;i<codeLength;i++)   
	       {   
	        var charIndex = Math.floor(Math.random()*35);   
	        code +=selectChar[charIndex];   
	       }    
	       if(checkCode)   
	       {   
	         checkCode.className="code";   
	         checkCode.value = code;
	         checkCode.blur();   
	       }        
	     }     
	     function validate ()   {   
	       var inputCode = document.getElementById("validCode").value;  
	       var inputUser = document.getElementById("validUser").value;
	       var inputPwd = document.getElementById("validPwd").value;
	       var inputConfirm = document.getElementById("confirmPwd").value; 
	       if(inputCode.length <=0)   
	       {   
	           alert("请输入验证码！");   
	           return false;
	       }   
	       else if(inputCode.toUpperCase() != code )   
	       {   
	          alert("验证码输入错误！");   
	          createCode();//刷新验证码   
	          return false;
	       }   
	       else if(inputUser.length<=0)
	       {
	       	alert("请输入用户名！");
	       	return false;
	       }
	       else if(inputUser.length>10){
	       alert("用户名应该在十个字符以内！");
	       return false;}
	       else if(inputPwd.length<6||inputPwd.length>16)
	       {
	       	alert("密码应有6~16位！");
	       	return false;
	       }
	       else if(inputConfirm.length<=0)
	       {
	       	alert("请再次验证密码！");
	       	return false;
	       }
	       else if(inputPwd.toUpperCase() != inputConfirm.toUpperCase())
	       {
	       	alert("两次密码输入不同！");
	       	return false;
	       }
	       else
	       {   
	       return true;
	       }   
	     }   
	  </script>
  </head>
<body onLoad="createCode()">
	<center>
		<img class="title" src="images/main/name.png">
		<div class="sign-in"><p><span class="sign-of">注册</span>&nbsp;|&nbsp;<a class="sign-in" href="Sign-in.jsp">登录</a></p></div>
		<div class="circle theBlue NO1"><p class="number">1</p><p class="bar-words" style="width: 150px;margin-left: -40px;color: #d2d4d4;">开启你的恰瓜生活！</p> </div>
		<div class="circle NO2"><p class="number">2</p><p class="bar-words" style="width: 150px;margin-left: -46px;color: #d2d4d4;">邮箱、手机号绑定</p> </div>
		<div class="circle NO3"><p class="number">3</p><p class="bar-words" style="width: 150px;margin-left: -42px;color: #d2d4d4;">完善注册信息</p> </div>
		<div class="circle NO4"><p class="number">4</p><p class="bar-words" style="width: 150px;margin-left: -42px;color: #d2d4d4;">注册完成</p> </div>
		<div class="title-bar"></div>
		<div class="bar-status-1"></div>
		<form action="LoginServlet" method="post" class="submit-form" onsubmit="return validate()">
			<table>
				<tr>
					<td><p><span style="color: red;">*</span>用户名：</p> </td>
					<td colspan="2"><input type="text" name="userName" id="validUser"></td>
				</tr>
				<tr>
					<td><p><span style="color: red;">*</span>密码：</p></td>
					<td colspan="2"><input type="password" name="userPwd" id="validPwd"></td>
				</tr>
				<tr>
					<td><p><span style="color: red;">*</span>确认密码：</p></td>
					<td colspan="2"><input type="password" name="userPwd2" id="confirmPwd"></td>
				</tr>
				<tr>
					<td><p><span style="color: red;">*</span>验证码：</p></td>
					<td><input type="text" id="validCode" />  
					</td>
					<td><input class="confirm-code" type="text" onClick="createCode()" readonly="readonly" id="checkCode" style="width: 85px;cursor:pointer;color: #7ecef4;"/>
					</td>
				</tr>
				<tr>
					<td colspan="3"><input id="Button1" class="submit-button" type="submit" value="下一步" /></td>
				</tr>
			</table>
		</form>
	</center>
	
</body>






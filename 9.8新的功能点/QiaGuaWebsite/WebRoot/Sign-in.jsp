<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
   	    <meta charset="utf-8" />
   	    <title>恰瓜--登录页面</title>
          <link rel="stylesheet" type="text/css" href="CSS/Sign-in.css">
      	  <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
   </head>
   <body>
   	    <center>
   	       <div class="LOGO"><img src="images/main/name.png" class="name-img"/></div>
   	       <br/>
   	       	<a href="login1.jsp"><span class="unchecked">注册</span></a>
   	       	<span style="color:#838383">|</span>
   	       	<span class="checked">登录</span>
   	       	<br/>
   	       	<br/>
   	       <form action="SignServlet" method="post" class="From">
   	       	<table style="border-color: red;border-style: bold;">
   	       		<tr style="height: 50px;">
                     <div class="first-line">
   	       			<td><label style="width: 40px;text-align: right;">用户名</label></td>
   	       			<td><input style="width: 30%;min-width: 200px;height: 28px;" type="text" name="USER_NAME" placeholder="请输入用户名"></td>
                     </div>
   	       		</tr>
                  <tr>
                     <td colspan="2">&nbsp;</td>
                  </tr>
   	       		<tr style="height: 50px;"> 
                     <div>
   	       			<td><label style="width: 40px;text-align: right;"> 密码 </label></td>
   	       			<td><input style="width: 30%;min-width: 200px;height: 28px;" type="password" name="PWD" placeholder="请输入密码"></td>
                     </div>
   	       		</tr>
   	       	</table>
   	       	<br/>
   	       	<br/>
   	        <td colspan="2" align="center"><button style="background:#7ecef4;color:#ffffff;border-radius:10px;height:40px;width:100px">登录</button></td>
   	        </form>
        </center>
   </body>


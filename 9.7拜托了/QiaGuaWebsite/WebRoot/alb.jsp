<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
       <link rel="stylesheet" type="text/css" href="CSS/User.css">
       <link  rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
   </head>
   <body>
   	<br>
   	<br>
   	<center>
      <img src="images/user/1.PNG"  alt="图片正在加载......">
      <img  style="position: absolute;border-radius: 50px;border: none;margin-left:-440px;margin-top: 50px;" width="100px" height="100px" src="images/user/头像.jpg">
    </center>
    <center>
        <p>路人甲</p>
   		<a target="_blank" href=" " style="color:838383">关注</a>
        <a target="_blank" href=" " style="color:838383">|粉丝</a>
        <br/>
   		<a target="_blank" class="people-edit-btn" href="UserInfo.jsp" style="color:838383">编辑</a>
   		<br/>
   		<br/>
   	</center>
   	<div class="box1">
        <div class="ifram">
            <div class="box2" style="margin-left: 15px;margin-top: 10px;">
                 <p style="color: #7ecef4; font-size:70px;margin-left: 115px">+</p>
                 <p style="color:#d3d3d3;margin-left: 110px;margin-top: -30px;">新建专辑</p>
            </div>
            <div class="box2" style="margin-left: 305px;margin-top: -331px;">
                 <p><img   src="images/user/专辑表情包/1.jpg"  style="width: 115px;height: 210px;margin-left: 15PX;"/>
                    <img   src="images/user/专辑表情包/2.jpg"  style="width: 115px;height: 100px;margin-left: 140PX;margin-top: -210px;"/>
                    <img   src="images/user/专辑表情包/3.jpg"  style="width: 115px;height: 100px;margin-left: 140PX;margin-top: -110px;"/>
                 </p>
                  <p><center>表情包</center></p>
                  <center><p style="color:#d3d3d3;">图片3|收藏102</p></center>
            </div>
        </div>
   	  	<div class="right">
            <a href="trace.jsp" >
            <button class="button">
            <i class="fa fa-bell" style="color: #FF83FA;"></i>
            <span style="color: #000000;">动态</span>
            </button></a><br/>
            <a href="alb.jsp"  >
            <button class="button" style="background:#7ecef4;color:#ffffff;">
            <i class="fa fa-file-picture-o" style="color: #9AFF9A;"></i>
            <span style="color:#ffffff;">专辑</span>
            </button></a><br/>
            <a href="articles.jsp" >
            <button class="button">
            <i class="fa fa-file-text" style="color: #FFC0CB;"></i>
            <span style="color: #000000;">文章</span>
            </button></a><br/>
            <a href="collections.jsp">
            <button class="button">
            <i class="fa fa-star-half-full" style="color:#EEEE00;"></i>
            <span style="color: #000000;">收藏</span>
            </button></a><br/>
            
        </div>
       </div>       
   </body>
</html>

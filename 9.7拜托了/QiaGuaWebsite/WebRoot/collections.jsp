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
   	    	<div class="box3" style="margin-left: 10px;margin-top: 10px;">
             <p><img   src="images/user/专辑表情包/1.jpg"  style="width: 60px;height:    140px;margin-left: 10PX;margin-top: -10px;">
                <img   src="images/user/专辑表情包/2.jpg"  style="width: 60px;height: 60px;margin-left: 85PX;margin-top: -140px;">
                <img   src="images/user/专辑表情包/3.jpg"  style="width: 60px;height: 60px;margin-left: 85PX;margin-top: -70px;"></p> 
          </div>
          <div style="margin-left: 170px;margin-top: -166px; background-color: #f3f3f3;width: 400px;       height: 150px;">
              <p style="margin-top: 15px;margin-left: 10px;">收藏专辑表情包</p>
              <p style="margin-left: 10px; font-size:12px;color:#d3d3d3;">2019年8月21日</p>
          </div>
   	    </div>
   	  	<div class="right">
   	  		  <a href="trace.jsp" >
            <button class="button">
            <i class="fa fa-bell" style="color: #FF83FA;"></i>
            <span style="color: #000000">动态</span>
            </button></a><br/>
            <a href="alb.jsp"  >
            <button class="button">
            <i class="fa fa-file-picture-o" style="color: #9AFF9A;"></i>
            <span style="color: #000000">专辑</span>
            </button></a><br/>
            <a href="articles.jsp" >
            <button class="button">
            <i class="fa fa-file-text" style="color: #FFC0CB;"></i>
            <span style="color: #000000">文章</span>
            </button></a><br/>
            <a href="collections.jsp" >
            <button class="button"style="background:#7ecef4;color:#ffffff;">
            <i class="fa fa-star-half-full" style="color:#EEEE00;"></i>
            <span style="color: #ffffff;">收藏</span>
            </button></a><br/>
            
        </div>
       </div>       
   </body>
</html>
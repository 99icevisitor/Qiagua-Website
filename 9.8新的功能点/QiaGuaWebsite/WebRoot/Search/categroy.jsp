<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="../CSS/categroy.css"/>
<title>分类词-恰瓜</title>

</head>
<body>
<div style="height: 80px;"></div>
<div class="result">
  <div class="cat"><p>分类词</p>
   <p style="color: #838383;font-size: 14px;"><a href="" style="text-decoration:none;color: #838383;">关键词</a></p></div>
  <p style="font-size: 14px;">分类 > <p style="color: #7ecef4;margin-top: -33px;margin-left: 50px;font-size: 14px;">分类词</p></p>
  <div class="sc">
   <div class="cur">
     <a href=""><img src="../images/search/tou.jpg" style="width: 200px;height: auto;"/></a>
     <p style="margin-left: 10px;">描述词</p>
     <div class="xianshi" style="margin-top: 10px;">
       <p><i class="fa fa-thumbs-o-up" style="color: #7ecef4;margin-left: 10px;"></i></p>
       <p class="num1">赞的数</p>
       <p style="margin-left: 20px;"><i class=" fa fa-star-o" style="color: #7ecef4;"></i></p>
       <p class="num2">收藏数</p>
     </div>
     <img src="../images/search/touxiang.jpg" style="width: 50px;height: 50px;margin-top: 50px;margin-left: -140px;"/>
      <p class="user" style="margin-left:70px;margin-top: -50px;text-align: center;width:20px;">用户名</p>
      <p class="action" style="margin-left: 70px;margin-top: -5px;float: left;">发布到</p>
      <p class="an" style="margin-top: -5px;margin-left: 125px;width: 50px;">专辑名</p>
   </div>
  </div>
</div>
</body>

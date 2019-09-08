<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="../CSS/search.css" />
<title>恰瓜</title>

</head>
<jsp:include page="../main.jsp" flush="true"/>
<body>

  <div style="height: 80px;"></div>
  <div class="sr">
  <div class="result" style="float: left;">
    <div class="list">
      <ul>
        <li style="color: #7ecef4"><a href="Search/search1.jsp" style="text-decoration: none;color: #7ecef4;">图片</a></li>
        <li><a href="Search/search2.jsp" style="text-decoration: none;color: #838383;">专辑</a></li>
        <li><a href="Search/search3.jsp" style="text-decoration: none;color: #838383;">文章</a></li>
        <li><a href="Search/search4.jsp" style="text-decoration: none;color: #838383;">达人</a></li>
      </ul>
    </div>
    <div class="tab">
      <div class="cur" style="height: 500px;width: 230px;">
      <a href=""><img src="../images/search/tou.JPG" style="height: auto;width: 230px;" /></a>
      <p style="margin-left: 10px;">搜索词</p>
      <div class="xianshi" style="margin-top: 10px;">
       <p><i class="fa fa-thumbs-o-up" style="color: #7ecef4;margin-left: 10px;"></i></p>
       <p class="num1">赞的数</p>
       <p style="margin-left: 20px;"><i class=" fa fa-star-o" style="color: #7ecef4;"></i></p>
       <p class="num2">收藏数</p>
      </div>
      <img src="../images/search/touxiang.jpg" style="width: 50px;height: 50px;margin-top: 50px;margin-left: -140px;" />
      <p style="margin-left: 70px;margin-top: -47px;">用户名</p>
      <p class="action" style="margin-left: 70px;margin-top: -5px;">关注了你</p>
      </div>
      </div>
      </div>
    <div class="history" style="width: 200px;margin-left: 1020px;height: auto;">
      <div style="border:1px solid #ccc;text-align:center;"><b>历史记录</b></div>
      <div style="border:1px solid #ccc;"><div style="text-align: center;width: 90px;"><a href="search1.jsp" style="text-decoration:none; color:#838383;">记录</a></div></div>
    </div>
    <div class="hotsearch" style="width: 200px;margin-left: 1020px;margin-top: 20px;height: auto;">
      <div style="border:1px solid #ccc;text-align: center;"><b>热门搜索</b></div>
      <div style="border:1px solid #ccc;"><div style="text-align: center;width: 90px;"><a href="search1.jsp" style="text-decoration:none; color: #838383;">搜索</a></div></div>
    </div>
    </div>
 </body>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
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
        <li><a href="Search/search1.jsp" style="text-decoration: none;color: #838383;">图片</a></li>
        <li><a href="Search/search2.jsp" style="text-decoration: none;color: #7ecef4;">专辑</a></li>
        <li><a href="Search/search3.jsp" style="text-decoration: none;color: #838383;">文章</a></li>
        <li><a href="Search/search4.jsp" style="text-decoration: none;color: #838383;">达人</a></li>
      </ul>
    </div>
    <div class="tab">
      <div class="cur" style="height: 400px;width: 230px;">
      <a href="" style="text-decoration: none;color: #838383;">
      <div class="pic" style="width: 230px;height: 180px;margin-top: 0px;border:1px solid #ccc;">
      <img src="../images/search/tou.JPG" style="height: auto;width: 100px;margin-top: 5px;margin-left: 5px;"/></div>
      <div  style="border:1px solid #ccc;border-top: none;width: 230px;margin-top: -17px;height: 100px;">
      <p style="margin-top: 15px;text-align: center;color: black;"><b>专辑名</b></p>
      <div class="xianshi"><p>图片数</p><p style="margin-left: 0px;">图片 · </p><p style="margin-left: 10px;">收藏数</p><p style="margin-left: 0px;">收藏</p></div>

      </div>
      </a>
      </div>
      </div>
      </div>
    <div class="history" style="width: 200px;margin-left: 1020px;height: auto;">
      <div style="border:1px solid #ccc;text-align:center;"><b>历史记录</b></div>
      <div style="border:1px solid #ccc;"><div style="text-align: center;width: 90px;"><a href="search1.jsp" style="text-decoration:none; color:#838383;">记录</a></div></div>
    </div>
    <div class="hotsearch" style="width: 200px;margin-left: 1020px;margin-top: 20px;height: auto;">
      <div style="border:1px solid #ccc;text-align: center;"><b>热门搜索</b></div>
      <div style="border:1px solid #ccc;"><div style="text-align: center;width: 90px;"><a href="search2.jsp" style="text-decoration:none; color: #838383;">搜索</a></div></div>
    </div>
    </div>
 </body>
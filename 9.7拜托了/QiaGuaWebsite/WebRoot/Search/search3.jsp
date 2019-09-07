<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css"/>
<title>搜索词-恰瓜</title>
<style>
.result{
margin-left: 200px;
width: 600px;}
.result .list{
  height: 50px;
  width: 600px;
  border:1px solid #ccc;  
}
.result .tab{ 
  margin-top:10px;
  height: 1000px;
  color: #838383;
}
.result .tab .cur{
  
  margin-top: 10px;
  float: left;
  border:1px solid #ccc;
  height: 350px;
  width: 600px;
}
.result .tab .cur .usr{
  margin-top: 10px;
  margin-left: 10px;
}
.result .list ul li{
  float: left;
  list-style-type: none;
  line-height: 20px;
  color: #838383;
  width: 130px;
  text-align:center; 
}
.sr{
  width: 1000px;
  margin:0 auto;
}
a{
  text-decoration: none;
}
</style>
</head>
<jsp:include page="../main.jsp" flush="true"/>
<body>
  <div style="height: 80px;"></div>
  <div class="sr">
  <div class="result" style="float: left;">
    <div class="list">
      <ul>
        <li><a href="Search/search1.jsp" style="text-decoration: none;color: #838383;">图片</a></li>
        <li><a href="Search/search2.jsp" style="text-decoration: none;color: #838383;">专辑</a></li>
        <li><a href="Search/search3.jsp" style="text-decoration: none;color: #7ecef4;">文章</a></li>
        <li><a href="Search/search4.jsp" style="text-decoration: none;color: #838383;">达人</a></li>
      </ul>
    </div>
    <div class="tab">
      <div class="cur">
      <a href="" style="color: black;"><div class="usr"><img src="../images/search/touxiang.jpg" style="width: 50px;height: 50px;">
      <p class="username" style="margin-top: -50px;margin-left: 55px;">用户名</p></div></a>
      <p class="artitle" style="margin-top: 40px;height: 10px;margin-left: 10px;">标题</p>
      <a href=""><img src="../images/search/tou.JPG" style="width:360px;height: 200px;margin-left: 10px;margin-top: 10px;"></a>
      </div>
      </div>
      </div>
    <div class="history" style="width: 200px;margin-left: 850px;height: auto;">
      <div style="border:1px solid #ccc;text-align:center;"><b>历史记录</b></div>
      <div style="border:1px solid #ccc;"><div style="text-align: center;width: 90px;"><a href="search1.jsp" style="text-decoration:none; color:#838383;">记录</a></div></div>
    </div>
    <div class="hotsearch" style="width: 200px;margin-left: 850px;margin-top: 20px;height: auto;">
      <div style="border:1px solid #ccc;text-align: center;"><b>热门搜索</b></div>
      <div style="border:1px solid #ccc;"><div style="text-align: center;width: 90px;"><a href="search3.jsp" style="text-decoration:none; color: #838383;">搜索</a></div></div>
    </div>
    </div>
 </body>
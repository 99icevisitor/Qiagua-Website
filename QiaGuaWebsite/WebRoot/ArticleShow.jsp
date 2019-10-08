<%@ page language="java" import="java.util.*,source.*,people.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>恰瓜--文章查看</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="文章查看,真的有用,别再误删了！">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	a{text-decoration : none;}
	.user{height:80px;margin-top:50px;width:70%;margin-left:15%;background-color:#7ecef4;}
	.img-div{margin-left:50px;background-color:transparent;height:60px;width:60px;margin-top:10px;}
	.user-img{border-radius: 30px;width:60px;height:60px;margin-top:10px;}
	.author-name{font-size:30px;font-family:"FangSong";background-color:transparent;height:30px;margin-left:130px;margin-top:-35px;width:auto;}
	.main-body{width:70%;margin-left:15%;min-height:300px;height:auto;background-color:#f2f2f2;}
	.title{height:60px;font-family:"FangSong";font-size:50px;}
	.content{min-height:200px;padding-left:20px;}
	.toolbar {
    border: 1px solid #ccc;
    height: 60px;
    width: 100%;
    background-color: #eeeeee;
}
.back-to-manager{
	width: 300px;
	height: 50px;
	background-color: transparent;
	float: left;
	font-family: "FangSong";
	font-size: 36px;
	color: #7ecef4;
	font-weight: bold;
	margin-left: 30px;
	padding-top: 10px;
}
.back-button{
	background-color: transparent;
}
.back-button:link{
	color: #7ecef4;
}
.back-button:hover{
	text-shadow: 3px 1px 6px #dddddd;
	color: #7ecef4;
}
.back-button:visited{
	color: #7ecef4;
}
.back-button:active{
	color: #70c8f1;
}
	</style>
  </head>
  
  <body>
    <%if(request.getSession().getAttribute("ID")==null){
    }
    else{
    	int ID = (int)request.getSession().getAttribute("ID");
    	request.getSession().setAttribute("ID", ID);
	    if(request.getParameter("art_id")==null){
	    }
	    else{
	    	int art_id = Integer.valueOf(request.getParameter("art_id"));
	    	ArtBean art = new ArtBean();
	    	art.getArt(art_id);
	    	UserBean author = new UserBean(art.getArt_author());
    %>
    <div class="toolbar">
    <div class="back-to-manager">
		<a href="main.jsp" class="back-button">返回主页面</a>
	</div>
   </div>
    <div class="user">
    	<a href="User.jsp?id=<%=art.getArt_author()%>">
    	<div class="img-div">
    		<img src=<%=author.getUser_IMG() %> class="user-img">
    	</div>
    	<div class="author-name"><%=author.getUser_name() %></div>
    	</a>
    </div>
    <div class="main-body">
    <%
    if(ID==art.getArt_author()){ %>
    	<div class="title">
    		<a href="WEditor/Article.jsp?art_id=<%=art.getArt_id() %>" >
    			<center><%=art.getArt_title() %></center>
    		</a>
    	</div>
   	<%} 
   	else{%>
   	<div class="title"><center><%=art.getArt_title() %></center></div>
   	<%} %>
    	<div class="content"><%=art.getArt_content() %></div>
    </div>
   <%  }%>
     <% }%>
  </body>
</html>

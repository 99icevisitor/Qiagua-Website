<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>恰瓜，一起来恰瓜！--文章管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is ArticleManager2 page">
	
	<link rel="stylesheet" type="text/css" href="CSS/ArticleManager.css">
  	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
  	<style type="text/css">
  		#id1{
  			margin-top: 130px;
  		}
  		#id2{
  			margin-top: 260px;
  		}
  	</style>
</head>
<body>
	
  <center>
	<div class="mainDiv tab">
		<div class="leftDiv">
			<ul>
				<li class="unchecked"><a href="ArticleManager1.jsp"><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;<span class="listDiv">写文章</span></a> </li>
				<li class="checked"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;<span class="listDiv">已发布</span></li>
				<li class="unchecked"><a href="ArticleManager3.jsp"><i class="fa fa-folder-open-o"></i>&nbsp;&nbsp;<span class="listDiv">素材库</span></a></li>
			</ul>
		</div>
		<div class="RightDiv">
			<div class="content-drafts">
				<p class="draft-word">已发布文章(0)</p>
			</div>
			<div class="content-detials nothing"><!--需要时才显示-->
				<p>您还没有写过文章，您可以立即<a class="start-to-add" href="WEditor/Article.jsp">写文章</a></p>
			</div>
			<div class="content-detials">
				<ul>
					<li><img src="images/main/kker.jpg" alt="文章图片" class="article-img"></li>
					<li><a class="modify-article" href=""><p class="article-title">TITLE1</p></a> <p class="article-time">编辑于2019年3月4日 20:39</p></li>
					<li class="article-modify">
						<div class="article-modify-button"><a href="">管理</a></div>
				        <ul class="drop-down-content">
				          <li >
				          	<a href="">编辑</a>
				      	  </li>
				      	  <li>
				          	<a href="">删除</a>
				          </li>
				        </ul>
			    	</li>
				</ul>
			</div>
			<div class="content-detials" id="id1">
				<ul>
					<li><img src="images/main/kker.jpg" alt="文章图片" class="article-img"></li>
					<li><a class="modify-article" href=""><p class="article-title">TITLE2</p></a> <p class="article-time">编辑于2019年3月18日 20:56</p></li>
					<li class="article-modify">
						<div class="article-modify-button"><a href="">管理</a></div>
				        <ul class="drop-down-content">
				          <li >
				          	<a href="">编辑</a>
				      	  </li>
				      	  <li>
				          	<a href="">删除</a>
				          </li>
				        </ul>
			    	</li>
				</ul>
			</div>
			<div class="content-detials" id="id2">
				<ul class="drop-down1">
					<li><img src="images/main/kker.jpg" alt="文章图片" class="article-img"></li>
					<li><a class="modify-article" href=""><p class="article-title">TITLE3</p></a> <p class="article-time">编辑于2019年5月29日 06:56</p></li>
					<li class="article-modify">
						<div class="article-modify-button"><a href="">管理</a></div>
				        <ul class="drop-down-content">
				          <li >
				          	<a href="">编辑</a>
				      	  </li>
				      	  <li>
				          	<a href="">删除</a>
				          </li>
				        </ul>
			    	</li>
				</ul>
			</div>
		</div>
	</div>
  </center>
</body>
</html>

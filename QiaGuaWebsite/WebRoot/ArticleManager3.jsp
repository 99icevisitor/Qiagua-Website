<%@ page language="java" import="java.util.*,source.AlbBean" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>恰瓜，一起来恰瓜！--图片资源管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is ArticleManager page">
	
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
	<%
    	if(request.getSession().getAttribute("ID")!=null){
    		int ID = (int)request.getSession().getAttribute("ID");
    		System.out.println("--ID:"+ID+"--");
    		request.getSession().setAttribute("ID", ID);
    		AlbBean albs = new AlbBean();
    	%>	
   <div class="toolbar">
    <div class="back-to-manager">
		<a href="User.jsp" class="back-button">返回个人中心</a>
	</div>
   </div>
  <center>
	<div class="mainDiv tab">
		<div class="leftDiv">
			<ul>
				<li class="unchecked"><a href="ArticleManager1.jsp"><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;<span class="listDiv">写文章</span></a> </li>
				<li class="unchecked"><a href="ArticleManager2.jsp"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;<span class="listDiv">已发布</span></a></li>
				<li class="checked"><i class="fa fa-folder-open-o"></i>&nbsp;&nbsp;<span class="listDiv">素材库</span></li>
			</ul>
		</div>
		<div class="RightDiv">
			<div class="content-drafts">
				<p class="draft-word">图片素材库</p>
				<div class="add-button"><a class="add-word" href="AlbChoice.jsp">+上传图片</a></div>
			</div>
			
			
			<div class="content-detials nothing"><!--需要时才显示-->
				<p>您还没有上传过任何图片素材，您可以立即<a class="start-to-add" href="">上传图片</a></p>
			</div>
			
			
			<div class="content-detials" style="position:relative;margin-top:20px;">
				<ul>
					<li><img src="images/main/kker.jpg" alt="素材图片" class="article-img"></li>
					<li><p class="article-title">图片1</p> <p class="article-time">编辑于2019年3月4日 20:39</p></li>
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
  <%} %>
</body>
</html>

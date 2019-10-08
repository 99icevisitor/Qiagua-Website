<%@ page language="java" import="java.util.*,source.ArtBean" pageEncoding="utf-8"%>
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
	<%
    	if(request.getSession().getAttribute("ID")!=null){
    		int ID = (int)request.getSession().getAttribute("ID");
    		System.out.println("--ID:"+ID+"--");
    		request.getSession().setAttribute("ID", ID);
    		ArtBean arts = new ArtBean();
    		int num = arts.getDrafts(ID);
    		int allnum = arts.getArts(ID);
    		int postnum = arts.getOk(ID);
    		System.out.println("--ID art_draft num:"+num+"--");
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
				<li class="checked"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;<span class="listDiv">已发布</span></li>
				<li class="unchecked"><a href="ArticleManager3.jsp"><i class="fa fa-folder-open-o"></i>&nbsp;&nbsp;<span class="listDiv">素材库</span></a></li>
			</ul>
		</div>
		<div class="RightDiv">
			<div class="content-drafts">
				<p class="draft-word">已发布文章(<%=arts.getOk(ID) %>)</p>
			</div>
	<%
		if(postnum==0){
	%>		
			<div class="content-detials"><!--需要时才显示-->
				<p>您还没有发表过文章，您可以立即<a class="start-to-add" href="WEditor/Article.jsp">写文章</a></p>
			</div>
	<%
		}
		else{
			List<ArtBean> articles = new ArrayList<>();
			articles = arts.getArts_1(ID);
			request.getSession().setAttribute("ID",ID);
			int i=0;
			for(ArtBean article :articles){
				i++;
			%>
			<%request.getSession().setAttribute("ART_ID", article.getArtId()); %>
			<div class="content-detials" style="position:relative;">
				<ul>
					<li><img src=<%=article.getArtPicUrl() %> alt="文章图片" class="article-img"></li>
					<li><a class="modify-article" href=""><p class="article-title"><%=article.getArtTitle() %></p></a> <p class="article-time"><%=article.getArtTime() %></p></li>
					<li class="article-modify">
						<div class="article-modify-button"><a>管理</a></div>
				        <ul class="drop-down-content">
				          <li >
				          	<a href="WEditor/Article.jsp?art_id=<%=article.getArt_id()%>">编辑</a>
				      	  </li>
				        </ul>
			    	</li>
				</ul>
			</div>
		  <%} %>
		 <%} %>
		</div>
	</div>
  </center>
  <%} %>
</body>
</html>

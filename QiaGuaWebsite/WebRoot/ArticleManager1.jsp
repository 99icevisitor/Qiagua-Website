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
	<meta http-equiv="description" content="This is ArticleManager1 page">
	
	<link rel="stylesheet" type="text/css" href="CSS/ArticleManager.css">
  	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
  	
  	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  	<script>
  	$("#del").click(function(){
  		
  	})
  	</script>
  	
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
				<li class="checked"><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;<span class="listDiv">写文章</span> </li>
				
			</ul>
		</div>
		<div class="RightDiv">
			<div class="content-drafts">
				<p class="draft-word">草稿(<%=arts.getDrafts(ID) %>)</p>
				<div class="add-button"><a class="add-word" href="WEditor/Article.jsp">+发布新文章</a></div>
			</div>
	<%
		if(allnum==0){
	%>
			<div class="content-detials"><%--需要时才显示--%>
				<p>您还没有写过文章，您可以立即<a class="start-to-add" href="WEditor/Article.jsp">写文章</a></p>
			</div>
	<%
		}
		else{
			List<ArtBean> articles = new ArrayList<>();
			articles = arts.getArts_0(ID);
			request.getSession().setAttribute("ID",ID);
			int i=0;
			for(ArtBean article :articles){
				i++;
			%>
			<%request.getSession().setAttribute("ART_ID", article.getArtId()); %>
			<div class="content-detials" id="id<%=i%>" style="position:relative;margin-top:20px;">
				<ul>
					
					<li><a class="modify-article" href="ArticleShow.jsp?art_id=<%=article.getArtId()%>"><p class="article-title"><%=article.getArtTitle() %></p></a> <p class="article-time"><%=article.getArtTime() %></p></li>
					<li class="article-modify">
						<div class="article-modify-button"><a id="manager<%=i%>">管理</a></div>
				        <ul class="drop-down-content">
				          <li >
				          	<a href="WEditor/Article.jsp?art_id=<%=article.getArt_id() %>" id="change<%=i%>">编辑</a>
				      	  </li>
				      	  <li>
				          	<a href="ArtDelServlet?art_id=<%=article.getArt_id() %>" name=<%=article.getArtId() %> id="del">删除</a>
				          </li>
				        </ul>
			    	</li>
				</ul>
			</div>
					<%}
			
				%>
			
				<%}
			 %>
			
		</div>	
	</div>
  </center>
   <% }%>
</body>
</html>



<%@ page language="java" import="java.util.*,source.*,people.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>恰瓜--文章</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">

	<style type="text/css">
	.art-author{
	margin-left:20%;
	margin-top:20px;
	}
	.art-title{
	width:600px;
	min-height:50px;
	padding-top:1px;
	margin-top:40px;
	}
	.art-content{
	width:600px;
	min-height:100px;
	height:auto;
	background-color:#dcf1fc;
	padding-top:10px;
	margin-top:10px;
	margin-left:20px;
	}
	.art{
	margin-left:20%;
	width:650px;
	min-height:300px;
	height:auto;
	background-color:#f6f6f6;
	-webkit-box-shadow:0 0 3px rgba(0,0,0,.2);
	-moz-box-shadow:0 0 3px rgba(0,0,0,.2);
	box-shadow:0 0 3px rgba(0,0,0,.2);
	}
.images{
width: 70px;
height: 80px;
object-fit: cover;
}
a{
text-decoration:none;
font-Family:"FangSong";
font-size:20px;
}
.art-prase{
margin-left:20%;
margin-top:20px;
width:650px;
min-height:40px;
height:auto;
background-color:#f6f6f6;
-webkit-box-shadow:0 0 3px rgba(0,0,0,.2);
-moz-box-shadow:0 0 3px rgba(0,0,0,.2);
box-shadow:0 0 3px rgba(0,0,0,.2);
}
.btn{
width:150px;
height: 30px ;
border-bottom: none;
border-top: none;
border-left: none;
border:none;
float: left;
background-color: transparent;
margin-top:5px;
outline:none;/*消去蓝色框框*/
}
	</style>
  </head>
  
  <body>
    <% if(request.getSession().getAttribute("ID")==null){
    		System.out.println("--展示文章页面的浏览用户ID为空--");
    		request.setAttribute("Emessage", "ShowArticle_ID_NULL");
    		request.getRequestDispatcher("../Error.jsp").forward(request, response);
    }
    	else{
    	int ID = (int)request.getSession().getAttribute("ID");
    		System.out.println("--展示文章页面的浏览用户ID为："+ID+"--");
    		if(request.getParameter("art_id")!=null && request.getParameter("author_id")!=null){
    			int art_id = Integer.valueOf(request.getParameter("art_id"));
    			int author_id = Integer.valueOf(request.getParameter("author_id"));
    			System.out.println("--展示文章页面的文章ID为："+art_id+",其作者ID为"+author_id+"--");
    			ArtBean article = new ArtBean();
    			UserBean user = new UserBean();
    			UserBean author = new UserBean();
    			request.getSession().setAttribute("ID", ID);
    			if(article.isBlock(art_id,ID)){//当前用户不可见
    %>	
    	<script>
			function countDown(){
				//获取初始时间
				var time = document.getElementById("Time");
				
				//获取到id为time标签中的数字时间
				if(time.innerHTML == 0){
					//等于0时清除计时，并跳转该指定页面
					window.location.href="User.jsp";
				}else{
					time.innerHTML = time.innerHTML-1;
				}
			}
			//1000毫秒调用一次
			window.setInterval("countDown()",1000);
		</script>
	    <center>
	    	<h1>此文章尚未发表，无法查看！</h1>
	    	<p><span id="Time" >5</span>秒后将跳转至个人主页......</p>
	    </center>
    <%	
    		}
    		else{//当前用户可见%>
    	<div class="art-author">
    		<div class="author-name">
    			<a href="User.jsp?User_id=<%=author_id%>"><%=author.getUser_name(author_id) %></a>
    		</div>
    		<div style="width: 50px;height: 50px; border-radius:25px;overflow: hidden;">
    			<img src=<%=author.getUser_IMG(author_id) %> class="images" >
    		</div>
		</div>
    	<div class="art">
    		<div class="art-title">
    			<center><h3><%=article.getArtTitle(art_id) %></h3></center>
    		</div>
    		<div class="art-content">
    			<%=article.getArtContent(art_id) %>
    		</div>
    	</div>
    	<div class="art-prase">
    		<div>
    		<button class="btn" style="margin-left: 49px;">
            	<center><i class="fa fa-thumbs-up" id="i1"></i>点赞数 <%=article.getPraise(art_id) %></center>
         	</button>
         	<button class="btn" style="margin-left: 49px;">
            	<center><i class="fa fa-star-o" id="i2"></i>收藏数 <%=article.getCollection(art_id) %></center>
         	</button>
         	
    <%
         	if(article.isManager(art_id, ID)){
         	 %>
         	 <a href="WEditor/Article.jsp?art_id=<%=art_id%>">
         	<button class="btn" style="margin-left: 49px;">
            	<center>编辑</center>
         	</button>
         	</a>
    <%} %>     	
    		</div>
    	</div>
    	
    	
    	<%	}
    
    }
    }
    %>
    
  </body>
</html>

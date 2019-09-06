<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8" />
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="CSS/Follow.css">
	<title>恰瓜--关注中心</title>
</head>
<body>
	<%
		if(request.getSession().getAttribute("ID")==null){
			System.out.println("--Follow2页面没有绑定用户ID--");
	   		request.setAttribute("Emessage", "Follow2_ID_NULL");
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			return;
		}
		else{
	   		int ID = (Integer)request.getSession().getAttribute("ID");
	   		System.out.println("--Follow2页面绑定的用户ID是:"+ID+"--");
	   		request.getSession().setAttribute("ID", ID);%>
	<div class="main">
		<div class="links">
			<a href="User.jsp" class="back-to-User">个人主页 ></a><span> 我关注的人</span>
		</div>
		<div class="left">
			<div class="my-fans unchecked">
				<a href="Follow.jsp">
				<div class="left-btn">
					<center>
						<i class="fa fa-square-o"></i>
						我的粉丝
					</center>
				</div>
				</a>
			</div>
			<div class="my-idols checked">
				<div class="left-btn">
					<center>
						<i class="fa fa-check-square-o"></i>
						我的关注
					</center>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="user-model type-1" id="type-2">
				<div class="user-img">
					<img src="images/follow/埋酱.jpeg" alt="用户头像" class="img-style" />
				</div>
				<div class="user-name style-2">
					<div class="name-style">用户名</div>
				</div>
				<div class="user-follows">
					<div class="follow-style">关注 <span>0</span>&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <span>0</span></div>
				</div>
				<div class="message-to">
					<div class="message">
						<a href="MessageServlet">发私信</a>
					</div>
				</div>
				<div class="btn-to-schv">
					<a href="FollowServlet" class="btn-to"><div class="schv-btn-1"><center><div class="follow-style">已关注</div></center></div></a>
				</div>
			</div>

			<div class="user-model type-2" id="type-3">
				<div class="user-img">
					<img src="images/follow/埋酱.jpeg" alt="用户头像" class="img-style" />
				</div>
				<div class="user-name style-3">
					<div class="name-style">用户名</div>
				</div>
				<div class="user-follows">
					<div class="follow-style">关注 <span>0</span>&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <span>0</span></div>
				</div>
				<div class="user-info">
					<div class="follow-style">个人简介 1 2 3 4 5 6 7 8 9 0</div>
				</div>
				<div class="message-to-3">
					<div class="message">
						<a href="MessageServlet">发私信</a>
					</div>
				</div>
				<div class="btn-to-schv">
					<a href="FollowServlet" class="btn-to"><div class="schv-btn-1"><center><div class="follow-style">已关注</div></center></div></a>
				</div>
			</div>

			<div class="user-model type-1" id="type-2">
				<div class="user-img">
					<img src="images/follow/埋酱.jpeg" alt="用户头像" class="img-style" />
				</div>
				<div class="user-name style-2">
					<div class="name-style">用户名</div>
				</div>
				<div class="user-follows">
					<div class="follow-style">关注 <span>0</span>&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <span>0</span></div>
				</div>
				<div class="message-to">
					<div class="message">
						<a href="MessageServlet">发私信</a>
					</div>
				</div>
				<div class="btn-to-schv">
					<a href="FollowServlet" class="btn-to"><div class="schv-btn-1"><center><div class="follow-style">已关注</div></center></div></a>
				</div>
			</div>

			<div class="user-model type-2" id="type-3">
				<div class="user-img">
					<img src="images/follow/埋酱.jpeg" alt="用户头像" class="img-style" />
				</div>
				<div class="user-name style-3">
					<div class="name-style">用户名</div>
				</div>
				<div class="user-follows">
					<div class="follow-style">关注 <span>0</span>&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <span>0</span></div>
				</div>
				<div class="user-info">
					<div class="follow-style">个人简介 1 2 3 4 5 6 7 8 9 0</div>
				</div>
				<div class="message-to-3">
					<div class="message">
						<a href="MessageServlet">发私信</a>
					</div>
				</div>
				<div class="btn-to-schv">
					<a href="FollowServlet" class="btn-to"><div class="schv-btn-1"><center><div class="follow-style">已关注</div></center></div></a>
				</div>
			</div>

		</div>
	</div>
	<%} %>
</body>
</html>
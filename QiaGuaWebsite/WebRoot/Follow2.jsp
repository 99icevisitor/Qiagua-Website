<%@ page language="java" import="java.util.*,people.*" pageEncoding="utf-8"%>
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
	<style type="text/css">
	.schv-btn-1 button{
	width: 100px;
	height: 40px;
	border-radius: 30px;
	border: #7ecef4 1px;
	background-color: white;
	color: #7ecef4;
}
.img-style{
	width: 100px;
	height: 100px;
	border-radius: 50px;
}
</style>
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
	   		request.getSession().setAttribute("ID", ID);
	   		request.getSession().setAttribute("jsp", "follow2");
	   		List<Integer> list = new ArrayList<Integer>();
	   		FollowBean follow = new FollowBean();
	   		list = follow.getIdol_IDs(ID);
	   		System.out.println("follow2:list:"+list);
	   		%>
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
		<%if(list!=null){
		   for(int idol_id:list){
		     UserBean idol = new UserBean();
		     UserInfoBean idol_inf = new UserInfoBean();
		     String img = idol.getUser_IMG(idol_id);
		     String name = idol.getUser_name(idol_id);
		     System.out.println("follow2:idol"+idol_id);
		     boolean isProfile = idol_inf.existProfile(idol_id);
		     if(!isProfile){ %>
		    <form action="FollowServlet" method="get">
			<div class="user-model type-1" id="type-2">
				<div class="user-img">
					<img src="<%=img %>" alt="用户头像" class="img-style" />
				</div>
				<div class="user-name style-2">
					<div class="name-style"><%=name %></div>
				</div>
				<div class="user-follows">
					<div class="follow-style">关注 <span><%=follow.idol_NUM(idol_id) %></span>&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <span><%=follow.fan_NUM(idol_id) %></span></div>
				</div>
				<div class="btn-to-schv">
					<a href="FollowServlet" class="btn-to"><div class="schv-btn-1"><center><button type="submit" name="follow" value="<%=idol_id%>"><div class="follow-style">已关注</div></button></center></div></a>
				</div>
			</div>
			</form>
          <%}
          else{ %>
          <form action="FollowServlet" method="get">
			<div class="user-model type-2" id="type-3">
				<div class="user-img">
					<img src="<%=img %>" alt="用户头像" class="img-style" />
				</div>
				<div class="user-name style-3">
					<div class="name-style"><%=name %></div>
				</div>
				<div class="user-follows">
					<div class="follow-style">关注 <span><%=follow.idol_NUM(idol_id) %></span>&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <span><%=follow.fan_NUM(idol_id) %></span></div>
				</div>
				<div class="user-info">
					<div class="follow-style"><%=idol_inf.getUser_PROFILE(idol_id) %></div>
				</div>
				<div class="btn-to-schv">
					<a href="FollowServlet" class="btn-to"><div class="schv-btn-1"><center><button type="submit" name="follow" value="<%=idol_id%>"><div class="follow-style">已关注</div></button></center></div></a>
				</div>
			</div>
          </form>
			<%}
			idol.close();
			idol_inf.myClose();
			}
			} %>
		</div>
	</div>
	<%
	follow.close();} %>
</body>
</html>
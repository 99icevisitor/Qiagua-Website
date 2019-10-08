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
	<title>恰瓜--粉丝中心</title>
	<style type="text/css">
	.schv-btn-0 button{
	width: 100px;
	height: 40px;
	border-radius: 30px;
	border-color: #7ecef4;
	background-color: #7ecef4;
	color: white;
}
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
			System.out.println("--Follow页面没有绑定用户ID--");
	   		request.setAttribute("Emessage", "Follow_ID_NULL");
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			return;
		}
		else{
	   		int ID = (Integer)request.getSession().getAttribute("ID");
	   		System.out.println("--Follow页面绑定的用户ID是:"+ID+"--");
	   		request.getSession().setAttribute("ID", ID);
	   		request.getSession().setAttribute("jsp", "follow1");
	   		List<Integer> list = new ArrayList<Integer>();
	   		FollowBean follow = new FollowBean();
	   		list = follow.getFan_IDs(ID);
	   		%>
	   		
	<div class="main">
		<div class="links">
			<a href="User.jsp" class="back-to-User">个人主页 ></a><span> 关注我的人</span>
		</div>
		<div class="left">
			<div class="my-fans checked">
				<div class="left-btn">
					<center><i class="fa fa-check-square-o"></i>我的粉丝</center>
				</div>
			</div>
			<div class="my-idols unchecked">
				<a href="Follow2.jsp">
				<div class="left-btn">
					<center><i class="fa fa-square-o"></i>我的关注</center>
				</div>
				</a>
			</div>
		</div>
		<div class="right">
		<%-- 样式一共有两种，没有个人简介和type-2 和有个人简介的type-3 
			关于前段"关注"按钮的变化还没解决，以后再说，你们俩先分一下任务
			注意:绑ID!!  Follow.jsp & Follow2.jsp 已经绑好ID,MessageServlet 和 FollowServlet 还没绑好
			注意:要改一下很多Bean文件里面的 数据库密码【password】
			注意:数据库我改了一些属性名，报告文档里也已经更新了，请注意查看！
		FollowServlet
			getFAN_IDs(USER_ID)					获取当前用户所有的粉丝的ID
			getIDOL_IDs(USER_ID)				获取当前用户所有的粉丝的ID
			getUser_IMG(ID);    				获取用户头像
			getUser_NAME(ID);   				获取用户名
			getUser_PROFILE(ID);   				获取用户名简介
			getIDOL_NUM(ID);  					获取用户关注数
			getFAN_NUM(ID);   					获取用户粉丝数
			isFan(FAN_ID,IDOL_ID);     			是否已关注
			-->setFan(FAN_ID,IDOL_ID) 			>已关注则删去记录
			-->setNotFan(FAN_ID,IDOL_ID)		>未关注则增加一条记录
		MessageServlet
			setMESSAGE(SEND_ID,RESV_ID)			发送私信》向数据库！对应地方！增加记录
		
		--%>
		<%
		if(list!=null)
		  for(int fan_id:list){
		    UserBean fan = new UserBean();
		    UserInfoBean fan_inf = new UserInfoBean();
		    String img = fan.getUser_IMG(fan_id);
		    String name = fan.getUser_name(fan_id);
		    boolean isFan = follow.isFan(ID,fan_id);
		    System.out.println(fan_id+""+"!"+isFan);
		    boolean isProfile = fan_inf.existProfile(fan_id);
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
					<div class="follow-style">关注 <span><%=follow.idol_NUM(fan_id) %></span>&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <span><%=follow.fan_NUM(fan_id) %></span></div>
				</div>
				<div class="btn-to-schv">
					<a href="FollowServlet" class="btn-to">
					<%if(isFan) {%>
					     <div class="schv-btn-1"><center><button type="submit" name="follow" value="<%=fan_id%>"><div class="follow-style">已关注</div></button></center></div>
					   <%}
					 else{ %>
					      <div class="schv-btn-0"><center><button type="submit" name="follow" value="<%=fan_id%>"><div class="follow-style">关注</div></button></center></div>
					 <%} %>
					 </a>
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
					<div class="follow-style">关注 <span><%=follow.idol_NUM(fan_id) %></span>&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <span><%=follow.fan_NUM(fan_id) %></span></div>
				</div>
				<div class="user-info">
					<div class="follow-style"><%=fan_inf.getUser_PROFILE(fan_id) %></div>
				</div>
				<div class="btn-to-schv">
					<a href="FollowServlet" class="btn-to">
					<%if(isFan) {%>
					     <div class="schv-btn-1"><center><button type="submit" name="follow" value="<%=fan_id%>"><div class="follow-style">已关注</div></button></center></div>
					   <%}
					 else{ %>
					      <div class="schv-btn-0"><center><button type="submit" name="follow" value="<%=fan_id%>"><div class="follow-style">关注</div></button></center></div>
					 <%} %>
					 </a>
				</div>
			</div>
		   </form>
            <%} %>
		<%} 
		else{
		%>
		<div>还没有人关注你</div>
		<%
		follow.close();}
		}
		%>
	    </div>
     </div>
</body>
</html>
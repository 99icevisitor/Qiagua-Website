<%@ page language="java" import="java.util.*,source.*,people.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
   <head>
       <meta charset="utf-8" />
       <link rel="stylesheet" type="text/css" href="CSS/User.css">
       <link  rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
      
   </head>
<jsp:include page="main.jsp" flush="true"/>  
   <body>
   <% 
   if(request.getSession().getAttribute("ID")==null){
   		System.out.println("--User页面没有绑定用户ID--");
   		request.setAttribute("Emessage", "User_ID_NULL");
		request.getRequestDispatcher("Error.jsp").forward(request, response);
		return;
   }
   else{
   		int ID = (Integer)request.getSession().getAttribute("ID");
   		int seeID = (Integer)request.getSession().getAttribute("ID");
   		int beseeID = 0;
   		System.out.println("--User页面绑定的用户ID是:"+ID+"--");
   		request.getSession().setAttribute("ID", ID);
		UserBean user = new UserBean();
		UserInfoBean user_inf = new UserInfoBean();
		if(user.getUser_name(ID)==null){
			System.out.println("--User显示的页面用户名为null--");
	   		request.setAttribute("Emessage", "User_USER_NAME_NULL");
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			return;
		}
		else if(request.getParameter("id")==null){
			System.out.println("--id=null,User页面显示的用户名为"+ID+"--");
		}
		else{
			ID = Integer.valueOf(request.getParameter("id"));
			beseeID = Integer.valueOf(request.getParameter("id"));
			System.out.println("--id!=null,User页面显示的用户名为"+ID+"--");
		}
	%>
	
   	<br>
   	<br>
   	<center>
      <img src=<%=user_inf.getBG_IMG(ID) %>  alt="图片正在加载......" style="height=0;">
      <img  style="position: absolute;border-radius: 50px;border: none;margin-left:-440px;margin-top: 50px;"
       width="100px" height="100px" src=<%=user.getUser_IMG(ID) %>>
      <div class="User_name" style="color:#838383;">
      	<%=user.getUser_name(beseeID) %>
      </div>
    </center>
    <%if(seeID!=ID){
    System.out.println("--当前用户"+seeID+"浏览用户"+ID+"--");
     %>
    <center style="color:#838383;margin-top:10px;">
       <span>关注<%=user.getIdols(ID) %> | 粉丝<%=user.getFans(ID) %></span>
       <br/>
   	   <br/>
   	</center>
    
    <%}
    else{
    System.out.println("--本人浏览--");
     %>
   	<center>
   		  <a href="Follow2.jsp" style="color:838383">关注</a>
   		  <span>|</span>
        <a href="Follow.jsp" style="color:838383">粉丝</a>
        <br/>
   		<a target="_blank" class="people-edit-btn" href="UserInfoServlet" style="color:838383">编辑</a>
   		<br/>
   		<br/>
   	</center>
   	<%} %>
   	<div class="box1" style="color:#838383;">
   	    <div class="ifram" id="trace"><!-- 具体页面 -->
   	      <p><img src=<%=user.getUser_IMG(ID)%>  style="width: 70px;height: 70px;margin-top: 5PX;margin-left: 10px;border-radius:25px;"></p>
          <p style="margin-left: 90PX;margin-top:-70PX;font-size:20px;">
          	<font face="LiSu"><%=user.getUser_name(ID) %></font>
          </p>
          <p></p>
          	<div style="margin-top:30px;margin-left:20px;">
          	<p>我的个人简介</p>
          	<p><%=user.getPROFILE(ID) %></p>
            </div>
   	    </div>
   	  	<div class="right">
   	  		<a href="User.jsp" ><!--动态 -->
            <button class="button">
            <i class="fa fa-bell" style="color: #FF83FA;"></i>
            <span style="color: #000000;" >动态</span>
            </button></a><br/>
            <a href="alb.jsp"  ><!--专辑 -->
            <button class="button">
            <i class="fa fa-file-picture-o" style="color: #9AFF9A;"></i> 
            <span style="color: #000000;" >专辑</span>
            </button></a><br/>
            <a href="articles.jsp" ><!--自己发表的文章 -->
            <button class="button">
            <i class="fa fa-file-text" style="color: #FFC0CB;"></i>
            <span style="color: #000000;" >文章</span>
            </button></a><br/>
        </div>
       </div>  
       <%
   } %>     
   </body>
</html>

<%@ page language="java" import="java.util.*,people.UserBean,people.UserInfoBean,source.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
       <link rel="stylesheet" type="text/css" href="CSS/User.css">
       <link  rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
   </head>
<jsp:include page="main.jsp" flush="true"/>
   <body>
    <% 
   if(request.getSession().getAttribute("ID")==null){
   		System.out.println("--article页面没有绑定用户ID--");
   		request.setAttribute("Emessage", "User_ID_NULL");
		request.getRequestDispatcher("Error.jsp").forward(request, response);
		return;
   }
   else{
   		int ID = (Integer)request.getSession().getAttribute("ID");
   		System.out.println("--article页面绑定的用户ID是:"+ID+"--");
   		request.getSession().setAttribute("ID", ID);
		UserBean user = new UserBean();
		UserInfoBean user_inf = new UserInfoBean();
		if(user.getUser_name(ID)==null){
			System.out.println("--article页面用户名为null--");
	   		request.setAttribute("Emessage", "User_USER_NAME_NULL");
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			return;
		}
		else{
	%>
   	<br>
   	<br>
   	<center>
   	  <meta charset="utf-8" />
      <img src=<%=user_inf.getBG_IMG(ID) %>  alt="图片正在加载......">
      <img  style="position: absolute;border-radius: 50px;border: none;margin-left:-440px;margin-top: 50px;" width="100px" height="100px" src=<%=user.getUser_IMG(ID) %>>
    </center>
    <center>
        <div class="User_name">
        <%=user.getUser_name(ID) %>
        </div>
   		  <a target="_blank" href="Follow2.jsp" style="color:838383">关注</a>
   		  <span>|</span>
        <a target="_blank" href="Follow.jsp" style="color:838383">粉丝</a>
        <br/>
   		<a target="_blank" class="people-edit-btn" href="UserInfoServlet" style="color:838383">编辑</a>
   		<br/>
   		<br/>
   	</center>
   	<div class="right" style="margin-top:10px;margin-left:1060px;">
   	  		  <a href="User.jsp" >
            <button class="button"> 
            <i class="fa fa-bell" style="color: #FF83FA;"></i>
            <span style="color: #000000">动态</span>
            </button></a><br/>
            <a href="alb.jsp"  >
            <button class="button">
            <i class="fa fa-file-picture-o" style="color: #9AFF9A;"></i>
            <span style="color: #000000;">专辑</span>
            </button></a><br/>
            <a href="articles.jsp" >
            <button class="button" style="background:#7ecef4;color:#ffffff;" >
            <i class="fa fa-file-text" style="color: #FFC0CB;"></i>
            <span style="color: #ffffff;">文章</span>
            </button></a><br/>
        </div>
   	<div class="box1"style="width:600px;margin-top:-140px;">
   	
   	<%
	   	ArtBean art = new ArtBean();
	   	List<ArtBean> arts = new ArrayList<>();
	   	arts = art.getArts_2(ID);
	   	for(ArtBean article:arts){
   	 %>
   	
   	    <div class="ifram" style="height:200px;">
   	    	<p><img   src=<%=user.getUser_IMG(ID)%>  style="width: 70px;height: 70px;margin-top: 5PX;margin-left: 10PX;">
          <p style="margin-left: 90PX;margin-top:-70PX;font-size:20px;"><font face="LiSu"><%=user.getUser_name(ID) %></font></p>
          <p style="margin-left: 90PX;margin-top: -10px; color:838383;font-size: 6px;"><%=article.getArt_time() %></p>
          <p>发布文章<a style="font-size: 36px;" href="ArticleShow.jsp?art_id=<%=article.getArt_id()%>&author_id=<%=article.getArtAuthor()%>"><%=article.getArtTitle() %></a></p>
   	    </div>
   	    
   <%} %> 
   	    
   	  	
       </div>       
  <%
  }
   } %>  
   </body>
</html>

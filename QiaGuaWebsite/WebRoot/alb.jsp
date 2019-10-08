<%@ page language="java" import="java.util.*,people.*,source.*" pageEncoding="utf-8"%>
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
   		System.out.println("--alb页面没有绑定用户ID--");
   		request.setAttribute("Emessage", "User_ID_NULL");
		request.getRequestDispatcher("Error.jsp").forward(request, response);
		return;
   }
   else{
   		int ID = (Integer)request.getSession().getAttribute("ID");
   		System.out.println("--alb页面绑定的用户ID是:"+ID+"--");
   		request.getSession().setAttribute("ID", ID);
		UserBean user = new UserBean();
		UserInfoBean user_inf = new UserInfoBean();
		AlbBean albs = new AlbBean();
		List<Integer> alb_ids = new ArrayList<>();
		alb_ids = albs.getAlbs(ID);
		if(user.getUser_name(ID)==null){
			System.out.println("--alb页面用户名为null--");
	   		request.setAttribute("Emessage", "User_USER_NAME_NULL");
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			return;
		}
		else{
			CollectBean coll = new CollectBean();
	%>
   	<br>
   	<br>
   	<center>
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
   	<div class="box1">
        <div class="ifram" style="height:auto;">
            <div class="box2" style="margin-left: 15px;margin-top: 10px;float:left;">
        <a href="AlbCreate.jsp">
                 <p style="color: #eeeeee; font-size:70px;margin-left: 115px">+</p>
        </a>
                 <p style="color:#d3d3d3;margin-left: 110px;margin-top: -30px;">新建专辑</p>
                 </div>
   <%
     for(int alb_id:alb_ids){   
     	AlbBean conAlb = new AlbBean();
     	conAlb.getAlb(alb_id);
     	PicBean picbean = new PicBean();
     	picbean = picbean.getOnePic(alb_id);
     	System.out.println(picbean.getPic_addr());
    %>
    	
            <div class="box2" style="float:left;margin-left:15px;margin-top:10px;">
                  <p><img src=<%=picbean.getPic_addr() %>  style="width: 115px;height: 210px;margin-left: 15PX;position:relative;"/></p>
                  <p><a href="Search/blog.jsp?source_id=<%=alb_id%>"><center><%=conAlb.getAlb_name() %></center></a></p>
                  <center>
                  	<p style="color:#d3d3d3;">图片<%=conAlb.getAlb_sum() %>|收藏<%=coll.getCol_Num(alb_id) %></p>
                  </center>
            </div>
   <%}%>
        </div>   
   	  	<div class="right" style="margin-top:-0px;height:300px;">
            <a href="User.jsp" >
            <button class="button">
            <i class="fa fa-bell" style="color: #FF83FA;"></i>
            <span style="color: #000000;">动态</span>
            </button></a><br/>
            <a href="alb.jsp"  >
            <button class="button" style="background:#7ecef4;color:#ffffff;">
            <i class="fa fa-file-picture-o" style="color: #9AFF9A;"></i>
            <span style="color:#ffffff;">专辑</span>
            </button></a><br/>
            <a href="articles.jsp" >
            <button class="button">
            <i class="fa fa-file-text" style="color: #FFC0CB;"></i>
            <span style="color: #000000;">文章</span>
            </button></a><br/>
                        
        </div>
       </div>  
    
         <%}
   } %>     
   </body>
</html>

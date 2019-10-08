<%@ page language="java" import="java.util.*,source.*,people.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
<title>搜索-恰瓜</title>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.result{margin-left: 200px;width: 800px;}
.uldiv>ul>li{float:left;width:120px;list-style: none;margin-top:15px;}
.pic_div{height: auto;width: 230px;position:relative;margin-left:20px;margin-top:20px;float: left;box-shadow:0 0 3px rgba(0,0,0,.2);
background-color:transparent;}
a{
  text-decoration: none;
}

.sr{
  width: 1000px;
  margin:0 auto;
}

</style>
</head>
<jsp:include page="../main.jsp" flush="true"/>
<body>
<%
if(request.getSession().getAttribute("ID")==null){
	System.out.println("搜索显示页面4ID为空");
}
else{
	if(request.getSession().getAttribute("Piclist")==null && request.getAttribute("Userlist")==null && request.getSession().getAttribute("Alblist")==null&&request.getSession().getAttribute("Artlist")==null||request.getSession().getAttribute("key")==null ){
		System.out.println("搜索显示页面4关键词有空");
		System.out.println("key"+request.getSession().getAttribute("key"));
		System.out.println("Piclist"+request.getSession().getAttribute("Piclist"));
		System.out.println("Userlist"+request.getSession().getAttribute("Userlist"));
		System.out.println("Alblist"+request.getSession().getAttribute("Alblist"));
	}
	else{
		int ID = (int)request.getSession().getAttribute("ID");
		request.getSession().setAttribute("ID", ID);
		String key = (String)request.getSession().getAttribute("key");
		List<PicBean> list = (List<PicBean>)request.getSession().getAttribute("Piclist");
		List<AlbBean> list2 = (List<AlbBean>)request.getSession().getAttribute("Alblist");
		List<UserBean> list3 = (List<UserBean>)request.getSession().getAttribute("Userlist");
		List<ArtBean> list4 = (List<ArtBean>)request.getSession().getAttribute("Artlist");
		request.getSession().setAttribute("Piclist", list);
		request.getSession().setAttribute("Alblist", list2);
		request.getSession().setAttribute("Userlist", list3);
		request.getSession().setAttribute("Artlist", list4);
		System.out.println("达人批量展示");
 %>
 <div style="height: 40px;background-color:transparent;"></div>
  <div style="width: 80%; min-height: 800px; background-color:white;margin-left:10%;color:black;
  overflow:auto;height:auto;box-shadow:0 0 3px rgba(0,0,0,.2);min-width:600px;">
  		<div style="background-color:#184965;height:50px;" class="uldiv">
		      <ul style="margin-left:30%;">
		        <li style="color: #7ecef4">
		        	<a href="Search/search1.jsp" style="text-decoration: none;color: #838383;">图片</a>
		        </li>
		        <li>
		        	<a href="Search/search2.jsp" style="text-decoration: none;color: #838383;">专辑</a>
		        </li>
		        <li>
		        	<a href="Search/search3.jsp" style="text-decoration: none;color: #838383;">文章</a>
		        </li>
		        <li>
		        	<a href="Search/search4.jsp" style="text-decoration: none;color: #7ecef4;">达人</a>
		        </li>
		      </ul>
		</div>
    	<div class="result" style="background-color:transparent;height: auto;min-height: 800px;">
		    <div class="tab" style="background-color:transparent;min-width:460px;width:100%;">
	<%if(list3!=null&&list3.size()!=0)
	for(UserBean user:list3){
    ThumbBean thumb = new ThumbBean();
    CollectBean collect = new CollectBean();
	CommentBean coms = new CommentBean();
	PicBean picture = new PicBean();
     %> 
     
      <div id="cur" style="margin-top:20px;box-shadow:0 0 3px rgba(0,0,0,.2);min-height:100px;">
	      <a href="User.jsp?id=<%=user.getUser_id() %>" style="color: black;">
		     <div id="usr">
		     	<img src=<%=user.getUser_IMG() %> style="width: 60px;height: 60px;border-radius:30px;">
		      	<p class="username" style="margin-top: -40px;margin-left: 65px;"><%=user.getUser_name() %></p>
		     </div>
	      </a>
	      <div class="xianshi" style="height: 20px;width: 300px;float: left;margin-top:-5px;">
	      	<p style="margin-left: 75px; ">关注<%=user.getIdols(user.getUser_id()) %>|粉丝<%=user.getFans(user.getUser_id()) %></p>
	      </div>
	      <div  class="interest" style="margin-top:-40px;">
	      <%FollowBean relation = new FollowBean();
	      if(user.getUser_id()!=ID){
	      if(relation.isFan(ID, user.getUser_id())){//是粉丝
	       %>
	       	<a href="Follow2Servlet?fan=<%=ID %>&idol=<%=user.getUser_id() %>"><button href="search4.jsp" style="color: white;
	       	border-radius:20px;outline:none;margin-left: 40%;" >已关注</button></a>
	       <%}
	      else{ %>
	      	<a href="Follow2Servlet?fan=<%=ID %>&idol=<%=user.getUser_id() %>"><button href="search4.jsp" style="color: white;
	      	border-radius:20px;outline:none;margin-left: 40%;">关注</button></a>
	   <%}
	   }%>
	   	  </div>
	   	  <br />
      </div>
  <%  }
    else{%>
      <div><center><h1 style="color:#838383;">暂未找到相关资源！</h1></center></div>
    <% }%>
      </div>
      </div>
    </div>
    
    
   <%}} %> 
    
 </body>

 
 
 
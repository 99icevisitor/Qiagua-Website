<%@ page language="java" import="java.util.*,source.*,people.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="../CSS/search.css" />
<title>搜索-恰瓜</title>
<style type="text/css">
.result{margin-left: 200px;width: 800px;}
.uldiv>ul>li{float:left;width:120px;list-style: none;margin-top:15px;}
.pic_div{height: auto;width: 230px;position:relative;margin-left:20px;margin-top:20px;float: left;box-shadow:0 0 3px rgba(0,0,0,.2);
background-color:transparent;}
</style>
</head>
<jsp:include page="../main.jsp" flush="true"/>
<body>
<%
if(request.getSession().getAttribute("ID")==null){
	System.out.println("搜索显示页面1:ID为空");
}
else{
	if(request.getSession().getAttribute("key")==null || request.getSession().getAttribute("Piclist")==null &&request.getSession().getAttribute("Userlist")==null&&request.getSession().getAttribute("Alblist")==null&&request.getSession().getAttribute("Artlist")==null){
	System.out.println("搜索显示页面1:关键词为空或者全部资源为空");
	request.setAttribute("Emessage", "NO_SOURCE");
	request.getRequestDispatcher("Error.jsp").forward(request, response);
	return;
	}
	else{
		int ID = (int)request.getSession().getAttribute("ID");
		String key = (String)request.getSession().getAttribute("key");
		request.getSession().setAttribute("ID", ID);
		List<PicBean> list = (List<PicBean>)request.getSession().getAttribute("Piclist");
		List<AlbBean> list2 = (List<AlbBean>)request.getSession().getAttribute("Alblist");
		List<UserBean> list3 = (List<UserBean>)request.getSession().getAttribute("Userlist");
		List<ArtBean> list4 = (List<ArtBean>)request.getSession().getAttribute("Artlist");
		request.getSession().setAttribute("Piclist", list);
		request.getSession().setAttribute("Alblist", list2);
		request.getSession().setAttribute("Userlist", list3);
		request.getSession().setAttribute("Artlist", list4);
		System.out.println("图片批量展示");
 %>
  <div style="height: 40px; background-color:transparent;"></div>
  <div style="width: 80%; min-height: 600px; background-color:white;margin-left:10%;
  color:black;height:auto;box-shadow:0 0 3px rgba(0,0,0,.2);min-width:800px;overflow:auto;">
  		<div style="background-color:#184965;height:50px;" class="uldiv">
		      <ul style="margin-left:30%;">
		        <li style="color: #7ecef4">
		        	<a href="Search/search1.jsp" style="text-decoration: none;color: #7ecef4;">图片</a>
		        </li>
		        <li>
		        	<a href="Search/search2.jsp" style="text-decoration: none;color: #838383;">专辑</a>
		        </li>
		        <li>
		        	<a href="Search/search3.jsp" style="text-decoration: none;color: #838383;">文章</a>
		        </li>
		        <li>
		        	<a href="Search/search4.jsp" style="text-decoration: none;color: #838383;">达人</a>
		        </li>
		      </ul>
		</div>
  		<div class="result" style="background-color:transparent;min-height:600px;height: auto;">
		    <div class="tab" style="background-color:transparent;min-width:460px;width:100%;">

    <%if(list!=null&&list.size()!=0)
    for(PicBean pic:list){
    ThumbBean thumb = new ThumbBean();
    CollectBean collect = new CollectBean();
	CommentBean coms = new CommentBean();
     %>
	      		<div class="pic_div">
			      	<a href="Search/blog.jsp?source_id=<%=pic.getPic_id()%>">
			      		<img src=<%=pic.getPic_addr() %> style="height: auto;width: 230px;" />
			      	</a>
	      			<p style="margin-left: 10px;"><%=pic.getDes() %></p>
	      			<div style="background-color:transparent;height:30px;">
			       		<p>
				       		<i class="fa fa-thumbs-o-up" style="color: #7ecef4;margin-left: 20px;margin-top:-20px;"></i>
				       		<%=thumb.getThumb_Num(pic.getPic_id()) %>
			       		</p>
			       		<p style="margin-top: -35px;margin-left:80px;">
				       		<i class=" fa fa-star-o" style="color: #7ecef4;"></i>
				       		<%=collect.getCol_Num(pic.getPic_id()) %>
			       		</p>
	      			</div>
	      		</div>
      
      <%} 
      else{
      %>
      <div><center><h1 style="color:#838383;">暂未找到相关资源！</h1></center></div>
      <%} %>
    		</div>
  		</div>
  	
<%} 
}%>
    
    </div>
 </body>
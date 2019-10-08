<%@ page language="java" import="java.util.*,source.*,people.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css"/>
<title>搜索-恰瓜</title>
<style type="text/css">
a{text-decoration:none;}
a>p:hover a>p:visited a>p:active{color: #7ecef4;}
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
	System.out.println("搜索显示页面3ID为空");
}
else{
	if(request.getSession().getAttribute("Piclist")==null && request.getSession().getAttribute("Userlist")==null && request.getSession().getAttribute("Alblist")==null&&request.getSession().getAttribute("Artlist")==null||request.getSession().getAttribute("key")==null ){
	System.out.println("搜索显示页面3关键词有空");
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
		System.out.println("文章批量展示");
 %>
 
  <div style="height: 40px;background-color:transparent;"></div>
  <div style="width: 80%; min-height: 600px; background-color:white;margin-left:10%;color:black;
  height:auto;box-shadow:0 0 3px rgba(0,0,0,.2);min-width:800px;overflow:auto;">
  		<div style="background-color:#184965;height:50px;" class="uldiv">
		      <ul style="margin-left:30%;">
		        <li style="color: #7ecef4">
		        	<a href="Search/search1.jsp" style="text-decoration: none;color: #838383;">图片</a>
		        </li>
		        <li>
		        	<a href="Search/search2.jsp" style="text-decoration: none;color: #838383;">专辑</a>
		        </li>
		        <li>
		        	<a href="Search/search3.jsp" style="text-decoration: none;color: #7ecef4;">文章</a>
		        </li>
		        <li>
		        	<a href="Search/search4.jsp" style="text-decoration: none;color: #838383;">达人</a>
		        </li>
		      </ul>
		</div>
    	<div class="result" style="background-color:transparent;height: auto;min-height: 800px;">
		    <div class="tab" style="background-color:transparent;min-width:460px;width:100%;">
	<%if(list4!=null&&list4.size()!=0)
	for(ArtBean art:list4){
    ThumbBean thumb = new ThumbBean();
    CollectBean collect = new CollectBean();
	CommentBean coms = new CommentBean();
	PicBean picture = new PicBean();
	UserBean author = new UserBean(art.getArtAuthor());
     %> 
      <div style="margin-top:20px;box-shadow:0 0 3px rgba(0,0,0,.2);min-height:100px;">
	      <div>
	      	<img src=<%=author.getUser_IMG() %> style="width: 50px;height: 50px;border-radius:25px;">
	      	<p style="margin-top: -35px;margin-left: 55px;"><%=author.getUser_name() %></p>
	      </div>
      	  <a href="ArticleShow.jsp?art_id=<%=art.getArt_id() %>"><p style="margin-top: 30px;height: 10px;margin-left: 10px;"><%=art.getArt_title() %></p></a>
      </div>
    <%}
    else{%>
      <div><center><h1 style="color:#838383;">暂未找到相关资源！</h1></center></div>
    <% }%>
      </div>
      </div>
      </div>
   <%}} %>
 </body>
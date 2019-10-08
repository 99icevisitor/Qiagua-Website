<%@ page language="java" import="java.util.*,source.*,people.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="../CSS/search.css" />
<title>搜索-恰瓜</title>
<style type="text/css">
a{text-decoration:none;}
.result{margin-left: 200px;width: 800px;}
.uldiv>ul>li{float:left;width:120px;list-style: none;margin-top:15px;}
.pic_div{height: auto;width: 230px;position:relative;margin-left:20px;margin-top:20px;float: left;box-shadow:0 0 3px rgba(0,0,0,.2);
background-color:transparent;}
.result .tab{border:none; margin-top:10px;height: auto;color: #838383;}
</style>
</head>
<jsp:include page="../main.jsp" flush="true"/>
<body>
<%
if(request.getSession().getAttribute("ID")==null){
	System.out.println("搜索显示页面2ID为空");
}
else{
	if(request.getSession().getAttribute("Piclist")==null && request.getSession().getAttribute("Userlist")==null && request.getSession().getAttribute("Alblist")==null&&request.getSession().getAttribute("Artlist")==null||request.getSession().getAttribute("key")==null ){
	System.out.println("搜索显示页面2关键词有空");
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
		System.out.println("专辑批量展示");
 %>
  <div style="height: 40px;background-color:transparent;"></div>
  <div style="width: 80%; background-color:white;margin-left:10%;color:black;height:auto;
  min-height:1000px;box-shadow:0 0 3px rgba(0,0,0,.2);min-width:800px;overflow:auto;">
  		<div style="background-color:#184965;height:50px;" class="uldiv">
		      <ul style="margin-left:30%;">
		        <li style="color: #7ecef4">
		        	<a href="Search/search1.jsp" style="text-decoration: none;color: #838383;">图片</a>
		        </li>
		        <li>
		        	<a href="Search/search2.jsp" style="text-decoration: none;color: #7ecef4;">专辑</a>
		        </li>
		        <li>
		        	<a href="Search/search3.jsp" style="text-decoration: none;color: #838383;">文章</a>
		        </li>
		        <li>
		        	<a href="Search/search4.jsp" style="text-decoration: none;color: #838383;">达人</a>
		        </li>
		      </ul>
		</div>
    	<div class="result" style="background-color:transparent;height: auto;min-height: 1000px;">
		    <div class="tab" style="background-color:transparent;min-width:460px;width:100%;height: auto;min-height:540px;">
	<%if(list2!=null&&list2.size()!=0)
	for(AlbBean alb:list2){
    ThumbBean thumb = new ThumbBean();
    CollectBean collect = new CollectBean();
	CommentBean coms = new CommentBean();
	PicBean picture = new PicBean();
	String pic_addr = picture.getPic_addr(alb.getOnePic(alb.getAlb_id()));
	
     %>
      			<div class="pic_div">
      				<a href="Search/blog.jsp?source_id=<%=alb.getAlb_id() %>">
      					<div style="width: 230px;height: 180px;margin-top: 0px;border:1px solid #ccc;">
      						<img src=<%=pic_addr %> style="height: auto;width: 100px;margin-top: 5px;margin-left: 5px;"/>
      					</div>
      					<div style="border:1px solid #ccc;border-top: none;width: 230px;margin-top: -17px;height: 100px;">
      						<p style="margin-top: 15px;text-align: center;color: black;"><b><%=alb.getAlb_name() %></b></p>
      						<span><%=alb.getAlb_sum() %>图片 · <%=collect.getCol_Num(alb.getAlb_id()) %>收藏</span>
						</div>
      				</a>
      			</div>
    <%}
     else{ 	
    %>
    			<div><center><h1 style="color:#838383;">暂未找到相关资源！</h1></center></div>
    <%} %>
      		</div>
      	</div>
      	</div>
<%}} %>
		    
    
    
 </body>
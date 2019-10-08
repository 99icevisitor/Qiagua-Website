<%@ page language="java" import="java.util.*,source.AlbBean" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>恰瓜--专辑选择</title>
    <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   		<form action="PicServlet" id="mainForm" method="post">
               <div class="content">
                   <div class="details">
                       <div class="alb">
                           <label>请选择你要保存的专辑</label>
                           <select name="alb_id" id="alb_id" onchange="getValue()">
                           <%   
                           if(request.getSession().getAttribute("ID")!=null){
				          		int ID = (Integer)request.getSession().getAttribute("ID");
				          		request.getSession().setAttribute("ID", ID);
				          		AlbBean Alb = new AlbBean();
				          		List<Integer> albs = Alb.getAlbs(ID);
                           		for(Integer alb_id:albs){
                           			AlbBean alb =new AlbBean();
                           			alb.getAlb(alb_id);
                           %><option value="<%=alb_id %>"><%=alb.getAlb_name() %></option>
                               <%}
                               }%>
                           </select>
                       </div>
                   </div>
               </div>
            <button type="submit">确认</button>
        </form>
  </body>
</html>

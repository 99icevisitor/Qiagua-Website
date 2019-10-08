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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
	a{
		text-decoration:none;
	}
	.details{
	width: 60%;
	height: 300px;
	min-width: 500px;
	background-color: #f2f2f2;
	margin-top: 120px;
	}
	.empty{
	height:40px;
	}
	.alb{
	background-color: #96d7f5;
	width:80%;
	min-width:460px;
	height:80px;
	padding-top:60px;
	font-family:"FangSong";
	}
	button{
	border-radius: 5px;
	width: 120px;
	height: 40px;
	position: relative;
	margin-top: 30px;
    background-color: #c5e7f7; /* Blue */
    border: none;
    color: white;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    outline: none;
}
button:hover{
	box-shadow: 0 10px 14px 0 rgba(0,0,0,0.24),0 20px 26px 0 rgba(0,0,0,0.19);
}

  		.back-to-manager{
			width: 300px;
			height: 50px;
			background-color: transparent;
			float: left;
			font-family: "FangSong";
			font-size: 36px;
			color: #7ecef4;
			font-weight: bold;
		}
		.back-button{
			background-color: transparent;
		}
		.back-button:link{
			color: #7ecef4;
		}
		.back-button:hover{
			text-shadow: 3px 1px 6px #dddddd;
			color: #7ecef4;
		}
		.back-button:visited{
			color: #7ecef4;
		}
		.back-button:active{
			color: #70c8f1;
		}
  	</style>
  </head>
  
  <body>
  	<center>
  	  <%   if(request.getSession().getAttribute("ID")!=null){
				int ID = (Integer)request.getSession().getAttribute("ID");
				request.getSession().setAttribute("ID", ID);
		%>
   		<form action="CollectServlet" id="mainForm" method="get">
               <div class="content">
               	   <div class="back-to-manager">
						<a href="User.jsp" class="back-button">返回个人中心</a>
				   </div>
                   <div class="details">
                   	   <div class="empty"></div>
                       <div class="alb">
                           <label>请选择你要保存的专辑</label>
                           <select name="alb_id" id="alb_id" onchange="getValue()">
                         
				          		<%
				          		int source_id = Integer.valueOf(request.getParameter("source_id"));
				          		request.getSession().setAttribute("source_id", source_id);
				          		AlbBean Alb = new AlbBean();
				          		List<Integer> albs = Alb.getAlbs(ID);
                           		for(Integer alb_id:albs){
                           			AlbBean alb =new AlbBean();
                           			alb.getAlb(alb_id);
                           %><option value="<%=alb_id %>"><%=alb.getAlb_name() %></option>
                               <%}%>
                              
                           </select>
                       </div>
                       <button type="submit">确认</button>
                   </div>
               </div>
        </form>
        <%  }
        else{
        	request.setAttribute("Emessage", "ID_NULL");
        	request.getRequestDispatcher("Error.jsp").forward(request, response);
        	return;
        	} %>
     </center>
  </body>
</html>

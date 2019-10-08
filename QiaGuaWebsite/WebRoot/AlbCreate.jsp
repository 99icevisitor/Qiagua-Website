<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>恰瓜--专辑创建</title>
    <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

 <style type="text/css">
 	body{
 		background-color:#e1f4fd;
 	}
 	h2{
 		padding-top:4px;
 	}
		.create_alb{
			width: 40%;
			min-width: 500px;
			margin-left: 30%;
			margin-right: 30%;
			height: 350px;
			background-color: #7ecef4;
			opacity: 0.6;
		}
		.alb_name1{
			height: 30px;
			margin-left: 10%;
			font-family: "FangSong";
		}
		.alb_name2{
			height: 30px;
			font-family: "FangSong";
			margin-top: -30px;
		}
		.alb_name12{
			height: 30px;
			margin-left: 10%;
			font-family: "FangSong";
		}
		.alb_name3{
			height: 190px;
			font-family: "FangSong";
			margin-top: -30px;
		}
		.des{
			height: 180px;
			width: 300px;
		}
		.button {
		    background-color: #4CAF50; /* Green */
		    border: none;
		    color: white;
		    padding: 15px 32px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 16px;
		    margin: 4px 2px;
		    cursor: pointer;
		}

		.button1 {width: 250px;}
		.button1:hover{
			background-color: #008000;
		}	
		.back{
			width: 40px;
			height: 40px;
			float: right;
			margin-top: -40px;
		}	
	</style>
<script language="javascript" type="text/javascript">      
	     function validate ()   {   
	       var inputName = document.getElementById("name").value;  
	       var inputDes = document.getElementById("des").value;
	       if(inputName.length <=0)   
	       {   
	           alert("请输入专辑名！");   
	           return false;
	       }    
	       else if(inputDes.length<=0)
	       {
	       	alert("请输入专辑简介！");
	       	return false;
	       	}
	       else
	       {   
	       return true;
	       }   
	     }   
	  </script>

</head>

<body>
	<%
	if(request.getSession().getAttribute("ID")!=null){
		int ID = (int)request.getSession().getAttribute("ID");
		System.out.println("创建专辑ID:"+ID);
	 %>
		<form action="AlbServlet" method="post" onsubmit="return validate()">
			<div class="create_alb">
				<center><h2>创建你的新专辑</h2></center>
				<div class="back"><a href="alb.jsp">取消</a></div>
				<div class="alb_name1"><p>专辑名</p></div>
				<div class="alb_name2"><center><input type="text" name="alb_name" id="name"></center></div>
				<div class="alb_name12"><p>简介</p></div>
				<div class="alb_name3"><center><input type="textarea" name="alb_describe" class="des" id="des"></center></div>
				<div class="btn-bg"><center><button type="submit" class="button button1">确认创建</button></center></div>
			</div>
		</form>
	<%} %>

</body>
</html>

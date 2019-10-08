<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="CSS/Picload.css">
    <script type='text/javascript' src='js/img.js' charset='utf-8'></script>
    <title>恰瓜--上传图片</title>
     <script>  
	  	function validate()   {   
	       var inputImg = document.getElementById("id-face").value;  
	       var inputDes = document.getElementById("pic_des").value;
	       if(inputImg.length <=0)   
	       {   
	           alert("请上传图片！");   
	           return false;
	       }   
	       else if(inputDes.length<=0)
	       {
	       	alert("请输入简介！");
	       	return false;
	       }
	       else
	       {   
	       return true;
	       }   
	     }   
	  </script>
	  <style type="text/css">
	  a{
	  	text-decoration:none;
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
	<div class="back-to-manager">
		<a href="User.jsp" class="back-button">返回个人中心</a>
	</div>

 <%
    if(request.getAttribute("alb_id")!=null || request.getParameter("alb_id")!=null){
    	int alb_id ;
    	if(request.getAttribute("alb_id")!=null){
    		alb_id = (int)request.getAttribute("alb_id");
    	}
    	else{
    		alb_id =Integer.valueOf(request.getParameter("alb_id"));
    	}
    	System.out.println("--图片上传之前选择的专辑ID是"+alb_id+"--");
    	if(request.getSession().getAttribute("ID")!=null){
    		int ID = (int)request.getSession().getAttribute("ID");
    		System.out.println("--图片上传之前操作的用户ID是"+ID+"--");
    		request.getSession().setAttribute("alb_id", alb_id);
    		request.getSession().setAttribute("ID", ID);
    	 %>
	<form action="UploadSer" enctype="multipart/form-data" method="post" onsubmit="return validate()">
		
		<center>
			<div class="article-img">
				<div class="getimg">
					<input type="file" id='id-face' name='article-img' class="img-input" accept="image/*" />
					<div class="icons" id='face-empty-result'></div>
                </div>
				<div class="tip-words">
					<i class="fa fa-camera"></i>
					<p>建议尺寸600*300，且图片大小小于1M</p>
				</div>
				<div class="uploaded">
                	<img class="result-img" id='face-result' />
                </div>
			</div>
			<div class="pic_des">
				<label>简介</label>
            	<input class="pic_describe" id="pic_des" type="text" placeholder="请输入描述信息" name="pic_des"/>
            </div>
			<div class="btn-buttom">
				<button class="bttn button5" type="submit">上传</button>
			</div>
	</center>
	
	</form>
 <%}
    	 } %>
</body>
</html>
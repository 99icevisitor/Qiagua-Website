<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath%>">
	<title>恰瓜--图片详情</title>
	<link rel="stylesheet" type="text/css" href="CSS/Picture.css">
<script language="javascript" type="text/javascript">      
	     function isValid ()   {   
	       var inputComment = document.getElementById("newComment").value;  
	       if(inputComment.length <=0 ||inputComment == "赞美吐槽来一波~")   
	       {   
	       		alert("请输入评论！");
	       		return false;
	       } 
	       else if(inputComment.length >=200){
	       		alert("评论过长！");
	       		return false;
	       }
	       return true;
	     }   
	  </script>

</head>

<body>
	<center>
	<div class="model">
		<div class="pic-2_3 undisplay">
			<center>
			<img src="images/main/kker.jpg" class="picture type1">
			</center>
		</div>
		<div class="pic-3_2 display">
			<center>
			<img src="images/main/kker.jpg" class="picture type2">
			</center>
		</div>
		<div class="pic-1_1 undisplay">
			<center>
			<img src="images/main/kker.jpg" class="picture type3">
			</center>
		</div>
		<div class="comment">
				
				<div class="existComment"><!--已有评论-->
					<div class="head">
						<a href=""><img src="" class="head-img"></a>
					</div>
					<div class="time">
						<input type="text" class="exist-com" name="contents" value="楼层 时间" id="exist" readonly="readonly">
					</div>
					<div class="content">
						<input type="text" class="exist-com" name="contents" value="评论1" id="exist" readonly="readonly">
					</div>
				</div>

				<form action="PicServlet" method="post" onsubmit="return isValid()"><!--发表评论-->
					<div class="new">
						<div class="sub-com">	
							<input type="text" class="input-com" name="newComment" id="newComment" placeholder="赞美吐槽来一波~" />
						</div>
						<div class="sub-btn">
			 				<input type="submit" name="new-submit"  value="发表">
						</div>
					</div>
				</form>

				<form action="PicServlet" method="post" onsubmit="return isValid()"><!--回复评论-->
					<div class="new">
						<div class="reply-ID">
							<span class="reply">回复@ID</span>
						</div>
						<div class="sub-com">	
							<input type="text" class="input-com" name="newReply" id="newComment" placeholder="回复@ID：" />
						</div>
						<div class="sub-btn">
			 				<input type="submit" name="new-reply"  value="回复">
						</div>
					</div>
				</form>
		</div>
	</div>
	</center>
</body>
</html>

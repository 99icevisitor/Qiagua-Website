<%@ page language="java" import="java.util.*,source.*,people.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>恰瓜</title>  
 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is main page">
	<link rel="stylesheet" type="text/css" href="../CSS/blog.css">
  	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
	<style type="text/css">
a{
	text-decoration: none;
}
.follow{
	border:1px solid #7ecef4;
	border-radius: 30px;
	color: #7ecef4;
	font-size: 18px;
	width:80px;
	height: 40px;
	background-color: white;
	margin-top: -60px;
	margin-left: 500px;
}
.unfollow{
	border:1px solid;
	border-radius: 30px;
	color: white;
	font-size: 18px;
	width:80px;
	height: 40px;
	background-color: #7ecef4;
	margin-top: -60px;
	margin-left: 500px;
}
.main{
	width: 600px;
	height: auto ;
	border: 1px solid #D3D3D3;
	margin: 0 auto;
	border-bottom: none;
	margin-top: 100px;
}
#i1{
	color: #838383;
}
#i2{
	color: #7ecef4; 
}
i{
	margin-top: 5px;

}
.action{
	width: 700px;
	height: 30px;
	margin-top:10px;
	margin: 0 auto;
}
.action1{
	width: 700px;
	height: 30px;
	margin-top:10px;
	margin: 0 auto;
}
.a{
	width:200.5px;
	height: 30px ;
	border-bottom: none;
	border-top: none;
	border-left: none;
	border:1px solid #D3D3D3;
	float: left;
	background-color: white;
}
.a:hover{
	color: #7ecef4;
}
.c{color: #7ecef4;}
.b:hover{color: #7ecef4;}
.b{background-color: white;border:none;}
#discuss{
	width: 600px;
	height: 100px;
	border:1px solid #D3D3D3;
	border-top: none;
	margin:0 auto;
	display: none;
	background-color: #8383830d;
}
hr{
	background-color: #D3D3D3;
}
button{
	outline: none;
	border:1px solid;
}
.d{
	border-radius:20px;
	height:35px;
	width:80px;
	color: #ffffff;
}
.d:active{
	box-shadow: 0 1px 3px #0C5B83 inset,0 3px 0 #fff;
	background: -webkit-linear-gradient(top,#7ecef4,#71C6EE);
	background: -moz-linear-gradient(top,#7ecef4,#71C6EE);
	background: linear-gradient(top,#7ecef4,#71C6EE);
}
.d:hover{
	background: -webkit-linear-gradient(top,#7EC4EE,#61AFE0);
	background: -moz-linear-gradient(top,#7EC4EE,#61AFE0);
	background: linear-gradient(top,#7EC4EE,#61AFE0);
}
.d:hover:after{
	background:-webkit-linear-gradient(right,#61BCDB,#97E0F3 60%);
	background:-moz-linear-gradient(right,#61BCDB,#97E0F3 60%);
	background:linear-gradient(right,#61BCDB,#97E0F3 60%); 
}
.alb{
	width: 840px;
	height: 200px;
	border:1px solid #D3D3D3;
	margin: 0 auto;
	margin-top: 100px;
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
	margin-left: 30px;
	margin-top:-80px;
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
.back-button:visited{color: #7ecef4;}
.back-button:active{color: #70c8f1;}
.up-btn{width: 120px;background-color: #7ecef4;}
.pic{float: left;width: 200px;min-height: 200px;height: auto;position: relative;padding: 10px;}
</style>
  </head> 
  <body>
    <%
		if(request.getSession().getAttribute("ID")==null){
			System.out.println("--blog页面没有绑定用户ID--");
	   		request.setAttribute("Emessage", "blog_ID_NULL");
			request.getRequestDispatcher("../Error.jsp").forward(request, response);
			return;
		}
		else{
	   		int ID = (Integer)request.getSession().getAttribute("ID");
	   		if(request.getParameter("source_id")==null){
	   			System.out.println("--blog页面没有绑定资源ID--");
	   			request.setAttribute("Emessage", "blog_Source_id_NULL");
				request.getRequestDispatcher("../Error.jsp").forward(request, response);
				return;
	   		}
	   		else{
	   			int source_id = Integer.valueOf(request.getParameter("source_id"));
	   			System.out.println("--blog资源显示页面绑定的用户ID是:"+ID+"--");
	   			System.out.println("--blog资源显示的资源ID是:"+source_id+"--");
		   		request.getSession().setAttribute("ID", ID);
		   		request.getSession().setAttribute("source_id", source_id);
		   	    int Owner_id;%>
		   	    
	
	    <div class="back-to-manager">
			<a href="User.jsp" class="back-button">返回个人中心</a>
		</div>	   	    
		   	    
<% if(source_id>=100000){//图片对象
	PicBean picture = new PicBean();
	picture.getPic(source_id);
	UserBean exploer = new UserBean(ID);
	UserBean owner = new UserBean(picture.getUser_id());
	int fan_id = ID;
	int idol_id = picture.getUser_id();
	FollowBean relation = new FollowBean();
	ThumbBean thumb = new ThumbBean();
	CollectBean collect = new CollectBean();
	CommentBean coms = new CommentBean();
	List<CommentBean> com_list = coms.getComList(source_id);
	System.out.println("这里开始显示图片资源");
	boolean isOwner = false;
	if(ID==idol_id){
	  isOwner = true;
	}
	String owner_name = owner.getUser_name(idol_id);%>
	   		<div class="main">
	   			<p><input id="source_this_id" type="hidden" value=<%=source_id %>></p>
	   			<p><img src=<%=owner.getUser_IMG(idol_id)%>  style="width: 70px;height: 70px;margin-top: 5PX;margin-left: 5px; border-radius:35px;"></p>
	          	<p style="margin-top:-70PX;font-size:20px;margin-left: 85px;"><font face="LiSu"><%=owner.getUser_name(idol_id) %></font></p>
	          	<p style="margin-top: -10px; margin-left: 85px;color:838383;font-size: 6px;"><%=picture.getPic_time() %></p>
	<%if(!isOwner){//图片发布者不显示对自己的关注信息
	    if(!relation.isFan(fan_id, idol_id)){%>   
	          	<a href="FollowServlet?idol_id=<%=idol_id%>&source_id=<%=source_id%>"><button class="unfollow">关注</button></a>
	    <%}
	    else{%>     
	          	<a href="FollowServlet?idol_id=<%=idol_id%>&source_id=<%=source_id%>"><button class="follow">已关注</button></a>
	    <%} 
	}%>
	          	<img src="<%=picture.getPic_addr(source_id)%>" style="width:200px;">
			</div>
			
   	<%if(!isOwner){//浏览者不是资源的拥有者%> 
   			<div class="action">
         		<a href="ThumbServlet?source_id=<%=source_id%>&user_id=<%=ID%>">
	         		<button class="a" style="margin-left: 49px;">
	            		<center class="">
    	<%if(thumb.isThumb(ID, source_id)){//点赞功能 %>
    						<i class="fa fa-thumbs-up" id="i2"></i>
        <%}
        else{%>
            				<i class="fa fa-thumbs-up" id="i1"></i>
        <%}%>
        					<%=thumb.getThumb_Num(source_id) %>
        				</center>
         			</button>
         		</a>
   		 <%if(collect.isCol(ID, source_id)) {//收藏功能%>
   		 		<a href="CollectServlet?source_id=<%=source_id%>">
	   		   		<button class="a">   		 
	   		   			<center>
	   		   				<i class="fa fa-star-o" id="i2"></i>
	   		   				<%=collect.getCol_Num(source_id) %>
	   		   			</center>
	   		   		</button>
   		  		</a> 
   		 <%}
   		 else{//未被收藏%>
   		 		<a href="PicCol.jsp?source_id=<%=source_id%>">
	   		   		<button class="a">   		 
	   		   			<center>
		   		   			<i class="fa fa-star-o" id="i2"></i>
		   		   			<%=collect.getCol_Num(source_id) %>
	   		   			</center>
	   		   		</button>
   		 		</a> 
   		 <%} %>	
   		 		<button class="a" id="di" style="height: 30px;" >
					<center>评论</center>
				</button>	    
   			</div>
   	<%}
   	 
   	else{//是图片的发布者 %>
        	<div class="action1">
         		<a href="ThumbServlet?source_id=<%=source_id%>&user_id=<%=ID%>">
         			<button class="a" style="margin-left: 49px;">
            			<center class="">
      	<%if(thumb.isThumb(ID, source_id)){ //点赞功能%>
      						<i class="fa fa-thumbs-up" id="i2"></i>
      	<%}
       	else{%>
            				<i class="fa fa-thumbs-up" id="i1"></i>
        <%}%>
            				<%=thumb.getThumb_Num(source_id) %>
            			</center>
         			</button>
         		</a>
         <%if(ID==picture.getUser_id()){//删除功能%>
		        <a href="PicServlet?source_id=<%=source_id%>&state=1">
		         	<button class="a" onclick="delcfm()">
		            	<center>删除</center>
		         	</button>
		        </a>  
         <%} %>      
         		<button class="a" id="di" style="height: 30px;">
					<center>评论</center>
				</button>  
        	</div>
	 <%}%>
	 
		 	<div id="discuss">
         		<span style="color: #838383;margin-left: 10px;">评论</span>
         		<input id="com-content" type="text" name="content" style="width: 400px;height: 50px;border: 1px solid #7ecef4;margin-top: 20px;margin-left: 10px;"/>
         		<input id="state-show" type="hidden"/>
         		<input id="to-id" type="hidden"/>
         		<button id="di-1" style="background: white;border: none;color: #838383;margin-top: 50px;margin-left: 10px;">取消</button>
         		<button style="background: red;border: 1px solid #7ecef4;color: white;" id="com-btn">发送</button>
        	</div>
        	
   			<div class="comment"style="width: 600px;height: auto ;margin: 0 auto;background-color:transparent;">
				<div style="width: 600px;height: auto ;margin: 0 auto;">
            		<p><b style="color: #7ecef4;font-size: 18px;">| 所有评论</b></p>
     <%for(CommentBean oneComment :com_list){
     		int po_id = oneComment.getUser();
           UserBean poster = new UserBean();
           
      %>     		
	            	<div name="common-floor" id="common-floor" style="height:auto;min-height:80px;background-color:transparent;">
	              		<p><img src=<%=poster.getUser_IMG(po_id) %> style="width: 40px;height: 40px;margin-left: 2px; border-radius: 20px;"></p>
	              		<p style="margin-top:-50PX;font-size:15px;margin-left: 45px;"><font face="LiSu"><%=poster.getUser_name(po_id) %></font></p>
	              		<p style="margin-top: -15px; margin-left: 45px;color:838383;font-size: 3px;"><%=oneComment.getTime() %></p>
	              		<p><label id="floor-id"><%=oneComment.getFloor() %></label>楼</p>
	              		<div style="margin-top: -35px;">
	              		</div>
	              		<p style="margin-left: 40px;margin-top:20px;"><%=oneComment.getComment() %></p>
	              	</div>	
	              	<hr>
	  <%} %>         	
	            	
   		  		</div>
      		</div>
<% }
else {//专辑对象
	AlbBean alb = new AlbBean();
	alb.getAlb(source_id);
	CollectBean coll = new CollectBean();
	ThumbBean thumb = new ThumbBean();
	int sum = coll.getCol_Num(source_id);
	int owner_id = alb.getUser_id();
	UserBean owner = new UserBean(alb.getUser_id());
	PicBean pic_list = new PicBean();
	List<PicBean> pics = new ArrayList<>();
	pics = pic_list.getPics(source_id);
	System.out.println("这里开始显示专辑资源");
   	boolean isOwner = false;
%>
   	<div class="alb">
   	  <center>
   		<p style="font-size:20px;"><b><%=alb.getAlb_name() %></b></p>
   		<p>
   			<span style="font-size:15px;"><%=alb.getAlb_sum() %></span>
   			<span>张图片·</span>
   			<span><%=sum %>人收藏</span>
   		</p>
      <div>
   		<a href="blog"><img src=<%=owner.getUser_IMG(alb.getUser_id()) %> style="width:30px;height:30px;margin-left: -60px;"></a>
        <p style="margin-top:-30px;font-size:16px;margin-left: 20px;"><font face="LiSu"><%=owner.getUser_name(owner_id) %></font></p>
        <p style="margin-top: 0px; margin-left:15px;color:838383;font-size: 6px;"><%=alb.getAlb_time() %>创建</p>
      </div>
   <%if(ID!=owner_id){ %>
   <% 	if(!coll.isCol(ID, source_id)){//判断浏览用户是否已经收藏该专辑%>
        <a href="CollectServlet?source_id=<%=source_id%>"><button class="d" style="background:#ffc107;color:#ffffff;"><i class="fa fa-star-o" ></i>收藏</button></a>
   <%}
   		else{ %>
        <a href="CollectServlet?source_id=<%=source_id%>"><button class="d" style="background:#ffffff;color:#ffc107;"><i class="fa fa-star-o" ></i>已收藏</button></a>
        
   <%}
   		if(thumb.isThumb(ID, source_id)){//判断当前浏览用户是否已经点赞该专辑%>     
        <a href="ThumbServlet?source_id=<%=source_id%>"><button class="d" style="background:#7ecef4;color:#ffffff;"><i class="fa fa-thumbs-up" ></i>点赞</button></a>
   <%}
   		else{%>
   		<a href="ThumbServlet?source_id=<%=source_id%>"><button class="d" style="background:#ffffff;color:#7ecef4;"><i class="fa fa-thumbs-up" ></i>已点赞</button></a>
   <%}
   }
	if(ID!=owner_id){//仅仅只是浏览者
	   }
	else{//是该专辑的作者%>
      	<a href="Picload.jsp?alb_id=<%=source_id%>"><button class="d up-btn">上传新图片</button></a>
   <%}  %>
      </center>
    </div>
    <br/>
    <div style="width: 840px;margin:0 auto;"><!-- 显示图片页面大框 -->
    <%
    for(PicBean picture:pics){
    System.out.println("picture_id:"+picture.getPic_id());
     %>
    
    	<div class="pic"><!-- 单个图片框 -->
    		  <div style="position:relative;">
	    	  		<a href="Search/blog.jsp?source_id=<%=picture.getPic_id()%>"><img src=<%=picture.getPic_addr() %> style="width:100%;height:auto;"></a>
	    	  </div>
	          <div style="width: 198px;height:60px;border:1px solid #D3D3D3;"><!-- 图片属性 -->
		          	<span style="margin-left: 10px;"><%=picture.getDes()%></span>
		            <p style="color: #838383;margin-left: 10px;">
			            <span><i class="fa fa-thumbs-up" id="i1" style="color: #838383;"></i><%=thumb.getThumb_Num(picture.getPic_id()) %></span>
			            <span><i class="fa fa-star-o" id="i1" style="color: #838383;margin-left: 20px;"></i><%=coll.getCol_Num(picture.getPic_id()) %></span>
			        </p>
	          </div>
        </div>
     <%} %>  
        
        
    </div>
   		<%}
   	}
   }
   		%>
   		
   		
   		
   		
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
   	<script language="javascript"> 
      function delcfm() { 
      	if (!confirm("确认要删除？")) { 
            window.event.returnValue = false; 
        } 
      } 
    </script>
    <script type="text/javascript">
     	document.getElementById('com-btn').addEventListener('click', function () {
     			$.ajax({
     				type:"POST",
     				url: "CommentSaveServlet",
     				data:{"content":$("#com-content").val(),
		            	  "source_id":$("#source_this_id").val(),
		            	  "po-state":$("#state-show").val(),
		            	  "reference_id":$("#to_id").val()},
		            dataType: "json",
		            traditional:true,
		            success:function(message){
		            	alert(message["details"]);
		            	if(message["state"].equals("1")){
		            		Show_Hidden(new_c);
		            		$("#new-c-floor-id").val(message["new-floor"]);
			            	$("#new-c-poster-id").val(message["new-poster"]);
			            	$("#new-c-poster-img").val(message["new-img"]);
			            	$("#new-c-comment").val(message["new-com"]);
		            	}
		            	else{
		            	}
		            },
		             error:function (message) {
		                alert("提交失败"+JSON.stringify(message));
		            }
     			});
     		});
     		
		function Show_Hidden(obj){
			if(obj.style.display=="block"){
		  		obj.style.display='none';
		 	}
		 	else{
		  		obj.style.display='block';
		 	}
		}
		window.onload=function(){
			var ocomment=document.getElementById("di");
			var ocancel_1=document.getElementById("di-1");
		 	var odiv=document.getElementById("discuss");
		 	var reply_area = document.getElementById("reply_area");
		 	var orepo=document.getElementById("reply-to");
		 	ocomment.onclick=function(){
		  		Show_Hidden(odiv);
		  		$("#state-show").val("1");
		  		return false;
		 	}
		 	ocancel_1.onclick=function(){
		 		Show_Hidden(odiv);
		  		return false;
		 	}
		 	orepo.onclick=function(){
		 		Show_Hidden(reply_area);
		  		return false;
		 	}
		}
</script>
  </body>
</html>

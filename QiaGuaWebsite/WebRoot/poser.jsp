<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">    
    <base href="<%=basePath%>">
	<meta charset="UTF-8">    
	<title>瓜院长</title>    
	<meta http-equiv="X-UA-COMPATIBLE" content="IE-edge,chrome=1"><!--告诉ie使用新的渲染方式，防止低版本的ie不能使用css3-->    
	<meta name="viewport" content="width=device-width,initial-scale=1">    
	<link href="http://fonts.googleapis.com/css?family=Josefin+Slab:700" rel="stylesheet" type="text/css"/>   
	<link rel="stylesheet" type="text/css" href="CSS/poser.css">
</head>
<body>
    <%
    	if(request.getSession().getAttribute("ID")!=null){
    		int ID = (int)request.getSession().getAttribute("ID");
    		System.out.println("--ID:"+ID+"--");
    		request.getSession().setAttribute("ID", ID);
    	%>
 
   <div class="back-to-manager">
		<a style="font-size:12px;" href="User.jsp" class="back-button">返回个人中心</a>
	</div>
	<div class="container">    
		<div class="nav">       
		   <input type="radio" name="radio-set" checked id="nav1">                      
		 <div class="scroll" >        
		 	<section class="panel" id="panel1" style="margin-top: -300px;height: 400px;">            
		 		<div class="icon" data-icon=" "style="background-color:#7ecef4;"></div>            
		 		<h1 style="color: #7ecef4;">恰瓜</h1>            
		 		<p style=" color:838383;margin-top:40px;font-size:30px;">“寻找可以在平凡生活里发现不平凡的你们”</p>
		 	</section>
		</div>
	</div>
	<script>   
	 window.οnlοad= function () {        
	 	var scroll=document.getElementsByClassName("scroll")[0];//ie不兼容，换成id会成功        
	 	var panel=document.getElementsByClassName("panel");//ie不兼容，换成id会成功         
	 	var clientH=window.innerHeight;        
	 	scroll.style.height=clientH+"px";        
	 	for(var i=0;i<panel.length;i++){            
	 		panel[i].style.height=clientH+"px";        }        /*下面是关于鼠标滚动*/        
	 		var inputC=document.getElementsByTagName("input");        
	 		var wheel= function (event) {            
	 			var delta=0;           
	 		 if(!event)//for ie                
	 		 	event=window.event;            
	 		 if(event.wheelDelta){//ie,opera                
	 		 	delta=event.wheelDelta/120;            
	 		   }
	 		 else if(event.detail){               
	 		    delta=-event.detail/3;           
	 		     }           
	 		 if(delta){                
	 		   	handle(delta,inputC);           
	 		    }            
	 		 if(event.preventDefault)                
	 		   	event.preventDefault();            
	 		 event.returnValue=false;        
	 	};        
	 	if(window.addEventListener){            	 		
	 		window.addEventListener('DOMMouseScroll',wheel,false);        
	 	}        
	 	  window.onmousewheel=wheel;    
	 	};   
	 		   	 function handle(delta,arr) {        
	 		   	 	var num;        
	 		   	 	for(var i=0;i<arr.length;i++){//得到当前checked元素的下标            
	 		   	 		if(arr[i].checked){                
	 		   	 			num=i;            
	 		   	 		}        
	 		   	 	}        
	 		   	 	if(delta>0 && num>0){//向上滚动           
	 		   	 			 num--;            
	 		   	 			 arr[num].checked=true;       
	 		   	 	}
	 		   	 	else if(delta<0 && num<2){//向下滚动            
	 		   	 			num++;            
	 		   	 		   arr[num].checked=true;       
	 		   	 	}   
	 		   	 }

</script>
<%} %>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../CSS/reminder.css"/>
<title>恰瓜</title>
<style>
	*{margin:0;padding:0;}
</style></head>
<body>  
  <div style="width:100%;height: 60px;">
  </div>
  <div class="remind" >
   <div  class="remind1">
   <div class="unchecked"><a href="reminder.jsp" style="text-decoration:none;color: #838383;" >动态提醒</a></div>
   <div class="checked"><a href="message.jsp" style="text-decoration:none;color: white;" >系统消息</a></div>

   </div>
   <div id="tab" >  
    <div class="tabList">
      <ul>        
        <li class="cur">全部</li>        
        <li>已读</li>        
        <li>未读</li>            
      </ul>  
    </div>  
    <div class="tabCon">    
      <div class="cur">
      <img style="width:50px;height:50px;" src="touxiang.jpg">
       <p class="user" style="margin-left: 80px;margin-top: -50px;">qiagua</p>
      <p class="detailss" style="margin-left: 80px;margin-top: 5px;">吧啦吧啦吧</p>
      <p class="date" style="margin-top: 5px;margin-left: 80px;">1分钟前</p>
      </div>   
      <div><img style="width:50px;height:50px;" src="tou.jpg">
       <p class="user" style="margin-left: 80px;margin-top: -50px;">qiagua</p>
      <p class="detailss" style="margin-left: 80px;margin-top: 5px;">吧啦吧啦吧</p>
      <p class="date" style="margin-top: 5px;margin-left: 80px;">1分钟前</p></div>    
      <div><img style="width:50px;height:50px;" src="touxiang.jpg">
       <p class="user" style="margin-left: 80px;margin-top: -50px;">qiagua</p>
      <p class="detailss" style="margin-left: 80px;margin-top: 5px;">吧啦吧啦吧</p>
      <p class="date" style="margin-top: 5px;margin-left: 80px;">1分钟前</p></div>    
    </div>
   </div> 
  </div>
   <script>
    window.onload = function() {    
    	var oDiv = document.getElementById("tab");    
    	var oLi = oDiv.getElementsByTagName("div")[0].getElementsByTagName("li");    
    	var aCon = oDiv.getElementsByTagName("div")[1].getElementsByTagName("div");    
    	var timer = null;    
    	for (var i = 0; i < oLi.length; i++) {        
    		oLi[i].index = i;        
    		oLi[i].onmouseover = function() {            
    			show(this.index);        
    		}    
    	}    
    	function show(a) {        
    		index = a;        
    		var alpha = 0;        
    		for (var j = 0; j < oLi.length; j++) {            
    			oLi[j].className = "";            
    			aCon[j].className = "";            
    			aCon[j].style.opacity = 0;            
    			aCon[j].style.filter = "alpha(opacity=0)";        
    		}        
    		oLi[index].className = "cur";        
    		clearInterval(timer);        
    		timer = setInterval(function() {            
    			alpha += 2;            
    			alpha > 100 && (alpha = 100);            
    			aCon[index].style.opacity = alpha / 100;            
    			aCon[index].style.filter = "alpha(opacity=" + alpha + ")";            
    			alpha == 100 && clearInterval(timer);        
    		},        
    		5)    
    	}
    	}
    </script> 
    </body>
    </html>
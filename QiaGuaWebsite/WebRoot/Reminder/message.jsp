<%@ page language="java" import="java.util.*,people.*" pageEncoding="utf-8"%>
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
	.tabList ul li{
	width:300px;
	}
	.button2{
	width:50px;
	height:20px;
	border:solid ;
	margin-top:-40px;
	margin-left:500px;
	border-radius: 10px;
	border-color: #7ecef4;
	background-color: #7ecef4;
	color:white;}
	.button3{
	width:50px;
	height:20px;
	border:solid ;
	margin-top:-39px;
	margin-left:440px;
	border:1px solid #7ecef4;
	background-color: white;
	color:#7ecef4;
	}
</style></head>
<body>  
 <% 
		   if(request.getSession().getAttribute("ID")==null){
		   		System.out.println("--message页面没有绑定用户ID--");
		   		request.setAttribute("Emessage", "message_ID_NULL");
				request.getRequestDispatcher("/Error.jsp").forward(request, response);
				return;
		   }
		   else{
		   		int ID = (Integer)request.getSession().getAttribute("ID");
		   		System.out.println("--message页面绑定的用户ID是:"+ID+"--");
		   		request.getSession().setAttribute("ID", ID);
		   		MessageBean mgBean = new MessageBean();
		   		List<MessageBean> list  = mgBean.getAllMessage(ID);
		   		List<MessageBean> list1  = mgBean.getUnRead(ID);
		 %>
  <div style="width:100%;height: 60px;">
  </div>
  <div class="remind" >
   <div  class="remind1">
   <div class="checked"><a href="message.jsp" style="text-decoration:none;color: white;" >系统消息</a></div>
   </div>
 <%if(request.getSession().getAttribute("other_id")==null){ %>
   <div id="tab" >  
	    <div class="tabList">
	      <ul>        
	        <li class="cur">全部</li>               
	        <li>未读</li>            
	      </ul>  
	    </div>  
	    <div class="tabCon">    
	      <div class="cur">
 <%if(list!=null){
      List<Integer> S = new ArrayList<Integer>(); 
      for(MessageBean mes:list){
	     System.out.println(mes);
	     boolean flag1 = false;
	     int message_id = mes.getMessage_id();
	     int other_id = mes.getOther_id(ID, message_id);
	     for(int flag:S){
	      	if(flag==other_id)
	      	flag1 = true;
	     }
      	 S.add(other_id);
      	 if(flag1) break;
      	 UserBean otheruser = new UserBean();
	     String img = otheruser.getUser_IMG(other_id);
	     String other_name = otheruser.getUser_name(other_id);
	     String content = mes.getContent();
         if(content.length()>25)
         	content = mes.getContent().substring(0,20)+"...";%>
		      <form action="/QiaGuaWebsite/MessageServlet" method="get">
			      <img src="<%=img %>" style="width:50px;height:50px;" />
			      <p class="user" style="margin-left: 80px;margin-top: -50px;"><%=other_name %></p>
			      <p class="detailss" style="margin-left: 80px;margin-top: 5px;"><%=content %></p>
			      <p class="date" style="margin-top: 5px;margin-left: 80px;"><%=mes.getSend_time() %></p>
			      <button class="button3"  type="submit" name="look" value="<%=other_id %>">查看</button>
			      <button class="button2"  type="submit" name="del" value="<%=other_id %>">删除</button>
			      <hr style="color:#ccc;size:1px;width:590px;" />
		      </form>
      <%}
 }
 else{%>
      		 <p>暂无消息</p>
 <%} %>
      		</div>   
      		<div>
      <%if(list1!=null){
      	  List<Integer> S1 = new ArrayList<Integer>();
	      for(MessageBean mes:list1) {
		      boolean flag1 = false;
		      int message_id = mes.getMessage_id();
		      int other_id = mes.getOther_id(ID,message_id);
		      System.out.println(other_id);
		      for(int flag:S1){
			      if(flag==other_id)
			      flag1 = true;
			  }
		      S1.add(other_id);
		      if(flag1)
		      break;
		      UserBean otheruser = new UserBean();
		      String img = otheruser.getUser_IMG(other_id);
		      String other_name = otheruser.getUser_name(other_id);
		      String content = mes.getContent();
		      if(content.length()>25)
		      	  content = mes.getContent().substring(0,20)+"...";%>
		      <form action="/QiaGuaWebsite/MessageServlet" method="get">
			      <img style="width:50px;height:50px;" src="<%=img%>"/>
			      <p class="user" style="margin-left: 80px;margin-top: -50px;"><%=other_name %></p>
			      <p class="detailss" style="margin-left: 80px;margin-top: 5px;"><%=content %></p>
			      <p class="date" style="margin-top: 5px;margin-left: 80px;"><%=mes.getSend_time() %></p>
			      <button calss="button3" type="submit" name="del" value="<%=other_id %>">删除</button>
			      <hr style="color:#ccc;size:1px;width:590px;" />
		      </form>
      <%}
      }
      else{%>
      		  <p style="color:black;">暂无消息</p>
      <%} %>
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
    <%}
     else{%>
     <form action="/QiaGuaWebsite/MessageServlet" method="get">
     <div class="box">
   	      	 <div class="box1">
   	      	   <a href="message.jsp" class="button1">返回私信列表</a>
   	      	   <div style="margin-top: -10px;">
   	      	      <center>
   	      	 	  <span>与</span>
   	      	 	  <span>陌生人</span>
   	      	 	  <span>的私信</span>
   	      	      </center>
   	      	    </div>
   	      	 </div>
             <div class="box0">            
          	   <div style="border: 1px  #000000; width: 90%; margin: 0 auto;"> 
                 <center><span style="background-color: #f3f3f3;">2019年8月8日</span></center>
          		 <div class="box2">
          		 	<img  style="border-radius: 25spx;border: none; width:50px;height:50px;margin-top: 5px;" src="C:\Users\Lenovo\Desktop\J2EE课设\HTML\动态1.jpg">
                    <div class="box3"><span style="background-color: #D3D3D3;border-radius:5px;">XXXXXXXXXXXXXXXXXXXXXXXXXX</span></div>
          		 </div>
          		 <div class="box2">
          		 	<img  style="border-radius: 25spx;border: none; width:50px;height:50px;margin-top: 5px;" src="C:\Users\Lenovo\Desktop\J2EE课设\HTML\动态2.jpg">
                    <div class="box3"><span style="background-color: #D3D3D3;border-radius:5px;"> 的点点滴滴错付付多付保定市女 </span></div>
          		 </div>
          		 <center><span style="background-color: #f3f3f3;">2019年8月9日</span></center>  
          	   </div>        
             </div>
             <div class="box1">
             		<td><input type="text" name="USER_NAME" placeholder="请输入"style="width: 400px;height:40px; margin-top: 5px;margin-left: 10px;border:1px solid #7ecef4;"></td>
             		<td><button class="button" name="send">发送</button><td>
   	      	 </div>
          </div>
          </form>
      <%} %>
    </body>
    <%} %>
    </html>
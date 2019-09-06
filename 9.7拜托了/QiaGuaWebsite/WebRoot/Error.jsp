<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>恰瓜--问题中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="CSS/Error.css">

  </head>
  
  <body>
  <%
  	if(request.getAttribute("Emessage")!=null){//信息不空
  		String Emessage = (String)request.getAttribute("Emessage");
	  	if(Emessage.equals("user_name")){ %>
		  	<center>用户名已存在！</center>
		 	<% response.setHeader("refresh", "3;url='login1.jsp'");
		 	return;
	  	} 
	  	else if(Emessage.equals("Sign-in")){//无ID--登录失败
	  		%>
	  		<center>
	  		<div class="ERROR-type">
	  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  		<h2 class="ERROR-title">用户登录失败，用户名或密码错误！</h2></br>
	  		<h3 class="ERROR-solution">您可以选择<a href="Sign-in.jsp">登录</a>或者<a href="login1.jsp">重新注册</a>！</h3>
	  		</div>
	  		</center>
	  		<%  
	  	}
	  	else if(Emessage.equals("User_ID_NULL")){//无ID--用户界面不能显示
	  		%>
	  		<center>
	  		<div class="ERROR-type">
	  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  		<h2 class="ERROR-title">用户ID获取失败，用户个人中心无法显示！</h2></br>
	  		<h3 class="ERROR-solution">您可以选择<a href="Sign-in.jsp">重新登录</a>或者<a href="login1.jsp">重新注册</a>！</h3>
	  		</div>
	  		</center>
	  		<%  
	  	}
	  	else if(Emessage.equals("User_USER_NAME_NULL")){//无ID--用户界面不能显示用户名
	  		%>
	  		<center>
	  		<div class="ERROR-type">
	  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  		<h2 class="ERROR-title">用户个人中心无法显示用户名！</h2></br>
	  		<h3 class="ERROR-solution">您可以选择<a href="Sign-in.jsp">重新登录</a>或者<a href="login1.jsp">重新注册</a>！</h3>
	  		</div>
	  		</center>
	  		<%  
	  	}
	  	else if(Emessage.equals("UserInfoServlet_ID_NUL")){//无ID--信息无法修改
	  		%>
	  		<center>
	  		<div class="ERROR-type">
	  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  		<h2 class="ERROR-title">用户ID获取失败！</h2></br>
	  		<h3 class="ERROR-solution">您可以选择<a href="Sign-in.jsp">重新登录</a>或者<a href="login1.jsp">重新注册</a>！</h3>
	  		</div>
	  		</center>
	  		<%  
	  	}
	  	else if(Emessage.equals("pwdModify_ID_NULL")){//无ID--密码无法修改
	  		%>
	  		<center>
	  		<div class="ERROR-type">
	  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  		<h2 class="ERROR-title">用户ID获取失败！</h2></br>
	  		<h3 class="ERROR-solution">您可以选择<a href="Sign-in.jsp">重新登录</a>或者<a href="login1.jsp">重新注册</a>！</h3>
	  		</div>
	  		</center>
	  		<%  
	  	}
	  	else if(Emessage.equals("Follow_ID_NULL")){//无ID--粉丝界面无法显示
	  		%>
	  		<center>
	  		<div class="ERROR-type">
	  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  		<h2 class="ERROR-title">用户ID获取失败！</h2></br>
	  		<h3 class="ERROR-solution">您可以选择<a href="Sign-in.jsp">重新登录</a>或者<a href="login1.jsp">重新注册</a>！</h3>
	  		</div>
	  		</center>
	  		<%  
	  	}
	  	else if(Emessage.equals("Follow2_ID_NULL")){//无ID--关注界面无法显示
	  		%>
	  		<center>
	  		<div class="ERROR-type">
	  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  		<h2 class="ERROR-title">用户ID获取失败！</h2></br>
	  		<h3 class="ERROR-solution">您可以选择<a href="Sign-in.jsp">重新登录</a>或者<a href="login1.jsp">重新注册</a>！</h3>
	  		</div>
	  		</center>
	  		<%  
	  	}
	  	else if(request.getSession().getAttribute("ID")!=null){//ID不空
		  	Integer ID = (Integer) request.getSession().getAttribute("ID");
		  	System.out.println("--ERROR需要处理的ID是:"+ID+"--");
		  	if(Emessage.equals("user_Mail")){
		  	%>
		  		<center>
		  		<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">此邮箱已被人注册过，请更换邮箱！</h2></br>
		  		</div>
		  		</center>
		  		<%  request.getSession().setAttribute("ID", ID);
		  			System.out.println("--ERROR处理完毕后返回完善界面的ID是:"+ID+"--");
		  			response.setHeader("refresh", "3;url='login2.jsp'");
		  			return;
		  	}
		  	else if(Emessage.equals("UserInfoServlet_modify_USER_NAME_retrive")){//修改用户名时重复
		  		%>
		  		<center>
		  		<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">此用户名已被人注册过，请更换用户名！</h2></br>
	  			</div>
		  		</center>
		  		<%  request.getSession().setAttribute("ID", ID);
		  			System.out.println("--ERROR处理完毕后用户信息修改界面的ID是:"+ID+"--");
		  			response.setHeader("refresh", "3;url='UserInfo.jsp'");
		  			return;
		  	}
		  	else if(Emessage.equals("UserInfoServlet_modify_USER_NAME_failed")){//修改用户名保存失败
		  		%>
		  		<center>
		  		<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">用户名修改失败！</h2></br>
	  			</div>
		  		</center>
		  		<%  request.getSession().setAttribute("ID", ID);
		  			System.out.println("--ERROR处理完毕后用户信息修改界面的ID是:"+ID+"--");
		  			response.setHeader("refresh", "3;url='UserInfo.jsp'");
		  			return;
		  	}
		  	else if(Emessage.equals("PwdServlet_failed")){//密码修改出现错误
		  		%>
		  		<center>
		  		<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">密码修改失败！</h2></br>
	  			</div>
		  		</center>
		  		<%  request.getSession().setAttribute("ID", ID);
		  			System.out.println("--ERROR处理完毕后用户密码修改界面的ID是:"+ID+"--");
		  			response.setHeader("refresh", "3;url='pwdModify.jsp'");
		  			return;
		  	}
		  	else if(Emessage.equals("user_Tell")){
		  		%>
		  		<center>
		  		<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">此手机号已被人注册过，请更换手机号！</h2></br>
	  			</div>
		  		</center>
		  		<%  request.getSession().setAttribute("ID", ID);
		  			System.out.println("--ERROR处理完毕后返回完善界面的ID是:"+ID+"--");
		  			response.setHeader("refresh", "3;url='login2.jsp'");
		  			return;
		  	}
		  	else if(Emessage.equals("login2")){
		  		%>
		  		<center>
		  		<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">保存失败！</h2></br>
	  			</div>
		  		</center>
		  		<%  request.getSession().setAttribute("ID", ID);
		  			System.out.println("--ERROR处理完毕后返回完善界面的ID是:"+ID+"--");
		  			response.setHeader("refresh", "3;url='login2.jsp'");
		  			return;
		  	}
	  	}
	  	else if(Emessage.equals("login2_ID_null")){//没有获得ID值--login2
	  		%>
	  		<center>
	  			<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">进行用户注册完善时，ID丢失！</h2></br>
	  			<h3 class="ERROR-solution">即将返回重新注册！</h3>
	  			</div>
	  		</center>
	  		<%  
	  		response.setHeader("refresh", "3;url='login1.jsp'");
	  		return;
	  	}
	  	else if(Emessage.equals("login3_NAME_ID_null")){//没有获得ID值--login3--name
	  		%>
	  		<center>
	  			<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">进行用户真实姓名填写时，ID丢失！</h2></br>
	  			<h3 class="ERROR-solution">即将返回重新注册！</h3>
	  			</div>
	  		</center>
	  		<%  
	  		response.setHeader("refresh", "3;url='login1.jsp'");
	  		return;
	  	}
	  	else if(Emessage.equals("login3_SENDER_ID_null")){//没有获得ID值--login3--sender
	  		%>
	  		<center>
	  			<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">进行用户真实性别填写时，ID丢失！</h2></br>
	  			<h3 class="ERROR-solution">即将返回重新注册！</h3>
	  			</div>
	  		</center>
	  		<%  
	  		response.setHeader("refresh", "3;url='login1.jsp'");
	  		return;
	  	}
	  	else if(Emessage.equals("login3_SID_ID_null")){//没有获得ID值--login3--sid
	  		%>
	  		<center>
		  		<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">进行用户身份证号填写时，ID丢失！</h2></br>
		  		<h3 class="ERROR-solution">即将返回重新注册！</h3>
		  		</div>
	  		</center>
	  		<%  
	  		response.setHeader("refresh", "3;url='login1.jsp'");
	  		return;
	  	}
	  	else if(Emessage.equals("login3_success_ID_null")){//没有获得ID值--login3--success
	  		%>
	  		<center>
		  		<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">用户注册成功，但是ID丢失！</h2></br>
		  		<h3 class="ERROR-solution">您可以选择<a href="Sign-in.jsp">登录</a>或者<a href="login1.jsp">重新注册</a>！</h3>
	  			</div>
	  		</center>
	  		<%  
	  	}
	  	else{//没有获得ID值--其他
	  		%>
	  		<center>
		  		<div class="ERROR-type">
		  		<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  			<h2 class="ERROR-title">用户ID丢失！</h2></br>
		  		<h3 class="ERROR-solution">即将返回重新注册！</h3>
		  		</div>
	  		</center>
	  		<%  
	  		response.setHeader("refresh", "3;url='login1.jsp'");
	  		return;
	  	}
  }
  else{//信息为空
  	%>
	  	<center>
		  	<div class="ERROR-type">
		  	<div class="ERROR-icon"><i class="fa fa-times-rectangle-o"></i></div>
	  		<h2 class="ERROR-title">无错误信息可获取！</h2></br>
		  	<h3 class="ERROR-solution">您可以<a href="login1.jsp">开始注册</a>！</h3>
		  	</div>
	  	</center>
  	<%
  		response.setHeader("refresh", "3;url='login1.jsp'");
	  	return;
  }
  %>
    
  </body>
</html>

<%@ page language="java" import="java.util.*,people.UserBean" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
   	    <meta charset="utf-8" />
   	    <title>恰瓜--修改密码</title>
   </head>
   <script language="javascript" type="text/javascript">  
	  	var code ; //在全局 定义验证码   
	     function createCode()   
	     {    
	       code = "";   
	       var codeLength = 6;//验证码的长度   
	       var checkCode = document.getElementById("checkCode");   
	       var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符，当然也可以用中文的      
	       for(var i=0;i<codeLength;i++)   
	       {   
	        var charIndex = Math.floor(Math.random()*35);   
	        code +=selectChar[charIndex];   
	       }    
	       if(checkCode)   
	       {   
	         checkCode.className="code";   
	         checkCode.value = code;
	         checkCode.blur();   
	       }        
	     }     
	     function validate ()   {   
	       var inputCode = document.getElementById("validCode").value;  
	       var rowPwd = document.getElementById("rowPWD").value;
	       var newPwd = document.getElementById("newPWD").value;
	       var inputConfirm = document.getElementById("confirmPWD").value; 
	       if(inputCode.length <=0)   
	       {   
	           alert("请输入验证码！");   
	           return false;
	       }   
	       else if(inputCode.toUpperCase() != code )   
	       {   
	          alert("验证码输入错误！");   
	          createCode();//刷新验证码   
	          return false;
	       } 
	       else if(rowPwd.length<=0)
	       {
	       	alert("请输入原来的密码！");
	       	return false;
	       }
	       else if(newPwd.length<=0)
	       {
	       	alert("请输入新的密码！");
	       	return false;
	       }
	       else if(inputConfirm.length<=0)
	       {
	       	alert("请再次验证密码！");
	       	return false;
	       }
	       else if(newPwd.toUpperCase() != inputConfirm.toUpperCase())
	       {
	       	alert("两次密码输入不同！");
	       	return false;
	       }
	       else
	       {   
	       return true;
	       }   
	     }   
	  </script>
   
   <style type="text/css">table{
        	text-align: center;
        }
        a{
        	text-decoration: none;
        }
        </style>

   <body onLoad="createCode()">
   <% 
		   if(request.getSession().getAttribute("ID")==null){
		   		System.out.println("--pwdModify页面没有绑定用户ID--");
		   		request.setAttribute("Emessage", "pwdModify_ID_NULL");
				request.getRequestDispatcher("Error.jsp").forward(request, response);
				return;
		   }
		   else{
		   		int ID = (Integer)request.getSession().getAttribute("ID");
		   		System.out.println("--pwdModify页面绑定的用户ID是:"+ID+"--");
		   		request.getSession().setAttribute("ID", ID);
		   		UserBean user = new UserBean();
		 %>
          <a target="_blank" href=" " style="color:838383">账户信息</a>
          >
          <a target="_blank" href="UserInfo.jsp" style="color:838383">基本信息</a>
          >
          <a target="_blank" href=" " style="color:838383">修改密码</a>
          <div style="background:#d3d3d3">
            <a href="UserInfo.jsp"><button style="border-radius:10px">基本信息</button></a>
            <button style="border-radius:10px;background:#7ecef4;color:#ffffff">修改密码</button>
          </div>
          <br/>
          <br/>
          <br/>
   	      <center>
   	       <form action="PwdServlet" method="post" onsubmit="return validate()">
            <table>
             <tr><td><label>密码</label></td>
                 <td><input type="password" name="rowPWD" id="rowPWD" placeholder="请输入密码"></td></tr>
             <tr><td><label>新密码</label></td>
                 <td><input type="password" name="newPWD" id="newPWD" placeholder="请输入新密码"></td></tr>
             <tr><td><label>确认密码</label></td>
                 <td><input type="password" name="confirmPWD" id="confirmPWD" placeholder="请再次输入新密码"></td></tr>
             <tr><td><label> 验证码</label></td>
                 <td><input type="text" id="validCode"  name="confirmCode" placeholder="请输入验证码"/></td>
                 <td><input class="confirm-code" type="text" onClick="createCode()" readonly="readonly" id="checkCode" 
                 style="width: 85px;cursor:pointer;color: #7ecef4;"/></td>
             </tr>
             <tr>
             	<td colspan="3"> <button type="submit" style="background:#7ecef4;color:#ffffff;border-radius:10px;height:40px;width:100px">确认提交</button></td>
             </tr>
            </table>
   	       </form>
   	      
          </center>
          <%} %>
   </body>
</html>

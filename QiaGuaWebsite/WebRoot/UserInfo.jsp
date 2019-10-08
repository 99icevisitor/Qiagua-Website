<%@ page language="java" import="java.util.*,people.UserBean" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
   	    <meta charset="utf-8" />
   	    <title>基本信息</title>
   </head>
   <style type="text/css">
   		table{
        	text-align: center;
        }
        a{
        	text-decoration: none;
        }
        .btn{
	        background: #7ecef4;
	        color: #ffffff;
	        border-radius: 10px;
	        height: 40px;
	        width: 100px;
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
         
   <body>
   
   <% 
		   if(request.getSession().getAttribute("ID")==null){
		   		System.out.println("--UserInfo页面没有绑定用户ID--");
		   		request.setAttribute("Emessage", "UserInfo_ID_NULL");
				request.getRequestDispatcher("Error.jsp").forward(request, response);
				return;
		   }
		   else{
		   		int ID = (Integer)request.getSession().getAttribute("ID");
		   		System.out.println("--UserInfo页面绑定的用户ID是:"+ID+"--");
		   		request.getSession().setAttribute("ID", ID);
		   		UserBean user = new UserBean();
		 %>
	<div class="back-to-manager">
		<a href="User.jsp" class="back-button">返回个人中心</a>
	</div>
          <a target="_blank" href=" " style="color:838383">账户信息</a>
          >
          <a target="_blank" href="pwdModify.jsp" style="color:838383">修改密码</a>
          >
          <a target="_blank" href="" style="color:838383">基本信息</a>
          <div style="background:#d3d3d3">
             <button style="border-radius:10px;background:#7ecef4;color:#ffffff">基本信息</button>
             <a href="pwdModify.jsp"><button style="border-radius:10px"  >修改密码</button></a>
          </div>
          <br/>
          <br/>
          <br/>
         
   	    <center>
   	     <form action="UserInfoServlet" method="post">
            <table>
             <tr><td><label>用户名</label></td>
                 <td><input type="text" name="USER_NAME" placeholder="<%=user.getUser_name(ID)%>"></td></tr>
             <tr><td><label>性别</label></td>
                 <td>
			                 女<input type="radio" name="SENDER" value="f"/>
			                 男<input type="radio" name="SENDER" value="m"/>
                 </td></tr>
             <tr><td><label>城市</label></td>
                 <td><input type="text" name="CITY" placeholder="<%=user.getCITY(ID)%>"></td></tr>
             <tr><td><label>个人简介</label></td>
                 <td><input type="textarea" name="PROFILE" placeholder="<%=user.getPROFILE(ID)%>"></td></tr>
             <tr><td colspan="2"><center><button class="btn" type="submit">确认提交</button></center></td></tr>
            </table>
   	     </form>
        </center>
   </body>
    <% } 
		 %>
</html>


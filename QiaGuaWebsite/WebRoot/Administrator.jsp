<%@ page language="java" import="java.util.*,people.AllUserBean" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>恰瓜--用户审核管理</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="CSS/Adminster.css">
    <style type="text/css">
        .r_style1{
            color: #c0c0c0;
        }
        .r_style2{
            color: gray;
        }
        .r_style3{
            color: black;
        }
        .smrz_style1{
            color: red;
        }
        .smrz_style2{
            color: blue;
        }
        .smrz_style3{
            color: green;
        }
 		.back-to-manager{
			width: 300px;
			height: 50px;
			background-color: transparent;
			font-family: "FangSong";
			font-size: 36px;
			color: #7ecef4;
			font-weight: bold;
			padding-top: 10px;
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
	 	 <script type="text/javascript">
	 	 	function is_submit(){
	 	 		if(is_checked()){
	 	 			return true;
	 	 		}
	 	 		else{
	 	 			alert("请选择至少一项进行操作！");
	 	 			return false;
	 	 		}
	 	 	}
	 	 	function is_checked(){
	 	 		var flag = false;
	 	 		var ids = document.getElementsByName('USER_ID');
	 	 		for(i=0;i<ids.length;i++){
	 	 			if(ids[i].checked){
	 	 				flag=true;
	 	 				break;
	 	 			}
	 	 		}
	 	 		return flag;
	 	 	}
	 	 </script>
  <center>
   <!-- show all the USERs' information-->
      <H1>恰瓜后台用户管理</H1>
      <div class="back-to-manager">
		<a href="Sign-in.jsp" class="back-button">退出</a>
	</div>
    <form action="AdministratorServlet" method="post" onsubmit="return is_submit()">
      <table class="main-table" cellspacing="0">
        <tr>
            <td><center>选择</center></td>
            <td><center>用户名</center></td>
            <td><center>用户注册状态</center></td>
            <td><center>用户实名状态</center></td>
            <td><center>用户身份ID</center></td>
            <td><center>用户身份姓名</center></td>
            <td><center>用户性别</center></td>
        </tr>
 <% 
	Object obj = request.getAttribute("userList");
	List<AllUserBean> UserList = null;
	if(obj==null){
		System.out.println("--查询用户表为空--");
		request.setAttribute("Emessage", "Administrator_list_NULL");
		request.getRequestDispatcher("Error.jsp").forward(request, response);
		return;
	}
		UserList = (List<AllUserBean>) obj;
	if(UserList !=null){
		int i=0;
		for(AllUserBean user:UserList){
		%>
        <tr>
            <td><center><input type="checkbox" name="USER_ID" value="<%=user.getID()%>"/></center></td>
            <td><center><%=user.getUSER_NAME() %></center></td>
            <td><center>
            <% if(user.isUser(user.getID())==1){ %>
            	<span class="r_style2"> <!-- 未实名 -->
            <% }
               else if(user.isUser(user.getID())==2){%>
            	<span class="r_style3"> <!-- 已实名 -->
            <%}
            	else {%>
            	<span class="r_style1"> <!-- 初步注册 -->
            <%}%>
            <%=user.getSTATE() %></span></center></td>
            <td><center>
            <% if(user.isSMRZ(user.getID())==2){ %>
            	<span class="smrz_style3">已实名
            <% }
               else if(user.isSMRZ(user.getID())==1){%>
            	<span class="smrz_style2">等待实名
            <%}
               else{%>
            	<span class="smrz_style1">无资格认证
            <%}%>
			</span></center></td>
            <td style="width:200px;"><center>
            <%if(user.fillSID(user.getID())) {%>
            <%=user.getSID() %>
            <%}
            else{%>
            	/
            	<%}
             %>
            </center></td>
            <td><center>
            <% if(user.fillNAME(user.getID())){ %>
            	<%=user.getNAME() %>
            <% } 
               else{%>
            	未填写
            <%}%>
            </center></td>
            <td><center>
            <% if(user.fillSENDER(user.getID())==1){ %>
            	女
            <% } 
               else if(user.fillSENDER(user.getID())==2){%>
            	男
            <%}
            	else{%>
            	/
            	<%} %>
            </center></td>
        </tr>
		<%} %>
        <tr>
            <td colspan="4"><center><button type="submit" name="confirm" value="通过">通过认证</button></center></td>
            <td colspan="4"><center><button type="submit" name="delete" value="删除">删除用户</button></center></td>
        </tr>

      </table>
    </form>
    </center>

    <%}
    %>
  </body>
</html>

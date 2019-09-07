package people;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import people.UserInfoBean;
import people.RegisterBean;
import people.UserBean;
public class UserInfoServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public UserInfoServlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>恰瓜</TITLE></HEAD>");
		out.println("  <BODY>");
		if(request.getSession().getAttribute("ID")!=null){
	   		int ID = (Integer)request.getSession().getAttribute("ID");
	   		System.out.println("--UserInfoServlet-GET:绑定的用户ID是:"+ID+"--");
			try {
				UserInfoBean info = new UserInfoBean();
				if(info.existInfo(ID)){
				}
				else{
					info.addInfo(ID);
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	   		request.getSession().setAttribute("ID", ID);
	   		response.setHeader("refresh", "0.1;UserInfo.jsp");
	   		return;
	   }
	   else{
	   		System.out.println("--UserInfoServlet-GET:没有绑定用户ID--");
	   		request.setAttribute("Emessage", "UserInfoServlet_ID_NULL");
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			return;
	   }
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	
	public void init() throws ServletException {
		// Put your code here
	}
	 public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
	      
		  response.setContentType("text/html;charset=UTF-8");
	      request.setCharacterEncoding("UTF-8");
	      PrintWriter out = response.getWriter();
	      System.out.print("--UserInfoServlet-POST:");
	      if(request.getSession().getAttribute("ID")!=null){
		   	    int ID = (Integer)request.getSession().getAttribute("ID");
		   		System.out.println("绑定的用户ID是:"+ID+"--");
			    String USER_NAME=null;
			    String SENDER=null;
			    String CITY=null;
			    String PROFILE=null;
			    boolean flag_LOGIN_Uname=false;
			    boolean flag_USER_Uname=false;
			    boolean flag_USER_SENDER=false;
			    boolean flag_USERINF_CITY=false;
			    boolean flag_USERINF_PORFILE=false;
			    try{
			        UserInfoBean user= new UserInfoBean();
			        UserBean uBean = new UserBean();
			        RegisterBean rgBean = new RegisterBean();
			        Date date=new Date();
				    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				    String today = sdf.format(date);
			        USER_NAME=request.getParameter("USER_NAME");
			        SENDER=request.getParameter("SENDER");
			        CITY=request.getParameter("CITY");
			        PROFILE=request.getParameter("PROFILE");
			        /*------------------------------------USER_NAME--------------------------------*/
			        if(USER_NAME==null || USER_NAME.equals("")){
					        System.out.println("--USER_NAME不用修改--");
					       	flag_USER_Uname = true;
					       	flag_LOGIN_Uname = true;
				    }
					else if(rgBean.isName(USER_NAME)){/*不重名时，修改*/
					        flag_LOGIN_Uname =rgBean.modifyLogin(ID,1, USER_NAME);//LOGIN(USER_NAME,USER_ID,PWD,LAST_TIME,STATE)
						    flag_USER_Uname = uBean.modifyUser(ID, 2, USER_NAME);
			        }
			        else{/*重名，提示不可修改*/
			        	request.getSession().setAttribute("ID",ID);
			        	request.setAttribute("Emessage", "UserInfoServlet_modify_USER_NAME_retrive");
						request.getRequestDispatcher("Error.jsp").forward(request, response);
			        }
			        /*--------------------------------------SENDER---------------------------------*/
			        if(SENDER==null || SENDER.equals("")){ 
			        	System.out.println("--SENDER不用修改--");
			        	flag_USER_SENDER = true;
			        }
			        else{
			        	flag_USER_SENDER = uBean.modifyUser(ID, 9,SENDER);
			        }
			        /*---------------------------------------CITY----------------------------------*/
			        if(CITY==null || CITY.equals("")){
			        	System.out.println("--CITY不用修改--");
			        	flag_USERINF_CITY = true;
			        }
			        else{
			        	flag_USERINF_CITY = user.modifyUser_Inf(ID, 2, CITY); 
			        }
			        /*--------------------------------------PROFILE--------------------------------*/
			        if(PROFILE==null ||PROFILE.equals("")){
			        	System.out.println("--PROFILE不用修改--");
			        	flag_USERINF_PORFILE = true;
			        }
			        else{
			        	flag_USERINF_PORFILE = user.modifyUser_Inf(ID, 3, PROFILE); 
			        }
			        /*-----------------------------------return results-----------------------------*/
				    if(flag_LOGIN_Uname&&flag_USER_Uname){
				    	if(flag_USER_SENDER)
				    		if(flag_USERINF_CITY)
				    	        if(flag_USERINF_PORFILE){
				                   out.print("<script>alert('修改成功!');</script>");
				                   response.setHeader("refresh", "1;URL=User.jsp");
				                   return;
				                 }
				              else{
				            	  	request.getSession().setAttribute("ID",ID);
						        	request.setAttribute("Emessage", "UserInfoServlet_modify_PROFILE_retrive");
						        	out.print("<script>alert('用户简介修改失败!');</script>");
						        	response.setHeader("refresh", "1;URL=Error.jsp");
				               }
				    		else{
				    			request.getSession().setAttribute("ID",ID);
					        	request.setAttribute("Emessage", "UserInfoServlet_modify_CITY_retrive");
						        out.print("<script>alert('用户城市修改失败!');</script>");
						        response.setHeader("refresh", "1;URL=Error.jsp");
						     }
				    	else{
				    		request.getSession().setAttribute("ID",ID);
				        	request.setAttribute("Emessage", "UserInfoServlet_modify_SENDER_retrive");
					        out.print("<script>alert('用户性别修改失败!');</script>");
					        response.setHeader("refresh", "1;URL=Error.jsp");
					     }
				     }
				     else{
				    	 request.getSession().setAttribute("ID",ID);
				    	 request.setAttribute("Emessage", "UserInfoServlet_modify_USER_NAME_failed");
				    	 request.getRequestDispatcher("Error.jsp").forward(request, response);
				     }
			    }
			    catch(Exception e){
			    	System.out.println(e.toString());
			    }
	      }
	      else{
	    	  System.out.println("没有绑定用户ID--");
	    	  request.setAttribute("Emessage", "UserInfoServlet_ID_NULL");
	  		  request.getRequestDispatcher("Error.jsp").forward(request, response);
	  		  return;
	      }
	 }

}

package people;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import people.PwdBean;

public class PwdServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public PwdServlet() {
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
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
	 public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		  
	    response.setContentType("text/html;charset=utf-8");
	    request.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    String pw = request.getParameter("rowPWD");
	    String newpw = request.getParameter("newPWD");
	    String id=null;
	    if(request.getSession().getAttribute("ID")!=null){
	    	int ID = (Integer)request.getSession().getAttribute("ID");
	    	try{
	  	      	PwdBean pwBean=new PwdBean();
	  	      	
	  	      	if(pwBean.reviseUser(pw, newpw, ID)==1){
	  	      		request.getSession().setAttribute("ID", ID);
	  	      		out.print("<script>alert('修改成功!');</script>");
	  	      		response.sendRedirect("User.jsp");
	  	      		return;
	  	      	}
	  	      	else if(pwBean.reviseUser(pw, newpw, ID)==2){
		  	      	request.getSession().setAttribute("ID", ID);
	  	      		out.print("<script>alert('请勿输入原密码!');</script>");
	  	      		response.setHeader("refresh", "1;URL=pwdModify.jsp");
	  	      		return;
	  	      	}
	  	      	else if(pwBean.reviseUser(pw, newpw, ID)==3){
		  	      	request.getSession().setAttribute("ID", ID);
	  	      		out.print("<script>alert('原密码错误!');");
	  	      		response.setHeader("refresh", "1;URL=pwdModify.jsp");
	  	      		return;
		  	    }
	  	      	else{
	  	      	request.getSession().setAttribute("ID", ID);
	        	request.setAttribute("Emessage", "PwdServlet_failed");
		        out.print("<script>alert('用户密码修改失败!');</script>");
		        request.getRequestDispatcher("Error.jsp").forward(request, response);
	  	      	}
	    	}
	  	    catch (ClassNotFoundException e) {
	  	      // TODO Auto-generated catch block
	  	      e.printStackTrace();
	  	    }
	  	    catch(SQLException e){
	  	      e.printStackTrace();
	  	    }
	    }
	 }
	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}

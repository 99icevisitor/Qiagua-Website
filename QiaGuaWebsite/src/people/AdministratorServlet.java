package people;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import people.AllUserBean;

public class AdministratorServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public AdministratorServlet() {
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
		out.println("  <HEAD><TITLE>恰瓜</TITLE></HEAD>");
		out.println("  <BODY>");
		if(request.getParameter("manager")!=null && request.getParameter("manager").equals("2")){//作为普通用户浏览
			request.getSession().setAttribute("ID", 1);
			request.getRequestDispatcher("main.jsp").forward(request, response);
			return;
			
		}
		else{//操作为管理
			List<AllUserBean> userList = new ArrayList<>();
			userList = new AllUserBean().getList();
			System.out.println("--数据已经准备好--");
				if(userList != null) {
					request.setAttribute("userList", userList);
					request.getRequestDispatcher("Administrator.jsp").forward(request, response);
					return;
				}
				else {
					System.out.println("--AdministratorServlet GET userList:null--");
					request.setAttribute("Emessage", "AdministratorServlet_list_NULL");
					request.getRequestDispatcher("Error.jsp").forward(request, response);
					return;
				}
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
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>恰瓜</TITLE></HEAD>");
		out.println("  <BODY>");
		if(request.getParameterValues("USER_ID")==null){/*无内容提交*/
			System.out.println("--未选中要通过认证的项目--");
			response.sendRedirect("AdministratorServlet");
			return;
		}
		else{/*修改内容 LOGIN.STATE & USER.SMRZ*/
			String[] values = request.getParameterValues("USER_ID");
			if(request.getParameter("confirm")!=null){
				/*-----------------------认证-------------------------*/
				for(int i=0;i<values.length;i++){
					AllUserBean user = new AllUserBean();
					int ID = Integer.parseInt(values[i]);
					user.updateUser(ID);
				}
				System.out.println("--认证完毕--");
				request.getSession().setAttribute("success", "confirm");
				response.sendRedirect("AdministratorServlet");
				return;
				}
				else if(request.getParameter("delete")!=null){
					/*-----------------------删除-------------------------*/
					for(int i=0;i<values.length;i++){
						AllUserBean user = new AllUserBean();
						int ID = Integer.parseInt(values[i]);
						user.deleteUser(ID);
					}
					System.out.println("--删除完毕--");
					request.setAttribute("success", "delete");
					request.getRequestDispatcher("Error.jsp").forward(request, response);
					return;
				}
				else{
					/*------------------------无操作---------------------------*/
					System.out.println("--有内容，但操作无效--");
					request.setAttribute("Emessage", "AdministratorServlet_unchecked");
					request.getRequestDispatcher("Error.jsp").forward(request, response);
					return;
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

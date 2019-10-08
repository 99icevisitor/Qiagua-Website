package people;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MessageServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public MessageServlet() {
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

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(request.getSession().getAttribute("ID")!=null){
		int user_id = (Integer)request.getSession().getAttribute("ID");
		request.getSession().setAttribute("ID", user_id);
		MessageBean mg;
		try {
			mg = new MessageBean();
			if(request.getParameter("del")!=null){
				System.out.println("删除消息");
				String other_id = request.getParameter("del");
				boolean delFlag = false;
				delFlag = mg.delMessage(user_id, other_id);
				if(delFlag){
					
				}
				else
				System.out.println("消息删除失败");
				response.sendRedirect("Reminder/message.jsp");
				return;
			}
			else if(request.getParameter("send")!=null){
				System.out.println("发送消息");
				String other_id = request.getParameter("send");
				String content = request.getParameter("content");
				boolean sendFlag = mg.setMessage(user_id, other_id, content);
				if(sendFlag){
					response.sendRedirect("Reminder/message.jsp");
					return;
				}					
				else{
					System.out.println("发送信息失败！");
					response.sendRedirect("Reminder/message.jsp");
					return;
				}
			}
			else if(request.getParameter("look")!=null){
				System.out.println("查看消息");
				String other_id = request.getParameter("look");
				request.getSession().setAttribute("other_id", other_id);
				System.out.println("other_id");
				response.sendRedirect("Reminder/message.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else{
			System.out.println("--MessageServlet-GET:没有绑定用户ID--");
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
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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

package people;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FollowServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public FollowServlet() {
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
		int user_id = (Integer)request.getSession().getAttribute("ID");
		String jsp = (String)request.getSession().getAttribute("jsp");
		request.getSession().setAttribute("ID", user_id);
		String idol_id = request.getParameter("qia");		
		FollowBean fan;
		boolean flagFan = false;
		try {
			fan = new FollowBean();
			if(fan.isFan(user_id, idol_id))
				flagFan = fan.setFan(user_id, idol_id);
			else
				flagFan = fan.setNOTFan(user_id, idol_id);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flagFan)
			if(jsp.equals("follow"))
			request.getRequestDispatcher("Follow.jsp").forward(request, response);
			else {
				if(jsp.equals("follow2"))
					request.getRequestDispatcher("Follow2.jsp").forward(request, response);
			}			
		else
			System.out.println("出错");
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
		int user_id = (Integer)request.getSession().getAttribute("ID");
		request.getSession().setAttribute("ID", user_id);
		String idol_id = request.getParameter("idol");
		FollowBean fan;
		boolean flagFan = false;
		try {
			fan = new FollowBean();
			if(fan.isFan(user_id, idol_id))
				flagFan = fan.setFan(user_id, idol_id);
			else
				flagFan = fan.setNOTFan(user_id, idol_id);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flagFan)
			if(request.getAttribute("jsp").equals("follow"))
			request.getRequestDispatcher("Follow.jsp").forward(request, response);
			else {
				if(request.getAttribute("jsp").equals("follow2"))
					request.getRequestDispatcher("Follow2.jsp").forward(request, response);
			}			
		else
			System.out.println("出错");
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

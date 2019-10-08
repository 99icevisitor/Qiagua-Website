package people;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import people.*;
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
//处理关注
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(request.getSession().getAttribute("ID")!=null){
			if(request.getParameter("idol_id")!=null&& request.getParameter("source_id")!=null){
				int ID = (Integer)request.getSession().getAttribute("ID");
				int idol_id = Integer.valueOf(request.getParameter("idol_id"));
				int source_id = Integer.valueOf(request.getParameter("source_id"));
				FollowBean relation = new FollowBean();
				if(relation.isFan(ID,idol_id)){
					relation.setNOTFan(ID, idol_id);
				}
				else if(!relation.isFan(ID, idol_id)){
					relation.setFan(ID, idol_id);
				}
				request.getSession().setAttribute("ID",ID);
				request.getRequestDispatcher("Search/blog.jsp&source_id="+source_id+"").forward(request, response);
			}
			else{
				int user_id = (Integer)request.getSession().getAttribute("ID");
				String jsp = (String)request.getSession().getAttribute("jsp");
				request.getSession().setAttribute("ID", user_id);
				int idol_id = Integer.valueOf(request.getParameter("follow"));		
				FollowBean fan= new FollowBean();
				boolean flagFan = false;
				try {
					if(fan.isFan(user_id, idol_id))
						flagFan = fan.setFan(user_id, idol_id);
					else
						flagFan = fan.setNOTFan(user_id, idol_id);
					fan.close();
					
				} catch ( SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(flagFan)
					if(jsp.equals("follow1"))
						response.sendRedirect("Follow.jsp");
					else {
						if(jsp.equals("follow2"))
							response.sendRedirect("Follow2.jsp");
					}			
				else
					System.out.println("出错");
			}
		}
		else{
			System.out.println("--FollowServlet-GET:没有绑定用户ID--");
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

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		int user_id = (Integer)request.getSession().getAttribute("ID");
		request.getSession().setAttribute("ID", user_id);
		int idol_id = Integer.valueOf(request.getParameter("idol"));
		FollowBean fan = new FollowBean();
		boolean flagFan = false;
		if(fan.isFan(user_id, idol_id))
			flagFan = fan.setFan(user_id, idol_id);
		else
			flagFan = fan.setNOTFan(user_id, idol_id);
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

package source;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ThumbServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public ThumbServlet() {
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
		response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        if(request.getSession().getAttribute("ID")==null){
        	request.setAttribute("Emessage", "ThumbServlet_ID_NULL");
        	request.getRequestDispatcher("Error.jsp").forward(request, response);
        	return;
        }
        else{
        	int ID = (int)request.getSession().getAttribute("ID");
        	request.getSession().setAttribute("ID", ID);
        	if(request.getParameter("source_id")==null){
        		request.setAttribute("Emessage", "ThumbServlet_Source_id_NULL");
            	request.getRequestDispatcher("Error.jsp").forward(request, response);
            	return;
        	}
        	else{
        		int source_id = Integer.valueOf(request.getParameter("source_id"));
        		try{
        			boolean thumbFlag = false;
        			ThumbBean thumb = new ThumbBean();
        			thumbFlag = thumb.setThumb(source_id, ID);
        			if(thumbFlag){
        				System.out.println("点赞或取消成功");
        			}
        			else{
        				System.out.println("失败");
        			}
        		}catch (ClassNotFoundException | SQLException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
        		response.sendRedirect("Search/blog.jsp?source_id="+source_id+"");
        		//response.setHeader("refresh", "Search/blog.jsp?source_id="+source_id+"");
        		//request.getRequestDispatcher("Search/blog.jsp?source_id="+source_id+"").forward(request, response);
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
		response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if(request.getSession().getAttribute("ID")!=null){
		int ID = (Integer)request.getSession().getAttribute("ID");
		request.getSession().setAttribute("ID", ID);
		int source_id = Integer.valueOf(request.getParameter("source_id"));
		try{
			boolean thumbFlag = false;
			ThumbBean thumb = new ThumbBean();
			thumbFlag = thumb.setThumb(source_id, ID);
			if(thumbFlag){
				System.out.println("点赞或取消成功");
			}
			else
				System.out.println("失败");
			
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("Follow.jsp").forward(request, response);
		}
		else{
			System.out.println("--ThumbServlet-GET:没有绑定用户ID--");
	   		request.setAttribute("Emessage", "UserInfoServlet_ID_NULL");
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			return;
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

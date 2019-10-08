package source;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.UploadBean;
import com.UploadSer;
import source.*;
public class PicServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public PicServlet() {
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
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		if(request.getSession().getAttribute("ID")==null){
			request.setAttribute("Emessage", "Pic_ID_NULL");
			request.getRequestDispatcher("Erroe.jsp").forward(request, response);
			return;
		}
		else{
			int ID = (int)request.getSession().getAttribute("ID");
			request.getSession().setAttribute("ID", ID);
			 	if(request.getParameter("source_id")!=null&&request.getParameter("state")!=null){
			 		int pic_id = Integer.valueOf(request.getParameter("source_id"));
			 		int state = Integer.valueOf(request.getParameter("state"));
			 		if(state ==1){//可以进行删除
			 				PicBean pic = new PicBean();
			 				pic.deletePic(pic_id);
			 				request.getRequestDispatcher("User.jsp").forward(request, response);
			 				return;
			 		}
			 		else{
			 			request.setAttribute("Emessage", "Pic_source_id_NULL");
						request.getRequestDispatcher("Erroe.jsp").forward(request, response);
						return;
			 		}
			 	}
			 	else{
			 		
			 	}
		}
		
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
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		if(request.getSession().getAttribute("ID")!=null){
			int ID = (int) request.getSession().getAttribute("ID");
			if(request.getParameter("alb_id")!=null){
				int alb_id = Integer.valueOf(request.getParameter("alb_id"));
				request.getSession().setAttribute("ID", ID);
				request.setAttribute("alb_id", alb_id);
				System.out.println("--准备保存"+alb_id+"--");
				request.getRequestDispatcher("Picload.jsp").forward(request, response);
				return;
			}
			
			else{
				System.out.println("--无ALB_ID--");
				request.getSession().setAttribute("ID", ID);
				request.getRequestDispatcher("main.jsp").forward(request, response);
				return;
			}
		}
		else if(request.getParameter("alb_id")!=null){
			int alb_id = Integer.valueOf(request.getParameter("alb_id"));
			System.out.println("--有ALB_ID"+alb_id+",ID失踪--");
			request.getRequestDispatcher("main.jsp").forward(request, response);
			return;
			}
		
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

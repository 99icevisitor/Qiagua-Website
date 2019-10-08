package source;

import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import source.*;
import people.*;
public class SearchServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public SearchServlet() {
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
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		if(request.getSession().getAttribute("ID")==null ){
			request.setAttribute("Emessage", "ID_NULL");
			System.out.println("ID为空");
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			return;
		}
		else{
			int ID=(int) request.getSession().getAttribute("ID");
			String key=null;
			if(request.getParameter("key")==null && request.getParameter("kw")==null){
				request.setAttribute("Emessage", "keyword_NULL");
				System.out.println("值为空");
				request.getRequestDispatcher("Error.jsp").forward(request, response);
				return;
			}
			if(request.getParameter("key")!=null){
				key = request.getParameter("key");
				System.out.println("值不为空key"+key);
			}
			else {
				key = (String)request.getParameter("kw");
				System.out.println("值不为空kw"+key);
			}
			SearchBean ser = new SearchBean();
			List<PicBean> list = ser.searchPic(key);
			List<AlbBean> list2 = ser.searchAlb(key);
			List<UserBean> list3 = ser.searchUser(key);
			List<ArtBean> list4 = ser.searchArt(key);
			System.out.println("图片"+list);
			System.out.println("专辑"+list2);
			System.out.println("达人"+list3);
			System.out.println("文章"+list4);
			request.getSession().setAttribute("ID", ID);
			request.getSession().setAttribute("Piclist", list);
			request.getSession().setAttribute("Alblist", list2);
			request.getSession().setAttribute("Userlist", list3);
			request.getSession().setAttribute("Artlist", list4);
			request.getSession().setAttribute("key", key);
			System.out.println("转发。。。");
			request.getRequestDispatcher("Search/search1.jsp").forward(request, response);
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
		response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		if(request.getSession().getAttribute("ID")==null ){
			request.setAttribute("Emessage", "ID_NULL");
			System.out.println("ID为空");
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			return;
		}
		else{
			int ID=(int) request.getSession().getAttribute("ID");
			String key=null;
			if(request.getParameter("keyWord")==null || request.getAttribute("kw")==null){
				request.setAttribute("Emessage", "keyword_NULL");
				System.out.println("值为空");
				request.getRequestDispatcher("Error.jsp").forward(request, response);
				return;
			}
			else if(request.getParameter("keyWord")!=null){
				key = request.getParameter("keyWord");
				System.out.println("值不为空keyword"+key);
			}
			else {
				key = (String)request.getAttribute("kw");
				System.out.println("值不为空kw"+key);
			}
			SearchBean ser = new SearchBean();
			List<PicBean> list = ser.searchPic(key);
			request.getSession().setAttribute("ID", ID);
			request.setAttribute("Piclist", list);
			request.getRequestDispatcher("Search/search1.jsp?key="+key+"").forward(request, response);
			System.out.println("转发。。。");
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

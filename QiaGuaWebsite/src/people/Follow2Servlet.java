package people;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import source.*;
import net.sf.json.JSONObject;
import java.text.SimpleDateFormat;
import java.util.*;
public class Follow2Servlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public Follow2Servlet() {
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
		out.println("  <HEAD><TITLE>恰瓜--关注管理</TITLE></HEAD>");
		out.println("  <BODY>");
		if(request.getSession().getAttribute("ID")==null){
			request.setAttribute("Emessage", "ID_NULL");
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			return;
		}
		else{
			int ID = (int)request.getSession().getAttribute("ID");
			System.out.println("关注管理ID"+ID);
			request.getSession().setAttribute("ID", ID);
			if(request.getParameter("fan")!=null &&request.getParameter("idol")!=null){
				int fan = Integer.valueOf(request.getParameter("fan"));
				int idol = Integer.valueOf(request.getParameter("idol"));
				System.out.println("关注管理fan"+fan+",idol"+idol);
				FollowBean relation = new FollowBean();
				if(relation.isFan(fan, idol)){//是粉丝
					if(relation.setFan(fan, idol)){
						request.getRequestDispatcher("Follow2.jsp").forward(request, response);
						return;
					}
					else{
						request.setAttribute("Emessage", "Unfan_Error");
						request.getRequestDispatcher("Error.jsp").forward(request, response);
						return;
					}
				}
				else{
					if(relation.setNOTFan(fan, idol)){
						response.sendRedirect("Follow2.jsp");
						return;
					}
					else{
						request.setAttribute("Emessage", "Fan_Error");
						request.getRequestDispatcher("Error.jsp").forward(request, response);
						return;
					}
				}
			}
			else{
				request.setAttribute("Emessage", "fan_id_NULL");
				System.out.println("关注管理fan or idol 为空");
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

		response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
		PrintWriter out = response.getWriter();
		JSONObject ob =new  JSONObject();//创建json对象
		ob.put("message","关注管理");
		ob.put("datails","处理中。。。");
		ob.put("fan_state",0);
		ob.put("fan_id",0);
		ob.put("idol_id",0);
		if(request.getParameter("fan_id")!=null &&request.getParameter("idol_id")!=null){
			int fan = Integer.valueOf(request.getParameter("fan_id"));
			int idol = Integer.valueOf(request.getParameter("idol_id"));
			FollowBean relation = new FollowBean();
			if(relation.isFan(fan, idol)){
				if(relation.setNOTFan(fan, idol)){
					ob.put("message","关注管理");
					ob.put("datails","取消关注成功！");
					ob.put("fan_state",0);
					ob.put("fan_id",fan);
					ob.put("idol_id",idol);
				}
				else{
					ob.put("message","关注管理");
					ob.put("datails","取消关注失败！");
					ob.put("fan_state",1);
					ob.put("fan_id",fan);
					ob.put("idol_id",idol);
				}
			}
			else{
				if(relation.setFan(fan, idol)){
					ob.put("message","关注管理");
					ob.put("datails","关注成功！");
					ob.put("fan_state",1);
					ob.put("fan_id",fan);
					ob.put("idol_id",idol);
				}
				else{
					ob.put("message","关注管理");
					ob.put("datails","关注失败！");
					ob.put("fan_state",0);
					ob.put("fan_id",fan);
					ob.put("idol_id",idol);
				}
			}	
		}
		else{
			ob.put("message","关注管理");
			ob.put("datails","处理失败");
			ob.put("fan_state",0);
			ob.put("fan_id",0);
			ob.put("idol_id",0);
		}
		out.print(ob);
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

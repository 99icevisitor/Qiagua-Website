package source;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import source.*;
import people.*;
public class CommentSaveServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public CommentSaveServlet() {
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
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
        System.out.println("保存评论页面");
		PrintWriter out = response.getWriter();
		JSONObject ob =new  JSONObject();//创建json对象
		ob.put("state","saving");
		ob.put("details","保存中……");
		ob.put("new-floor",0);
		ob.put("new-poster",0);
		ob.put("new-img", null);
		ob.put("new-com", null);
		if(request.getSession().getAttribute("ID")==null){
			ob.put("state","failed");
			ob.put("details","发表失败");
			ob.put("new-floor",0);
			ob.put("new-poster",0);
			ob.put("new-img", null);
			ob.put("new-com", null);
			out.print(ob);
            out.close();
		}
		else{
			int ID = (int)request.getSession().getAttribute("ID");
			request.getSession().setAttribute("ID", ID);
			System.out.println("--评论保存界面绑定用户ID："+ID);
			UserBean poster = new UserBean(ID);
			if(request.getParameter("content")==null || request.getParameter("source_id")==null || request.getParameter("po-state")==null){
				System.out.println("--有空值存在！");
				ob.put("state","failed");
				ob.put("details","发表失败");
				ob.put("new-floor",0);
				ob.put("new-poster",ID);
				ob.put("new-img", poster.getUser_IMG());
				ob.put("new-com", "");
				out.print(ob);
	            out.close();
			}
			else{
				System.out.println("--没有空值存在！");
				int source_id = Integer.valueOf(request.getParameter("source_id"));
				String comments = request.getParameter("content");
				CommentBean com = new CommentBean();
				ReplyBean repo = new ReplyBean();
				String state = request.getParameter("po-state");
				Date date=new Date();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");//-时间秒级
			    String date1 = sdf.format(date);
			    if(state==null||state.equals("")){
			    	System.out.println("--state为空指针或者空参数");
			    	System.out.println("--state:"+state);
			    	ob.put("state","0");
					ob.put("details","失败！状态为空");
					ob.put("new-floor",0);
					ob.put("new-poster",ID);
					ob.put("new-img", poster.getUser_IMG());
					ob.put("new-com", comments);
					out.print(ob);
		            out.close();
			    }
			    else if(state.equals("1")){
					System.out.println("--状态为1！");
					int floor = com.addNewCom(source_id, ID, comments,date1);
					ob.put("state","1");
					ob.put("details","评论成功！");
					ob.put("new-floor",floor);
					ob.put("new-poster",ID);
					ob.put("new-img", poster.getUser_IMG());
					ob.put("new-com", comments);
					out.print(ob);
		            out.close();
				}
				else if(state.equals("2")){
					System.out.println("--状态为2！");
					if(request.getParameter("reference_id")==null){
						System.out.println("--回复对象不空！");
						ob.put("state","2");
						ob.put("details","回复保存失败！");
						ob.put("new-floor",0);
						ob.put("new-poster",ID);
						ob.put("new-img", poster.getUser_IMG());
						ob.put("new-com", comments);
						out.print(ob);
			            out.close();
					}
					else{
						System.out.println("--恢复对象为空");
						int floor = com.addNewCom(source_id, ID, comments,date1);
						int to_id = Integer.valueOf(request.getParameter("reference_id"));
						repo.addReply(source_id, floor, ID, to_id);
						ob.put("state","2");
						ob.put("details","回复成功！");
						ob.put("new-floor",floor);
						ob.put("new-poster",ID);
						ob.put("new-img", poster.getUser_IMG());
						ob.put("new-com", comments);
						out.print(ob);
			            out.close();
					}
					
				}
				else{
					System.out.println("--state不为空，也不为1或者2");
					System.out.println("state:"+state);
			    	ob.put("state","0");
					ob.put("datails","失败！状态为空");
					ob.put("new-floor",0);
					ob.put("new-poster",ID);
					ob.put("new-img", poster.getUser_IMG());
					ob.put("new-com", comments);
					out.print(ob);
		            out.close();
				}
				
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

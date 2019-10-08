package source;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.*;
import source.*;
import people.*;
import java.sql.SQLException;public class CollectServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public CollectServlet() {
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
		response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(request.getSession().getAttribute("ID")!=null){//当前访问者
			int ID = (Integer)request.getSession().getAttribute("ID");
			request.getSession().setAttribute("ID", ID);
			if(request.getParameter("source_id")!=null ||request.getSession().getAttribute("source_id")!=null){
				int source_id = 0;
				if(request.getParameter("source_id")!=null){
					source_id = Integer.valueOf(request.getParameter("source_id"));//要设置getParameter
				}
				else{
					source_id = (int)request.getSession().getAttribute("source_id");
				}
				int idol_id = 0;//当前所有者
				try{
					if(source_id>=100000){
						PicBean picture = new PicBean();
						idol_id = picture.getUser_id(source_id);
					}
					else{
						AlbBean albumn = new AlbBean();
						albumn.getAlb(source_id);
						idol_id = albumn.getUser_id();
					}
					CollectBean collect = new CollectBean();
					PicBean pic = new PicBean();
					boolean isCol = collect.isCol(ID, source_id);
					if(source_id>=100000){//图片				
						if(!isCol){//没收藏
							String alb_name = request.getParameter("alb_name");
							int from_id = pic.getFrom_id(source_id);
							String pic_addr = pic.getPic_addr(source_id);
							int albid = Integer.valueOf(request.getParameter("alb_id"));
							String des = pic.getDes(source_id);
							int newsource_id = pic.colPic(ID, from_id, pic_addr, albid, des);
							collect.setCol(ID, source_id);
						}
						else{
							collect.delCol(ID, source_id);//从收藏表中删去该条记录
						}
					}
					else{//专辑、文章
						if(!isCol){
							//加入用户收藏
							collect.setCol(ID, source_id);
						}
						else
							collect.delCol(ID, source_id);
					}
					collect.close();
					System.out.println("--结束专辑--");
					}catch (ClassNotFoundException e) {
				  	      // TODO Auto-generated catch block
				  	      e.printStackTrace();
				  	}
					catch(SQLException e){
				  	      e.printStackTrace();
				  	}
				response.sendRedirect("Search/blog.jsp?source_id="+source_id+"");
				return;
			}
			else{
				request.setAttribute("Emessage", "CollectServlet_Source_id_NULL");
            	request.getRequestDispatcher("Error.jsp").forward(request, response);
            	return;
			}
		}
		else{
			System.out.println("--CollectServlet-GET:没有绑定用户ID--");
	   		request.setAttribute("Emessage", "CollectServlet_ID_NULL");
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
		response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if(request.getSession().getAttribute("ID")!=null){
			int ID = (Integer)request.getSession().getAttribute("ID");
			request.getSession().setAttribute("ID", ID);
			if(request.getSession().getAttribute("source_id")!=null){//获取session的source_id
				int source_id = (Integer)request.getSession().getAttribute("source_id");
				request.getSession().setAttribute("source_id", source_id);
				try{
					CollectBean collect = new CollectBean();
					boolean isCol = collect.isCol(ID, source_id);
					if(source_id>=1000000){				
						if(!isCol){
							String alb_name = request.getParameter("alb_name");
							//Pic表新增记录，返回Id
							//加入专辑
							collect.setCol(ID, source_id);
						}
						else{
							//从专辑删除图片
							collect.delCol(ID, source_id);
						}
					}
					else{
						if(!isCol){
							//加入用户收藏
							collect.setCol(ID, source_id);
						}
						else
							collect.delCol(ID, source_id);
					}
					
				}catch (ClassNotFoundException e) {
			  	      // TODO Auto-generated catch block
			  	      e.printStackTrace();
			  	    }
				catch(SQLException e){
			  	      e.printStackTrace();
			  	    }
				response.setHeader("refresh", "source_main.jsp");
				return;
			}
			else
				response.setHeader("refresh", "main.jsp");
			return;
		}
		else{
			System.out.println("--CollectServlet-GET:没有绑定用户ID--");
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

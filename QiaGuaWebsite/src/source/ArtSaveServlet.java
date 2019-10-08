package source;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import net.sf.json.JSONObject;
import javax.imageio.*;
import javax.json.Json;
import javax.servlet.annotation.*;
import source.ArtBean;
import com.UploadBean;
public class ArtSaveServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public ArtSaveServlet() {
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
		PrintWriter out = response.getWriter();
		JSONObject ob =new  JSONObject();//创建json对象
		ob.put("message","title");
		ob.put("datails","文章名与其他文章重复，请修改文章标题！");
		ob.put("art_id",0);
		ob.put("user_id",0);
		if((request.getParameter("content")!=null && request.getParameter("title")!=null)){
			ArtBean art = new ArtBean();
			String content = request.getParameter("content");
			String title = request.getParameter("title");
			art.setContent(content);
			if(request.getSession().getAttribute("ID")!=null){
				int ID = (int)request.getSession().getAttribute("ID");
				System.out.println("--ID:"+ID+"--");
				System.out.println("--content:"+content+"--");
				System.out.println("--title:"+title+"--");
				/*---------------------------------------生成修改时间---------------------------------------*/
				Date date=new Date();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");//-时间秒级
			    String date1 = sdf.format(date);
			    /*----------------------------------除了图片，处理文章其他部分------------------------------*/
			    int art_id = 0;
			    if(request.getParameter("art_id")!=null){
			    	art_id = Integer.valueOf(request.getParameter("art_id"));
			    	if(art_id == 0){//需要新建文章
						/*判断新文章名是否重复*/
				    	if(!art.isValid(ID, title)){//文章名重复，提示用户修改
				    		System.out.println("--新建：文章名与其他文章重复，请修改文章标题--");
				    		ob.put("message","title");
				    		ob.put("datails","文章名与其他文章重复，请修改文章标题！");
				    		ob.put("art_id",art_id);
				    		ob.put("user_id",ID);
				    		out.print(ob);
				            out.close();
				    	}
				    	else{//新文章有效，新建 
				    		/*生成初始文章对象*/
							art_id = art.AddArt(ID, title, date1, content);
							System.out.println("--新建：保存成功--");
							ob.put("message","OK");
				    		ob.put("datails","保存成功！");
				    		ob.put("art_id",art_id);
				    		ob.put("user_id",ID);
				    		out.print(ob);
				            out.close();
				    	}
			    	}
			    	 else{//文章已存在: "保存"
					    	art_id = Integer.valueOf(request.getParameter("art_id"));
					    	if(!art.isValid(ID, art_id, title)){//文章名重复
					    		System.out.println("--已存在：文章名与其他文章重复，请修改文章标题--");
					    		ob.put("message","title");
					    		ob.put("datails","文章名与其他文章重复，请修改文章标题！");
					    		ob.put("art_id",art_id);
					    		ob.put("user_id",ID);
					    		out.print(ob);
					            out.close();
					    	}
					    	else{
					    		art.changeArt(art_id, content, title, date1);
					    		System.out.println("--保存中--");
					    		ob.put("message","ok");
					    		ob.put("datails","保存成功！");
					    		ob.put("art_id",art_id);
					    		ob.put("user_id",ID);
					    		out.print(ob);
					            out.close();
					    	}
			    	 }
			    }
			    else{
			    	System.out.println("--文章ID为空--");
			    	System.out.println("--参数为空--");
					ob.put("message","json");
		    		ob.put("datails","没有获得有效参数！");
		    		ob.put("art_id",-1);
		    		ob.put("user_id",-1);
		    		out.print(ob);
		            out.close();
			    }
			}
			else{
				System.out.println("--用户ID为空--");
				ob.put("message","ID");
	    		ob.put("datails","您并不是有效用户！");
	    		ob.put("art_id",0);
	    		ob.put("user_id",-1);
	    		out.print(ob);
	            out.close();
			}
		}
		else{
			System.out.println("--内容、标题参数为空--");
			if(request.getParameter("art_id")!=null){
				System.out.println("--文章ID参数为空--");
			}
			ob.put("message","json");
    		ob.put("datails","没有获得有效参数！");
    		ob.put("art_id",-1);
    		ob.put("user_id",-1);
    		if(request.getSession().getAttribute("ID")!=null){
				int ID = (int)request.getSession().getAttribute("ID");
				request.getSession().setAttribute("ID", ID);
				request.getRequestDispatcher("ArticleManager1.jsp").forward(request, response);
				return;
            }
            else{
            	request.setAttribute("Emessage", "Article_NULL");
            	request.getRequestDispatcher("../Error.jsp").forward(request, response);
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

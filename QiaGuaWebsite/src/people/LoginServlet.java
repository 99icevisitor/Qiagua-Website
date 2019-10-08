package people;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import source.AlbBean;
public class LoginServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public LoginServlet() {
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

		response.setContentType("text/html;utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		
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

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		/*-------------------------------------login1-----------------------------------*/
		if(request.getParameter("userName")!=null && request.getParameter("userPwd")!=null){
			/*初步生成用户信息
			 *
			 * */
			Integer userID = null;
				try {
					String userName = request.getParameter("userName");
					String userPwd = request.getParameter("userPwd");
					RegisterBean rgBean = new RegisterBean();
					if(rgBean.isName(userName)){
						userID = rgBean.createUser(userName, userPwd, "初步注册");
						request.getSession().setAttribute("ID", userID);
						request.getRequestDispatcher("login2.jsp").forward(request, response);
						return;
					}
					else{
						request.setAttribute("Emessage", "user_name");
						request.getRequestDispatcher("Error.jsp").forward(request, response);
					}
					//login1失败
					rgBean.close();
				}catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		else{
			System.out.println("--用户已经完成初步注册--");
		}
		
		/*-------------------------------------login2-----------------------------------*/
		if(request.getParameter("userMail")!=null){
			/*进一步完善用户信息
			 * 
			 * */
			System.out.println("--需要完善的ID是:"+request.getSession().getAttribute("ID")+"--");
			Integer ID = (Integer) request.getSession().getAttribute("ID");
			String mail = request.getParameter("userMail");
			String tell = request.getParameter("userTell");
			boolean flag = false;
			boolean flag2 = false;
			boolean flag3 = false;
			try{
				UserBean userBean = new UserBean();
				RegisterBean rgBean = new RegisterBean();
				flag2 = rgBean.isMail(mail);
				flag3 = rgBean.isTell(tell);
				//request.setAttribute("continueID", ID);
				if(!flag2){/*这里处理邮箱重复错误*/
					request.setAttribute("Emessage", "user_Mail");
					request.getSession().setAttribute("ID", ID);
					request.getRequestDispatcher("Error.jsp").forward(request, response);
					return;
				}
				else if(!flag3){/*这里处理手机号重复错误*/
					request.setAttribute("Emessage", "user_Tell");
					request.getRequestDispatcher("Error.jsp").forward(request, response);
					return;
				}
				else{/*可以成为用户*/
					if(ID!=null){
						System.out.println("--进行用户完善，ID是"+ID+"--");
						flag = userBean.addUser(ID, mail, tell);
						Date date = new Date();
					    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
						String date1 = sdf.format(date);
						flag = rgBean.modifyLogin(ID,4,date1);
						flag = rgBean.modifyLogin(ID,5,"未实名");
						userBean.close();
						rgBean.close();
						if(!flag){/*此处处理保存数据失败错误*/
							request.setAttribute("Emessage", "login2");
							request.getSession().setAttribute("ID", ID);
							request.getRequestDispatcher("Error.jsp").forward(request, response);
							return;
						}else{/*处理成功*/
							request.getSession().setAttribute("ID", ID);
							request.getRequestDispatcher("login3.jsp").forward(request, response);
							return;
						}
					}else{
						System.out.println("--进行用户完善，但是ID为null--");
						request.setAttribute("Emessage", "login2_ID_null");
						request.getRequestDispatcher("Error.jsp").forward(request, response);
						return;
					}
				}
			}catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			System.out.println("--已完成用户注册--");
		}
		
		/*-------------------------------------login3-----------------------------------*/
		if(request.getParameter("userIDName")==null||((String)request.getParameter("userIDName")).equals("") ){
			System.out.println("--userIDName 不用修改--");
		}else{
			/*更新USER表中NAME信息
			 * String name = request.getParameter("userIDName");
			 * try:  modifyUserInfo(ID,8,name);
			 * */
			try{
				UserBean userBean = new UserBean();
				String name = request.getParameter("userIDName");
				boolean flag = false;
				if(request.getSession().getAttribute("ID")!=null){//成功更新姓名
					Integer ID = (Integer) request.getSession().getAttribute("ID");
					System.out.println("--login3即将验证的ID是:"+ID+"--");
				    while(!flag){
				    	flag = userBean.modifyUser(ID, 8, name);
				    }
				    System.out.println("--更新USER表中NAME信息--");
				}
				else{
					System.out.println("--进行填写用户姓名，但是ID为null--");
					request.setAttribute("Emessage", "login3_NAME_ID_null");
					request.getRequestDispatcher("Error.jsp").forward(request, response);
					return;
				}
			    userBean.close();
			}catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(request.getParameter("userSender")==null||((String)request.getParameter("userSender")).equals("")){
			System.out.println("--userSender 不用修改--");
		}
		else{
			/*更新USER表中SENDER信息
			 * String sender = request.getParameter("userSender");
			 * try:  modifyUserInfo(ID,9,sender);
			 * */
			try{
				UserBean userBean = new UserBean();
				String sender = request.getParameter("userSender");
				boolean flag = false;
				if(request.getSession().getAttribute("ID")!=null){//成功更新性别
					Integer ID = (Integer) request.getSession().getAttribute("ID");
					System.out.println("--login3即将验证的ID是:"+ID+"--");
				    while(!flag){
				    	flag = userBean.modifyUser(ID, 9, sender);
				    }
				    System.out.println("--更新USER表中SENDER信息--");
				}
				else{
					System.out.println("--进行填写用户性别，但是ID为null--");
					request.setAttribute("Emessage", "login3_SENDER_ID_null");
					request.getRequestDispatcher("Error.jsp").forward(request, response);
					return;
				}
			    userBean.close();
			}catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		if(request.getParameter("userIDNumber")==null||((String)request.getParameter("userIDNumber")).equals("")){
			System.out.println("--userIDNumber 不用修改--");
		}
		else{
			/*更新USER表中SID信息
			 * String SID = request.getParameter("userIDNumber");
			 * try:  modifyUserInfo(ID,9,SID);
			 * */
			try{
				UserBean userBean = new UserBean();
				String SID = request.getParameter("userIDNumber");
				boolean flag = false;
				if(request.getSession().getAttribute("ID")!=null){//成功更新身份证号
					Integer ID = (Integer) request.getSession().getAttribute("ID");
					System.out.println("--login3即将验证的ID是:"+ID+"--");
				    while(!flag){
				    	flag = userBean.modifyUser(ID, 7, SID);
				    }
				    System.out.println("--更新USER表中SID信息--");
				}
				else{
					System.out.println("--进行填写用户身份证号，但是ID为null--");
					request.setAttribute("Emessage", "login3_SID_ID_null");
					request.getRequestDispatcher("Error.jsp").forward(request, response);
					return;
				}
			    userBean.close();
			}catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/*----------------------------------login3 to login4-------------------------------*/
		if(request.getParameter("button3")!=null){//绑定ID进行登录
			if(request.getSession().getAttribute("ID")!=null){
				System.out.println("--用户注册成功，即将跳转登录--");
				Integer ID = (Integer) request.getSession().getAttribute("ID");
				request.getRequestDispatcher("login4.jsp").forward(request, response);
			}
			else{
				System.out.println("--用户注册成功，但是ID丢失--");
				request.setAttribute("Emessage", "login3_success_ID_null");
				request.getRequestDispatcher("Error.jsp").forward(request, response);
				return;
			}
		}
		out.println("  </center>");
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

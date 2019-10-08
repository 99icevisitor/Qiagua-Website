package com;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;

import javax.json.Json;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class AJServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public AJServlet() {
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
		String userName=request.getParameter("name");
		//得到ajax传递过来的paramater  
        System.out.println(userName);
		response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
        
      /*用map来接收request发送过来的多维数组
        Map map = request.getParameterMap();
		Iterator<String> iter = map.keySet().iterator();
        while (iter.hasNext()) {
            String key = iter.next();
            System.out.println("key=" + key );
            String[] value =  (String[]) map.get(key);
            System.out.print("value=");
            for(String v:value){                
                System.out.print(v + "  ");
            }            
            System.out.println();
        }        
        */
        
        
        
       // String attr = request.getParameter("id").toString();
       // System.out.println("--"+attr);
      /*先创建字符流来读取json
        BufferedReader reader = new BufferedReader(request.getReader());
        String json = reader.readLine();
        //这里用fastjson来解析
        JSONObject jo = JSON.parseObject(json);
        //获取name和age对应的值
        String name = jo.getString("name");
        int age = jo.getInteger("age");
        System.out.println("name: "+name+";"+"age: "+age);
        */
        
        JSONObject ob =new  JSONObject();//创建json对象
        ob.accumulate("name","小明");//添加元素
        ob.accumulate("age", 18);
        PrintWriter out =response.getWriter() ;
        out.print(ob);
        out.close();
        /*
        if(reader.readLine()==null){
        	//添加元素
        	System.out.println("-1-"+myJson.toString());
        	JSONObject ob =new  JSONObject();//创建json对象|封装新的json
            response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
            PrintWriter out = response.getWriter();
	        ob.accumulate("Error", "BufferReader 读值为空！");
	        out.print(ob);
	        out.close();
        }
        else{
        	while ((line = reader.readLine()) != null) {
                myJson.append(line);
            }
            System.out.println("-2-"+myJson.toString());
            
            JSONObject ob =new  JSONObject();//创建json对象|封装新的json
            response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
            PrintWriter out = response.getWriter();
			ob.accumulate("name","hyy123");//添加元素
			ob.accumulate("name","admin");
	        ob.accumulate("age", 18);
	        out.print(ob);
	        out.close();
        }*/
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

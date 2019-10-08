package com;
 
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import source.AlbBean;
import source.PicBean;
import java.util.Date;
public class UploadSer extends HttpServlet {
	private StringBuffer fileName1;
	private ServletInputStream inputStream;

	@SuppressWarnings("unchecked")
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		if(req.getSession().getAttribute("ID")!=null){
			int ID = (Integer)req.getSession().getAttribute("ID");
			if(req.getSession().getAttribute("alb_id")==null){
				System.out.println("--alb_id:null--");
			}
			else{
				int alb =  (int) req.getSession().getAttribute("alb_id");
				System.out.println("--alb_id"+alb+"--");
				String Savepath = null;
				String newFileName = null;
				Date date=new Date();
			    SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");//-时间秒级
				String date1 = sdf.format(date);
				String pic_des = null;
				boolean flag = false;
				boolean isSave = false;
			//为解析类提供配置信息
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024*1024*3);
			//创建解析类的实例
			ServletFileUpload sfu = new ServletFileUpload(factory);
			//开始解析
			sfu.setFileSizeMax(1024*1024*3);
			//每个表单域中数据会封装到一个对应的FileItem对象上
			try {
				List<FileItem> items = sfu.parseRequest(req);
				//区分表单域
				for (int i = 0; i < items.size(); i++) {
					FileItem item = items.get(i);
					
					if(!item.isFormField()){//isFormField为true，表示这不是文件上传表单域
						ServletContext sctx = getServletContext();
						//获得存放文件的物理路径
						//upload下的某个文件夹   得到当前在线的用户  找到对应的文件夹
						
						String path = sctx.getRealPath("/upload");
						//System.out.println("物理路径:"+path);
						
						//获得文件名
						String fileName = item.getName();
						//System.out.println("文件名:"+fileName);
						
						// 获取图片的扩展名
			            String extensionName = fileName
			                     .substring(fileName.lastIndexOf(".") + 1);
			            //System.out.println("文件扩展名"+extensionName);
			            
			            // 新的图片文件名 = 获取时间+"."图片扩展名
			            newFileName = date1 + "." + extensionName;
			            System.out.println("新文件名"+newFileName);
			            //物理上保存的图片地址
			            String middleName = "user\\"+ID+"\\alb_"+alb;
			            String filepath = path+"\\"+middleName+"\\"+newFileName;
			            System.out.println("文件路径"+filepath);
			            //创建物理地址
			            File Filepath = new File(path+"\\"+middleName);
			            boolean mkdir = false;
			            if(!Filepath.isDirectory()){
			            	mkdir = Filepath.mkdirs();
			            }
			            else{
			            	System.out.println("目录已存在！");
			            }
			            	
			            //保存图片
						File file = new File(filepath);
						
						if(!file.exists()){
							//非保存过的：记录上传图片的名字
							item.write(file);
							System.out.println("YES");
							flag = true;
						}
						else{
							isSave = true;
						}
					}
					else{//对描述信息进行封装
						try {
			                  if("pic_des".equals(item.getFieldName())) {
			                     pic_des = item.getString("utf-8").trim();
			                         System.out.println(pic_des);
			                     req.setAttribute("Pic_describe",pic_des );
			                  }
			            }catch (NumberFormatException e) {
			                  e.printStackTrace();
			                  return;
			            }
					}
				}//循环结束
				if(flag && !isSave){
					//数据库保存的图片地址
					Savepath = "upload/user/"+ID+"/alb_"+alb+"/"+newFileName;
					//地址写入数据库，记录保存点
					PicBean pic = new PicBean();
					System.out.println("--img_url:"+Savepath+"--");
					pic.savePic(date1, Savepath, ID, alb,0,pic_des);
					req.setAttribute("success", true);
					req.getSession().setAttribute("ID", ID);
					req.getRequestDispatcher("main.jsp").forward(req, resp);
					return;
				}
				else if(isSave){
					req.setAttribute("success", false);
					System.out.println("--已保存过该图--");
					req.getSession().setAttribute("ID", ID);
					req.getRequestDispatcher("main.jsp").forward(req, resp);
					return;
				}
				req.setAttribute("success", 0);
				System.out.println("没有可上传的图片！");
				req.getSession().setAttribute("ID", ID);
				req.getRequestDispatcher("main.jsp").forward(req, resp);
				return;
			}
			 catch (Exception e) {
				e.printStackTrace();
			}
		}
	  }
	}
 
}
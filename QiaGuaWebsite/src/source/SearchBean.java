package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import source.*;
import people.*;
public class SearchBean {
	int source_id;
	String keyWord;
	private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
    private String user="root";
    private String password="root";
    private String driver="com.mysql.cj.jdbc.Driver";
    private Connection conn=null;
    private Statement stmt=null;
    private ResultSet rs=null;
	public SearchBean(){
		
	}
	public List<PicBean> searchPic(String key_word){
		List<PicBean> list = new ArrayList<>();
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "select * from pic where pic_des like '%"+key_word+"%'";
    		System.out.println(sql);
    		rs = stmt.executeQuery(sql);
    		while(rs.next()){
    			PicBean pic = new PicBean();
    			pic.getPic(rs.getInt(1));
    			list.add(pic);
    		}
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public List<AlbBean> searchAlb(String key_word){
		List<AlbBean> list = new ArrayList<>();
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "select * from alb where alb_des like '%"+key_word+"%'";
    		System.out.println(sql);
    		rs = stmt.executeQuery(sql);
    		while(rs.next()){
    			AlbBean alb = new AlbBean();
    			alb.getAlb(rs.getInt(1));
    			list.add(alb);
    		}
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public List<UserBean> searchUser(String key_word){
		List<UserBean> list = new ArrayList<>();
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "select * from user where user_name like '%"+key_word+"%'";
    		System.out.println(sql);
    		rs = stmt.executeQuery(sql);
    		while(rs.next()){
    			UserBean user = new UserBean(rs.getInt(1));
    			list.add(user);
    		}
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}
	public List<ArtBean> searchArt(String key_word){
		List<ArtBean> list = new ArrayList<>();
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "select * from art where art_author like '%"+key_word+"%' or art_title like '%"+key_word
    				+"%' or art_content like '%"+key_word+"%'";
    		System.out.println(sql);
    		rs = stmt.executeQuery(sql);
    		while(rs.next()){
    			ArtBean art = new ArtBean();
    			art.getArt(rs.getInt(1));
    			list.add(art);
    		}
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; 
	}
}

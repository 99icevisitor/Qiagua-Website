package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;
public class CommentBean {
	private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
    private String user="root";
    private String password="root";
    private String driver="com.mysql.cj.jdbc.Driver";
    private Connection conn=null;
    private Statement stmt=null;
    private ResultSet rs=null;
	private int SOURCE_ID;
	private int USER_ID;
	private int COMMENT_ID;
	private String COM_TIME;
	String comment = null;
	public CommentBean(){
		
	}
	public CommentBean(int source_id,int floor){
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "select * from comment where source_id="+source_id+" and COMMENT_ID="+floor;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			setCom(source_id,floor,rs.getInt(3),rs.getString(4),rs.getString(5));
    		}
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<CommentBean> getComList(int source_id){
		List<CommentBean> list = new ArrayList<>();
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "select * from comment where source_id="+source_id;
    		rs = stmt.executeQuery(sql);
    		while(rs.next()){
    			CommentBean com_line = new CommentBean();
    			com_line.setCom(source_id,rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5));
    			list.add(com_line);
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
	public void setCom(int source_id,int floor,int user_id,String comments,String time){
		SOURCE_ID = source_id;
		COMMENT_ID = floor;
		USER_ID = user_id;
		comment = comments;
		COM_TIME = time;
	}
	public int addNewCom(int source_id,int user_id,String comments,String time){
		int floor = 0;
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "select max(COMMENT_ID) from comment where source_id="+source_id;
    		rs = stmt.executeQuery(sql);
    		System.out.println(sql);
    		if(rs.next()){
    			floor = rs.getInt(1)+1;
    			if(floor>=1){
    				System.out.println("新增评论floor:"+floor);
    	    		sql = "insert into comment values("+source_id+","+floor+","+user_id+",'"+comments+"','"+time+"');";
    	    		stmt.executeUpdate(sql);
    	    		System.out.println(sql);
    			}
    			else{
    				System.out.println("新增评论floor:"+floor);
    	    		sql = "insert into comment values("+source_id+",1,"+user_id+",'"+comments+"','"+time+"');";
    	    		stmt.executeUpdate(sql);
    	    		System.out.println(sql);
    			}
    		}
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return floor;
	}
	public void deleteCom(int source_id,int floor){
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "delete from comment where source_id"+source_id+" and COMMENT_ID="+floor;
    		stmt.executeUpdate(sql);
    		System.out.println(sql);
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getSource_id(){
		return SOURCE_ID;
	}
	public int getFloor(){
		return COMMENT_ID;
	}
	public int getUser(){
		return USER_ID;
	}
	public String getComment(){
		return comment;
	}
	public int getUser(int source_id,int floor){
		int user_id = 0;
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "select * from comment where source_id="+source_id+" and COMMENT_ID="+floor;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			user_id = rs.getInt(3);
    		}
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user_id;
	}
	public String getComment(int source_id,int floor){
		String comments = null;
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "select * from comment where source_id="+source_id+" and COMMENT_ID="+floor;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			comments = rs.getString(4);
    		}
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comments;
	}
	public String getTime(){
		return COM_TIME;
	}
	public String getTime(int source_id,int floor){
		String time = null;
		try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "select * from comment where source_id="+source_id+" and COMMENT_ID="+floor;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			time = rs.getString(5);
    		}
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return time;
	}
}

package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;
public class CollectBean {
	private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
    private String user="root";
    private String password="root";
    private String driver="com.mysql.cj.jdbc.Driver";
    private Connection conn=null;
    private Statement sqlStmt=null;
    private ResultSet sqlRst=null;
    public CollectBean() {
 		 }
    public int getCol_Num(int source_id)throws SQLException{
    	int sum = 0;
    	try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    sqlStmt = conn.createStatement();
    		String sql = "select count(fans_id) from collection group by svhc_id having svhc_id="+source_id;
    		sqlRst = sqlStmt.executeQuery(sql);
    		if(sqlRst.next())
    			sum = sqlRst.getInt("count(fans_id)");
    	}catch (SQLException e) {
			  System.out.println(e.toString());
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return sum;
    }
    public boolean isCol(int user_id,int source_id)throws SQLException,ClassNotFoundException{
    	try {//是否已经收藏
			  Class.forName(driver);
		      conn = DriverManager.getConnection(url, user, password);
		      sqlStmt = conn.createStatement();
		      String sql = "select * from collection where fans_id="+user_id+" and svhc_id="+source_id;
		      System.out.println(sql);
		      sqlRst = sqlStmt.executeQuery(sql);
		      if(sqlRst.next())
		    	  return true;
		      return false;
		      } 
		 catch (SQLException e) {
			  System.out.println(e.toString());
			  return false;
		     }
    }
    public List<Integer> getCol_List(int user_id)throws SQLException,ClassNotFoundException{
    	List<Integer> list = new ArrayList<Integer>();
    	try {
			  Class.forName(driver);
		      conn = DriverManager.getConnection(url, user, password);
		      sqlStmt = conn.createStatement();
		      String sql = "select * from collection where fans_id="+user_id;
		      System.out.println(sql);
		      sqlRst = sqlStmt.executeQuery(sql);
		      while(sqlRst.next())
		    	  if(sqlRst.getInt("svhc_id")<1000000)
		    	  list.add(sqlRst.getInt("svhc_id"));
		      } 
		 catch (SQLException e) {
			  System.out.println(e.toString());
		     }
    	return list;
    }
    public boolean setCol(int user_id,int source_id)throws SQLException{
    	try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    sqlStmt = conn.createStatement();
    		Date d = new Date();
    		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        	String date = df.format(d);
    		String sql = "insert into collection value("+user_id+","+source_id+",'"+date+"');";
    		System.out.println(sql);
    		sqlStmt.executeUpdate(sql);
    		return true;
    	}catch (SQLException e) {
			  System.out.println(e.toString());
			  return false;
	    } 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
    }
    public boolean delCol(int user_id,int source_id)throws SQLException{
    	try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    sqlStmt = conn.createStatement();
    		String sql = "delete from collection where fans_id="+user_id+" and svhc_id="+source_id;
    		System.out.println(sql);
    		sqlStmt.executeUpdate(sql);
    		return true;
    	}catch (SQLException e) {
			  System.out.println(e.toString());
			  return false;
	     } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
    }
    public void close() throws SQLException{
    	try{
    		if(conn!=null)
        		conn.close();
    	}catch(SQLException e) {
        	System.out.println(e.toString());
    	}
    }
}

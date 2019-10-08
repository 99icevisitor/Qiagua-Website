package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ThumbBean {
       private String type;
       private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
       private String user="root";
       private String password="root";
       private String driver="com.mysql.cj.jdbc.Driver";
       private Connection conn=null;
       private Statement sqlStmt=null;
       private ResultSet sqlRst=null;
       public ThumbBean()throws SQLException,ClassNotFoundException {
    		 try {
    			  Class.forName(driver);
    		      conn = DriverManager.getConnection(url, user, password);
    		      sqlStmt = conn.createStatement();
    		      } 
    		 catch (SQLException e) {
    			  System.out.println(e.toString());
    		     }
    		 }
       public boolean isThumb(int user_id,int source_id){
    	   boolean ok = false;
    	   try{
    		   Class.forName(driver);
 		       conn = DriverManager.getConnection(url, user, password);
 		       sqlStmt = conn.createStatement();
    		   String sql = "select * from praise where source_id="+source_id+" and user_id="+user_id;
    		   sqlRst = sqlStmt.executeQuery(sql);
    		   if(sqlRst.next()){
    			   ok = sqlRst.getBoolean("ISPRAISED");
    		   }
    	   }
    	   catch(SQLException e){
    			System.out.println(e.toString());
           } 
    	   catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
    	   }
    	   return ok;
       }
       public boolean setThumb(int source_id,int user_id)throws SQLException{
    	   boolean ok = false;
    	   try{
    		   Class.forName(driver);
 		       conn = DriverManager.getConnection(url, user, password);
 		       sqlStmt = conn.createStatement();
    		   String sql = "select * from praise where source_id="+source_id+" and user_id="+user_id;
    		   sqlRst = sqlStmt.executeQuery(sql);
    		   if(sqlRst.next()){
    			   boolean isPraise = sqlRst.getBoolean("ispraised");
    			   if(isPraise){
	    			   sql  = "update praise set ispraised=false where source_id="+source_id+" and user_id="+user_id;
	    			   sqlStmt.executeUpdate(sql);
	    			   System.out.println(sql);
    			   }
    			   else{
    				   sql  = "update praise set ispraised=true where source_id="+source_id+" and user_id="+user_id;
	    			   sqlStmt.executeUpdate(sql);
	    			   System.out.println(sql);
    			   }  
    		   }
    		   else{
    			   sql = "insert into praise value("+source_id+","+user_id+",true);";
    			   System.out.println("初次点赞");
    			   sqlStmt.executeUpdate(sql);
    		   }
    		   ok = true;
    	   }
    	   catch(SQLException e){
    			System.out.println(e.toString());
           } 
    	   catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
    	   }
    	   return ok;
       }
       public int getThumb_Num(int source_id)throws SQLException{
    	   int n = 0;
    	   try{
    		   Class.forName(driver);
 		       conn = DriverManager.getConnection(url, user, password);
 		       sqlStmt = conn.createStatement();
    		   String sql = "select count(user_id) from praise where ispraised=true group by source_id having source_id="+source_id;
    		   sqlRst = sqlStmt.executeQuery(sql);
    		   if(sqlRst.next()){
    			   n = sqlRst.getInt("count(user_id)");
    		   }
    	   }catch(SQLException e){
   			System.out.println(e.toString());
   		   } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
   		   }
    	   return n;
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

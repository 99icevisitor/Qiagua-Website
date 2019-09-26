package people;
import java.sql.*;
import java.io.*;
public class SignBean {

	

		private String name;
	    private String pw;
	    private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
	    private String username="root";
	    private String password="123456";
	    private Connection conn=null;
	    private Statement sqlStmt=null;
	    private ResultSet sqlRst=null;
	    public String driver ="com.mysql.cj.jdbc.Driver";


	    public boolean isSuccess(String name,String pw) throws SQLException, ClassNotFoundException{
	   	 try {
	   		 Class.forName(driver);
	                conn = DriverManager.getConnection(url,username,password);
	                sqlStmt=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);
	                String sqlQuery="select pwd from login where user_name='"+name+"'";
	                sqlRst=sqlStmt.executeQuery(sqlQuery);
	                while(sqlRst.next()){
				   	 if(pw.equals(sqlRst.getString("pwd"))){
				   		 return true;
				   	 }
	                }
	                System.out.println("Signbean失败");
	                return false;
	            } catch (SQLException e) {
	            	System.out.println("Signbean失败");
	            	System.out.println(e.toString());
	               return false;
	            }finally{
	            	if(sqlRst!=null)sqlRst.close();
	            	if(sqlStmt!=null)sqlStmt.close();
	            	if(conn!=null)conn.close();
	            }	
	        }
	    
	    
	    public int getID(String name)throws SQLException, ClassNotFoundException{
	    	int ID = 0;
	    	try{
	    		 Class.forName(driver);
	                conn = DriverManager.getConnection(url,username,password);
	                sqlStmt=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);
	                String sqlQuery="select user_id from login where user_name='"+name+"'";
	                sqlRst=sqlStmt.executeQuery(sqlQuery);
	                while(sqlRst.next()){
				   	 ID = (Integer)sqlRst.getInt("USER_ID");
	                }
	                return ID;
	    	}
	    	catch (SQLException e) {
            	System.out.println("Signbean失败");
            	System.out.println(e.toString());
               return ID;
            }finally{
            	if(sqlRst!=null)sqlRst.close();
            	if(sqlStmt!=null)sqlStmt.close();
            	if(conn!=null)conn.close();
            }
	    }



}

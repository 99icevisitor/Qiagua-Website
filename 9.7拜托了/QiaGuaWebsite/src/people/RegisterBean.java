package people;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
public class RegisterBean {
	private Connection conn=null;
	private Statement sqlStmt=null;
	private ResultSet sqlRst=null;
    private String driver="com.mysql.cj.jdbc.Driver";
    private String url="jdbc:mysql://localhost:3306/qiagua?characterEncoding=UTF-8&serverTimezone=UTC&use Unicode=true";
    private String user="root";
    private String password="123456";
    public RegisterBean() throws SQLException, ClassNotFoundException{
    	try{
    		Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		sqlStmt=conn.createStatement();
    	}catch(SQLException e){
    		System.out.println(e.toString());
    	}
    }
    public boolean isName(String userName) throws SQLException{
    	try{
    		String sql="select USER_NAME from login;";
    		sqlRst=sqlStmt.executeQuery(sql);
    		while(sqlRst.next()){
    			if(userName.equals(sqlRst.getString("user_name"))){
    			System.out.println("用户名存在");
    			return false;
    			}
    		}
    			return true;
    	}catch(SQLException e){
    		System.out.println(e.toString());
    		return false;
    	}
    }
    public boolean isMail(String mail)throws SQLException{
    	try{
    		String sql1="select * from user;";
    		sqlRst = sqlStmt.executeQuery(sql1);
    		while(sqlRst.next()){
    			if(mail.equals(sqlRst.getString("email"))){
    			  System.out.println("邮箱已存在");
     			   return false;
    			}	
    		}
    		return true;
    	}catch(SQLException e){
    		System.out.println(e.toString());
    		return false;
    	}
    }
    public boolean isTell(String mobile)throws SQLException{
    	try{
    		String sql1="select * from user;";
    		sqlRst = sqlStmt.executeQuery(sql1);
    		while(sqlRst.next()){
    			if(mobile.equals(sqlRst.getString("mobile"))){
    			  System.out.println("电话已存在");
     			   return false;
    			}	
    		}
    		return true;
    	}catch(SQLException e){
    		System.out.println(e.toString());
    		return false;
    	}
    }
    public int createUser(String userName,String userPwd,String state) throws SQLException{
    	int id = 0;
    	try{
    		Date date=new Date();
		    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String date1 = sdf.format(date);
        	String sql="insert into login(USER_NAME,PWD,LAST_TIME,STATE)value('"+userName+"','"+userPwd+"','"+date1+"','"+state+"');";
        	sqlStmt.executeUpdate(sql);
        	sql="select USER_ID from login where USER_NAME='"+userName+"';";
        	sqlRst=sqlStmt.executeQuery(sql);
        	while(sqlRst.next()){
        	id=sqlRst.getInt("USER_ID");
        	}
        	System.out.println(id);
        	
    	}catch(SQLException e){
    		System.out.println(e.toString());
    	}
    	return id;
    }
    
    
   public boolean modifyLogin(int id,int column,String modify) throws SQLException{
	   try{
		   Class.forName(driver);
   		   conn=DriverManager.getConnection(url, user, password);	
   		   sqlStmt=conn.createStatement();
		   String sql1 ="update login set ",sql2 = "='"+modify+ "' where user_id="+id+";",sql;
		   switch(column){
		   case 1:{
			   System.out.println("--修改LOGIN表中USER_NAME信息--");
			   sql = sql1+"user_name"+sql2;
			   sqlStmt.executeUpdate(sql);return true;
		   }
		   case 3:{
			   System.out.println("--修改LOGIN表中PWD信息--");
			   sql = sql1+"pwd"+sql2;
			   sqlStmt.executeUpdate(sql);return true;
		   }
		   case 4:{
			   System.out.println("--修改LOGIN表中LAST_TIME信息--");
			   sql = sql1+"last_time"+sql2;
			   System.out.println(sql);
			   sqlStmt.executeUpdate(sql);return true;
		   }
		   case 5:{
			   System.out.println("--修改LOGIN表中STATE信息--");
			   sql = sql1+"state"+sql2;
			   System.out.println(sql);
			   sqlStmt.executeUpdate(sql);return true;
		   }
		   default:return false;
		   }
	   }catch(SQLException e){
	   		System.out.println(e.toString());
	   } catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return false;
   }
   public void close() throws SQLException{
	   try{
	    	if(conn!=null)
	    		conn.close();
	    	}catch(SQLException e){
	    		System.out.println(e.toString());
	    	}
   }
}

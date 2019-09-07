package people;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserBean {
	private Connection conn=null;
	private Statement sqlStmt=null;
	private ResultSet sqlRst=null;
    private String driver="com.mysql.cj.jdbc.Driver";
    private String url="jdbc:mysql://localhost:3306/qiagua?characterEncoding=UTF-8&serverTimezone=UTC&use Unicode=true";
    private String user="root";
    private String password="123456";
    
    public String getUser_name(int ID){
    		String USER_NAME = "";
    		try {
				Class.forName(driver);
	    		conn=DriverManager.getConnection(url, user, password);	
	    		sqlStmt=conn.createStatement();
	    		String sql = null;
	    		sql = "select user_name from user where user_id="+ID;
	    		sqlRst = sqlStmt.executeQuery(sql);
	    		while(sqlRst.next()){
	        		USER_NAME = sqlRst.getString("USER_NAME");
	        	}
	    	}
			catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			catch(SQLException e){
	    		System.out.println(e.toString());
	    	}
    		return USER_NAME;
    }
    
    public String getCITY(int ID){
		String CITY = "";
		try {
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		sqlStmt=conn.createStatement();
    		String sql = null;
    		sql = "select CITY from user_inf where user_id="+ID;
    		sqlRst = sqlStmt.executeQuery(sql);
    		while(sqlRst.next()){
        		CITY = sqlRst.getString("CITY");
        	}
    	}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch(SQLException e){
    		System.out.println(e.toString());
    	}
		return CITY;
}
    
    public String getPROFILE(int ID){
		String PROFILE = "";
		try {
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		sqlStmt=conn.createStatement();
    		String sql = null;
    		sql = "select PROFILE from user_inf where user_id="+ID;
    		sqlRst = sqlStmt.executeQuery(sql);
    		while(sqlRst.next()){
        		PROFILE = sqlRst.getString("PROFILE");
        	}
    	}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch(SQLException e){
    		System.out.println(e.toString());
    	}
		return PROFILE;
}
    
    public UserBean() throws SQLException, ClassNotFoundException{
    	try{
    		Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		sqlStmt=conn.createStatement();
    	}catch(SQLException e){
    		System.out.println(e.toString());
    	}
    }
    public boolean addUser(int user_id,String EMAIL,String MOBILE) throws SQLException{
    	try{
    	String USER_NAME = null,PWD = null,sql = null;
    	sql = "select * from login where user_id="+user_id+";";
    	sqlRst = sqlStmt.executeQuery(sql);
    	while(sqlRst.next()){
    		USER_NAME = sqlRst.getString("USER_NAME");
    		PWD = sqlRst.getString("PWD");
    	}
    	sql="insert into user(user_id,USER_NAME,PWD,EMAIL,MOBILE)value("+user_id+",'"+USER_NAME+"','"+PWD+"','"+EMAIL+"','"+MOBILE+"');";
    	sqlStmt.executeUpdate(sql);
    	return true;
    	}catch(SQLException e){
    		System.out.println(e.toString());
    		return false;
    	}
    }
    public boolean modifyUser(int user_id,int column,String modify) throws SQLException{
    	try{/*USER表修改*/
    		
    		String sql1="update user set ";
    		String sql2="='"+modify+"'where user_id="+user_id;
    		String sql=null;
    		switch(column){
    		case 2:{
    			sql=sql1+"user_name"+sql2;
    			System.out.println("--修改USER表中USER_NAME信息--");
    			Class.forName(driver);
        		conn=DriverManager.getConnection(url, user, password);	
        		sqlStmt=conn.createStatement();
    			sqlStmt.executeUpdate(sql);
    			return true;
    		}
    		case 3:{
    			sql=sql1+"PWD"+sql2;
    			System.out.println("--修改USER表中PWD信息--");
    			Class.forName(driver);
        		conn=DriverManager.getConnection(url, user, password);	
        		sqlStmt=conn.createStatement();
    			sqlStmt.executeUpdate(sql);
    			return true;
    		}
    		case 4:{
    			sql=sql1+"EMAIL"+sql2;
    			System.out.println("--修改USER表中EMAIL信息--");
    			Class.forName(driver);
        		conn=DriverManager.getConnection(url, user, password);	
        		sqlStmt=conn.createStatement();
    			sqlStmt.executeUpdate(sql);
    			return true;
    		}
    		case 5:{
    			sql=sql1+"MOBILE"+sql2;
    			System.out.println("--修改USER表中MOBILE信息--");
    			Class.forName(driver);
        		conn=DriverManager.getConnection(url, user, password);	
        		sqlStmt=conn.createStatement();
    			sqlStmt.executeUpdate(sql);
    			return true;
    		}
    		case 6:{
    			sql=sql1+"SMRZ"+sql2;
    			System.out.println("--修改USER表中SMRZ信息--");
    			Class.forName(driver);
        		conn=DriverManager.getConnection(url, user, password);	
        		sqlStmt=conn.createStatement();
    			sqlStmt.executeUpdate(sql);
    			return true;
    		}
    		case 7:{
    			sql=sql1+"SID"+sql2;
    			System.out.println("--修改USER表中SID信息--");
    			Class.forName(driver);
        		conn=DriverManager.getConnection(url, user, password);	
        		sqlStmt=conn.createStatement();
    			sqlStmt.executeUpdate(sql);
    			return true;
    		}
    		case 8:{
    			sql=sql1+"NAME"+sql2;
    			System.out.println("--修改USER表中NAME信息--");
    			Class.forName(driver);
        		conn=DriverManager.getConnection(url, user, password);	
        		sqlStmt=conn.createStatement();
    			sqlStmt.executeUpdate(sql);
    			return true;
    		}
    		case 9:{
    			sql=sql1+"SENDER"+sql2;
    			System.out.println("--修改USER表中SENDER信息--");
    			Class.forName(driver);
        		conn=DriverManager.getConnection(url, user, password);	
        		sqlStmt=conn.createStatement();
    			sqlStmt.executeUpdate(sql);
    			return true;
    		}
    		case 10:{
    			sql=sql1+"RTIME"+sql2;
    			System.out.println("--修改USER表中RTIME信息--");
    			Class.forName(driver);
        		conn=DriverManager.getConnection(url, user, password);	
        		sqlStmt=conn.createStatement();
    			sqlStmt.executeUpdate(sql);
    			return true;
    		}
    		default:
    			return false;
    		}
    	}catch(SQLException e){
    		System.out.println(e.toString());
    		
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			if(sqlRst!=null)sqlRst.close();
        	if(sqlStmt!=null)sqlStmt.close();
        	if(conn!=null)conn.close();
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

package people;

import java.sql.*;

public class UserInfoBean {
	private String name;
	private String id;
    private String SENDER;
    private String CITY;
    private String PROFILE;
    private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
    private String user="root";
    private String password="123456";
    private String driver="com.mysql.cj.jdbc.Driver";
    private Connection conn=null;
    private Statement sqlStmt=null;
    private ResultSet sqlRst=null;
    public void setName(String name){
    	this.name=name;
        }
    public String getName(){
    	return name;
        }
    public void setid(String id){
    	this.id=id;
        }
    public String getid(){
    	return id;
        }
    public void setSENDER(String SENDER){
    	this.SENDER=SENDER;
        }
    public String getSENDERe(){
    	return SENDER;
        }
    public void setCITY(String CITY){
    	this.CITY=CITY;
        }
    public String getCITY(){
    	return CITY;
        }
    public void setPROFILE(String PROFILE){
    	this.PROFILE=PROFILE;
        }
    public String getPROFILE(){
    	return PROFILE;
        }

    public UserInfoBean() throws SQLException,ClassNotFoundException {
	 try {
		 Class.forName(driver);
	      conn = DriverManager.getConnection(url, user, password);
	      } 
	 catch (SQLException e) {
		  System.out.println(e.toString());
	     }
	 }
    public ResultSet getRs(String sql) throws SQLException{
	  try{
	    sqlStmt=conn.createStatement();
	    sqlRst=sqlStmt.executeQuery(sql);
	    return sqlRst;
	    }
	  catch(SQLException e){
		System.out.println(e.toString());
	    }
	  return sqlRst;
    }
    
    public boolean existInfo(int ID){
    	String sql = null;
    	try{
    		sqlStmt=conn.createStatement();
    		sql = "select * from user_inf where user_id="+ID;
    	    sqlRst=sqlStmt.executeQuery(sql);
    	    while(sqlRst.next()){
			   	 return true;
            }
    	    return false;
    	}
    	catch(SQLException e){
    		System.out.println(e.toString());
    	}
		return false;
    }
    
    public void addInfo(int ID){
    	String sql = null;
    	try{
    		Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		sqlStmt=conn.createStatement();
    		sql = "insert into user_inf (user_id) values ("+ID+")";
    		sqlStmt.executeUpdate(sql);
    	}
    	catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public boolean modifyUser_Inf(int id,int column,String modify) throws SQLException{
 	   try{
 		   Class.forName(driver); 
 		   conn=DriverManager.getConnection(url, user, password);
 		   sqlStmt=conn.createStatement();
 		   String sql1 ="update user_inf set ";
 		   String sql2 = "='"+modify+ "' where user_id="+id+";";
 		   String sql;
 		   switch(column){
 		   case 2:{
 			   sql = sql1+"city"+sql2;
 			   System.out.println(sql);
 			   sqlStmt.executeUpdate(sql);
 			   return true;
 		   }
 		   case 3:{
 			   sql = sql1+"profile"+sql2;
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
    
    public boolean modifyUser(String name,int id,String SENDER){//修改USER表
	   	 try {
	   		 Class.forName(driver); 
	 		 conn=DriverManager.getConnection(url, user, password);
	 		 sqlStmt=conn.createStatement();
		   	 String sql = "update USER set USER_NAME='"+name+"',SENDER='"+SENDER+"' where  USER_ID="+id+";";
		   	 sqlStmt=conn.createStatement();
		   	 sqlStmt.executeUpdate(sql);
		   	 return true;
	   	 } catch (SQLException e) {
	   	 System.out.println(e.toString());
	   	 
	   	 } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	   	return false;
   	 }
    
   	 public boolean modifyUserInfo(int id,String CITY,String PROFILE){//修改USER_INF表
   	   	 try {
   	   	 String sql = "update USER_INF set CITY='"+CITY+"',PROFILE='"+PROFILE+"' where  USER_ID="+id+";";
   	   	 sqlStmt=conn.createStatement();
   	   	 sqlStmt.executeUpdate(sql);
   	   	 return true;
   	   	 } catch (SQLException e) {
   	   	 System.out.println(e.toString());
   	   	 return false;
   	   	 } 
       }
   	public void myClose() throws SQLException{

        conn.close();
    }
}

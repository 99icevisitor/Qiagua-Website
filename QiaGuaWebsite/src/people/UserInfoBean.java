package people;

import java.sql.*;

public class UserInfoBean {
	private String name;
	private String id;
    private String SENDER;
    private String CITY;
    private String PROFILE;
    private String MAIL;
	private String TELL;
    private String SMRZ;
    private String SID;
    private String REAL_NAME;
    private String RTIME;
    private String USER_IMG;
    private String BG_IMG = null;
    private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
    private String user="root";
    private String password="root";
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
    public String getPwd(){
    	return password;
    }
    public String getMail(){
    	return MAIL;
    }
    public String getTell(){
    	return TELL;
    }
    public String getSMRZ(){
    	return SMRZ;
    }
    public String getSid(){
    	return SID;
    }
    public String getReal_name(){
    	return REAL_NAME;
    }
    public String getRtime(){
    	return RTIME;
    }
    public String getUser_img(){
    	return USER_IMG;
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

    public void getUser(int user_id){
    	try {
   		 	Class.forName(driver);
   		 	conn = DriverManager.getConnection(url, user, password);
   		 	sqlStmt=conn.createStatement();
		 	String sql ="select * from user where user_id="+user_id;
		 	sqlRst=sqlStmt.executeQuery(sql);
		 	if(sqlRst.next()){
		 		this.id = String.valueOf(sqlRst.getInt(1));
		 		this.name = sqlRst.getString(2);
		 		this.password = sqlRst.getString(3);
		 		this.MAIL = sqlRst.getString(4);
		 		this.TELL = sqlRst.getString(5);
		 		this.SMRZ = sqlRst.getString(6);
		 		this.SID = sqlRst.getString(7);
		 		this.SENDER = sqlRst.getString(8);
		 		this.REAL_NAME = sqlRst.getString(9);
		 		this.RTIME = sqlRst.getString(10);
		 		this.USER_IMG = sqlRst.getString(11);
		 	}
   	      } 
	   	 catch (SQLException e) {
	   		  System.out.println(e.toString());
	   	     } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   	 }
    	
    public String getBG_IMG(int ID){
    	String bg_url = null;
    	try {
   		 	Class.forName(driver);
   		 	conn = DriverManager.getConnection(url, user, password);
   		 	sqlStmt=conn.createStatement();
		 	String sql ="select * from user_inf where user_id="+ID;
		 	sqlRst=sqlStmt.executeQuery(sql);
		 	if(sqlRst.next()){
		 		bg_url = sqlRst.getString("BG_IMG");
		 	}
   	      } 
	   	 catch (SQLException e) {
	   		  System.out.println(e.toString());
	   	     } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return bg_url;
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
    	    if(sqlRst.next()){
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
   	 public boolean existProfile(int id){
   		 boolean ok = false;
     	try{
     		Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		sqlStmt=conn.createStatement();
     		String sql = "select profile from user_inf where user_id="+id;
     		System.out.println(sql);
     		sqlRst = sqlStmt.executeQuery(sql);
     		System.out.println(sql+" is ok");
     		if(sqlRst.next()&&sqlRst.getString("profile")!=null&&(!sqlRst.getString("profile").equals(""))){
     			System.out.println(sqlRst.getString("profile")+"cunzai");
     			ok=true;
     		}
     		else{
     			System.out.println("UserinfoBean else!");
     		}
     	}catch (SQLException e) {
      	   	 System.out.println(e.toString());
       	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
     	return ok;
     }
   	 
   	 public String getUser_PROFILE(int id)throws SQLException{
   		 String sql = "select profile from user_inf where user_id="+id;
   		 sqlRst = sqlStmt.executeQuery(sql);
   		 String profile = null;
   		 if(sqlRst.next()){
   			profile = sqlRst.getString("profile");
   		 }
   		  return profile;
   	 }
   	public void myClose() throws SQLException{

        conn.close();
    }
}

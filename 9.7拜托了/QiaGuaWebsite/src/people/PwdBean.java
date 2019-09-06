package people;

import java.sql.*;
import java.io.*;

public class PwdBean {
  private String pw;
  private String newpw;
  private String newpw2;
  private String id;

    private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
    private String username="root";
    private String password="123456";
    private String driver="com.mysql.cj.jdbc.Driver";
    private Connection conn=null;
    private Statement sqlStmt=null;
    private ResultSet sqlRst=null;
    public void setpw(String pw){
      this.pw=pw;
        }
    public String getpw(){
      return pw;
        }
 
    public void setnewpw(String newpw){
      this.newpw=newpw;
        }
    public String getnewpw(){
      return newpw;
        }
    public void setid(String id){
      this.id=id;
        }
    public String getid(){
      return id;
        }
    public PwdBean() throws SQLException,ClassNotFoundException {
       try {
    	   Class.forName(driver);
    	   conn = DriverManager.getConnection(url, username, password);
    	   sqlStmt=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);
           } 
       catch (SQLException e) {
        System.out.println(e.toString());
           }
    }
    
    public int reviseUser(String pwd,String newpwd,int ID) throws SQLException{
          try{ 
        	  Class.forName(driver);
       	   	  conn = DriverManager.getConnection(url, username, password);
       	      sqlStmt=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);
        	  String sqlQuery="select pwd from user where USER_ID="+ID;
              sqlRst=sqlStmt.executeQuery(sqlQuery);
              if(sqlRst.next()){
 	              if(pwd.equals(sqlRst.getString("pwd"))){
 	            	//输入的旧密码与原密码一致       
 	            	  if(!((newpwd).equals(pwd))){
                       //如果新密码与原密码不同，执行更新密码操作 -----------1
 	            		  String sql = "update USER set PWD='"+newpwd+"' where USER_ID="+ID;
                          sqlStmt=conn.createStatement();
                          sqlStmt.executeUpdate(sql);
                          sql = "update login set PWD='"+newpwd+"' where USER_ID ="+ID;
                          sqlStmt=conn.createStatement();
                          sqlStmt.executeUpdate(sql);
                          System.out.println("--更新密码--"); 
                          return 1;
                      }
                      else{//不用修改密码                                        ------------2
                          System.out.println("--密码没有改动--");  
                          return 2;
                      }     
                 }
                 else{ //                                     -------------3
                	 System.out.println("--原密码错误！--"); 
                	 return 3;
                 }
              }
              else{
            	  return 0;
              }
          }
          catch(Exception e){
        	  e.printStackTrace();
        	  return 0;
          }
          finally{
          	if(sqlRst!=null)sqlRst.close();
          	if(sqlStmt!=null)sqlStmt.close();
          	if(conn!=null)conn.close();
          }
     }
    
    
    
    
  public void myClose() throws SQLException{
        conn.close();
      }
  
}
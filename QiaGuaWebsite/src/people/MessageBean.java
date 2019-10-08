package people;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class MessageBean {
	private int message_id;
	private int send_id;
	private int resv_id;
	private String content;
	private String send_time;
	private boolean aread;
	private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
    private String username="root";
    private String password="root";
    private Connection conn=null;
    private Statement sqlStmt=null;
    private ResultSet sqlRst=null;
    public String driver ="com.mysql.cj.jdbc.Driver";
    public MessageBean()throws SQLException, ClassNotFoundException{
    	try {
	   		 Class.forName(driver);
	         conn = DriverManager.getConnection(url,username,password);
	         sqlStmt=conn.createStatement();	                
	            } catch (SQLException e) {
	            	System.out.println("MessageBean失败");
	            	System.out.println(e.toString());
	            }
    }
    public MessageBean(int message_id,int send_id,int resv_id,String content,String send_time){
    	this.message_id = message_id;
    	this.send_id = send_id;
    	this.resv_id = resv_id;
    	this.content = content;
    	this.send_time = send_time;
    }
    public int getMessage_id(){
    	return message_id;
    }
    public int getSend_id(){
    	return send_id;
    }
    public int getResv_id(){
    	return resv_id;
    }
    public String getContent(){
    	return content;
    }
    public String getSend_time(){
    	return send_time;
    }
    public boolean getAread(){
    	return aread;
    }
    public boolean setMessage(int send_id,String resv_id,String content)throws SQLException{
    	try{
    		Date d = new Date();
        	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	String time = df.format(d);
        	String sql = "insert into message (SEND_ID,RESV_ID,SEND_TIME,CONTENT)value("+send_id+","+resv_id+",'"+time+"','"+content+"');";
            sqlStmt.executeUpdate(sql);
            return true;
    	} catch (SQLException e) {
        	System.out.println(e.toString());
        	return false;
        }   	
    }
    public boolean delMessage(int user_id,String other_id)throws SQLException{
    	try{
    		String sql = "delete from message where (send_id="+user_id+" and resv_id="+other_id+")or(send_id="+other_id+" and resv_id="+user_id+");";
    		System.out.println(sql);
    		sqlStmt.executeUpdate(sql);
    		return true;
    	}catch (SQLException e) {
        	System.out.println(e.toString());
        	return false;
        }   
    }
    public boolean setRead(int user_id,int message_id)throws SQLException{
    	try{
    		String sql = "select resv_id from message where message_id="+message_id;
    		System.out.println(sql);
    		sqlRst = sqlStmt.executeQuery(sql);
    		if(sqlRst.getInt("resv_id")==user_id){
    			sql = "update message set aread=true;";
    			sqlStmt.executeUpdate(sql);
    			return true;
    		}
    		return false;
    	}catch (SQLException e) {
        	System.out.println(e.toString());
        	return false;
        }  
    }
    public List<MessageBean> getAllMessage(int user_id)throws SQLException{
    	String sql = "select * from message where send_id="+user_id+" or resv_id="+user_id+" order by send_time desc;";
    	System.out.println(sql);
    	sqlRst = sqlStmt.executeQuery(sql);
    	List<MessageBean> list = new ArrayList<MessageBean>();
    	while(sqlRst.next()){
    		MessageBean mes = new MessageBean(sqlRst.getInt("message_id"),sqlRst.getInt("send_id"),sqlRst.getInt("resv_id"),sqlRst.getString("content"),sqlRst.getString("send_time"));
    		list.add(mes);
    		System.out.println(sqlRst.getInt("message_id"));
    	}
    	return list;
    }
    public List<MessageBean> getUnRead(int user_id)throws SQLException{
    		String sql = "select * from message where resv_id="+user_id+" and aread = false order by send_time desc;";
        	System.out.println(sql);
        	sqlRst = sqlStmt.executeQuery(sql);
        	List<MessageBean> list = new ArrayList<MessageBean>();
        	while(sqlRst.next()){
        		MessageBean mes = new MessageBean(sqlRst.getInt("message_id"),sqlRst.getInt("send_id"),sqlRst.getInt("resv_id"),sqlRst.getString("content"),sqlRst.getString("send_time"));
        		list.add(mes);
        	}
        	return list;  	
    }
    public int getOther_id(int user_id,int message_id)throws SQLException{
    	int id = -2;
    	try{
    		Class.forName(driver);
	        conn = DriverManager.getConnection(url,username,password);
	        sqlStmt=conn.createStatement();	  
    		String sql = "select * from message where (send_id="+user_id+" or resv_id="+user_id+") and message_id="+message_id+";";
        	System.out.println(sql);
        	ResultSet sqlRst = sqlStmt.executeQuery(sql); 
        	if(sqlRst.next()){
        		System.out.println("有值");
        		if(sqlRst.getInt("send_id")==user_id)
        			id = sqlRst.getInt("resv_id");   			
        		else
        			id = sqlRst.getInt("send_id");
        	}
        		return id;
    	}catch (SQLException e) {
    		System.out.println("方法");
        	System.out.println(e.toString());
        	return -1;
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}  
    	
    }
    public boolean isAread(int user_id,int message_id)throws SQLException{
    	String sql = "select * from message where message_id="+message_id;
    	System.out.println(sql);
    	sqlRst = sqlStmt.executeQuery(sql);
    	if(sqlRst.getInt("resv_id")==user_id&&!sqlRst.getBoolean("aread"))
    		return false;
    	else
    		return true;
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

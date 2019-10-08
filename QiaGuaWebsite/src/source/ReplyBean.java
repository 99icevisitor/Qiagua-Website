package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;
import source.CommentBean;
public class ReplyBean {

	private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
    private String user="root";
    private String password="root";
    private String driver="com.mysql.cj.jdbc.Driver";
    private Connection conn=null;
    private Statement stmt=null;
    private ResultSet rs=null;
    int SOURCE_ID;
    int COMMENT_ID;
    int REPLY_ID;
    int to_id;
    public ReplyBean(){
    	
    }
    public ReplyBean(int source_id,int floor,int user_id,int refer_id){
    	SOURCE_ID = source_id;
    	COMMENT_ID = floor;
    	REPLY_ID = user_id;
    	to_id = refer_id;
    }
    public void addReply(int source_id,int floor,int user_id,int to_id){
    	try{
    		Class.forName(driver);
		    conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
    		String sql = "insert into reply values("+source_id+","+floor+","+user_id+","+to_id+");";
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
}

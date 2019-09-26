package people;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;
public class FollowBean {
	private String use_id; 
	private String url="jdbc:mysql://localhost:3306/qiagua?serverTimezone=UTC";
    private String username="root";
    private String password="123456";
    private Connection conn=null;
    private Statement sqlStmt=null;
    private ResultSet sqlRst=null;
    public String driver ="com.mysql.cj.jdbc.Driver";
    public FollowBean()throws SQLException, ClassNotFoundException{
    	try {
	   		 Class.forName(driver);
	         conn = DriverManager.getConnection(url,username,password);
	         sqlStmt=conn.createStatement();	                
	            } catch (SQLException e) {
	            	System.out.println("Followbean失败");
	            	System.out.println(e.toString());
	            }
    }
    public int fan_NUM(int user_id) throws SQLException{
    	try{
    		String sql = "select count(fan_id) from schv group by idol_id having idol_id="+user_id;
    		sqlRst = sqlStmt.executeQuery(sql);
    		int fN = sqlRst.getInt("count(fan_id)");
    		return fN;
    	}catch(SQLException e) {
        	System.out.println(e.toString());
        	return -1;
        }
    }
    public int idol_NUM(int user_id)throws SQLException{
    	try{
    		String sql = "select count(idol_id) from schv group by fan_id having fan_id="+user_id;
    		sqlRst = sqlStmt.executeQuery(sql);
    		int iN = sqlRst.getInt("count(idol_id)");
    		return iN;
    	}catch(SQLException e) {
        	System.out.println(e.toString());
        	return -1;
        }
    }
    public List<Integer> getFan_IDs(int user_id)throws SQLException{
    		String sql = "select fan_id from schv where idol_id="+user_id;
    		sqlRst = sqlStmt.executeQuery(sql);
    		List list = new ArrayList<Integer>();
    		while(sqlRst.next()){
    			list.add(sqlRst.getInt("fan_id"));
    		}    			
            return list;
    }
    public List<Integer> getDOL_IDs(int user_id)throws SQLException{
    	String sql = "select idol_id from schv where fan_id="+user_id;
    	sqlRst = sqlStmt.executeQuery(sql);
		List list = new ArrayList<Integer>();
		while(sqlRst.next()){
			list.add(sqlRst.getInt("idol_id"));
		}    			
        return list;
    }
    
    public boolean isFan(int fan_id,String idol_id)throws SQLException{
    	try{
    		String sql = "select idol_id from schv where fan_id="+fan_id+";";
    		sqlRst = sqlStmt.executeQuery(sql);
    		System.out.println(sql);
    		while(sqlRst.next()){
    			if(idol_id.equals(sqlRst.getString("idol_id"))){
    				System.out.println("取消关注");
    				return true;
    			}
    		}
    		return false;
    	}catch(SQLException e) {
        	System.out.println(e.toString());
        	System.out.println("出错");
        	return false;
        }
    }
    public boolean setNOTFan(int user_id,String idol_id)throws SQLException{
    	try{
    		Date d = new Date();
    		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(d);
    		String sql = "insert into schv values("+user_id+","+idol_id+",'"+date+"');";
    		System.out.println(sql);
    		sqlStmt.executeUpdate(sql);
    		System.out.println("关注");
    		return true;
    	}catch(SQLException e) {
        	System.out.println(e.toString());
        	return false;
        }
    }
    public boolean setFan(int user_id,String idol_id)throws SQLException{
    	try{
    		String sql = "delete from schv where fan_id="+user_id+" and idol_id="+idol_id;
    		System.out.println(sql);
    		sqlStmt.executeUpdate(sql);
    		return true;
    	}
    	catch(SQLException e) {
        	System.out.println(e.toString());
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

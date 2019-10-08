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
    private String password="root";
    private Connection conn=null;
    private Statement sqlStmt=null;
    private ResultSet sqlRst=null;
    public String driver ="com.mysql.cj.jdbc.Driver";
    public FollowBean(){
    	
    }

    public int fan_NUM(int user_id) throws SQLException{
    	int fN = 0;
    	try{
    		Class.forName(driver);
	        conn = DriverManager.getConnection(url,username,password);
	        sqlStmt=conn.createStatement();
    		String sql = "select count(fan_id) from schv group by idol_id having idol_id="+user_id;
    		System.out.println(sql);
    		sqlRst = sqlStmt.executeQuery(sql);
    		if(sqlRst.next())
    			fN = sqlRst.getInt("count(fan_id)");
    	}catch(SQLException e) {
        	System.out.println(e.toString());
        	return -1;
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return fN;
    }
    public int idol_NUM(int user_id)throws SQLException{
    	int iN = 0;
    	try{
    		Class.forName(driver);
	        conn = DriverManager.getConnection(url,username,password);
	        sqlStmt=conn.createStatement();
    		String sql = "select count(idol_id) from schv group by fan_id having fan_id="+user_id;
    		System.out.println(sql);
    		sqlRst = sqlStmt.executeQuery(sql);
    		if(sqlRst.next())
    		 iN = sqlRst.getInt("count(idol_id)");
    		return iN;
    	}catch(SQLException e) {
        	System.out.println(e.toString());
        	return -1;
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
    }
    public List<Integer> getFan_IDs(int user_id)throws SQLException, ClassNotFoundException{
    	 Class.forName(driver);
         conn = DriverManager.getConnection(url,username,password);
         sqlStmt=conn.createStatement();
    		String sql = "select fan_id from schv where idol_id="+user_id;
    		System.out.println(sql);
    		sqlRst = sqlStmt.executeQuery(sql);
    		List list = new ArrayList<Integer>();
    		while(sqlRst.next()){
    			list.add(sqlRst.getInt("fan_id"));
    		}    			
            return list;
    }
    public List<Integer> getIdol_IDs(int user_id){
    	List list = new ArrayList<Integer>();
    	try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,username,password);
	        sqlStmt=conn.createStatement();
	    	String sql = "select idol_id from schv where fan_id="+user_id;
	    	System.out.println(sql);
	    	sqlRst = sqlStmt.executeQuery(sql);
			
			while(sqlRst.next()){
				list.add(sqlRst.getInt("idol_id"));
			}    			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return list;
    }
    
    public boolean isFan(int fan_id,int idol_id){
    	try{
    		Class.forName(driver);
	        conn = DriverManager.getConnection(url,username,password);
	        sqlStmt=conn.createStatement();
    		String sql = "select idol_id from schv where fan_id="+fan_id+";";
    		sqlRst = sqlStmt.executeQuery(sql);
    		System.out.println(sql);
    		while(sqlRst.next()){
    			if(idol_id==sqlRst.getInt("IDOL_ID")){
    				System.out.println(sqlRst.getString("idol_id")+"取消关注");
    				return true;
    			}
    		}
    		return false;
    	}catch(SQLException e) {
        	System.out.println(e.toString());
        	System.out.println("出错");
        	return false;
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
    }
    public boolean setNOTFan(int user_id,int idol_id){//在不是粉丝的时候关注
    	try{
    		Class.forName(driver);
	        conn = DriverManager.getConnection(url,username,password);
	        sqlStmt=conn.createStatement();
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
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
    }
    public boolean setFan(int user_id,int idol_id){//在是粉丝的时候取消关注
    	try{
    		Class.forName(driver);
	        conn = DriverManager.getConnection(url,username,password);
	        sqlStmt=conn.createStatement();
    		String sql = "delete from schv where fan_id="+user_id+" and idol_id="+idol_id;
    		System.out.println(sql);
    		sqlStmt.executeUpdate(sql);
    		return true;
    	}
    	catch(SQLException e) {
        	System.out.println(e.toString());
        	return false;
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

package people;

import java.util.*;
import java.sql.*;
import people.DB;
public class AllUserBean {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int ID;
	String USER_NAME = null;
	String STATE = null;
	String SMRZ = null;
	String SID = null;
	String NAME = null;
	String SENDER = null;
	
	public AllUserBean(){
		
	}
	public AllUserBean(int userID,String userName,String userState,String userSmrz,String userSID,String name,String sender){
		ID = userID;
		USER_NAME = userName;
		STATE = userState;
		SMRZ = userSmrz;
		SID = userSID;
		NAME = name;
		SENDER = sender;
	}
	public List<AllUserBean> getList(){
		List<AllUserBean> list = new ArrayList<>();
		DB db = new DB();
		conn = db.getConn();
		//选出除管理员之外所有ID的相关信息
		String sql = "SELECT LOGIN.USER_ID, LOGIN.USER_NAME, LOGIN.STATE, USER.SMRZ, USER.SID, USER.NAME, USER.SENDER FROM LOGIN  left join USER ON LOGIN.user_id = USER.user_id having login.user_id>1";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				AllUserBean user = new AllUserBean(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public void updateUser(int ID){
		DB db = new DB();
		conn = db.getConn();
		String sql1="update LOGIN set STATE='已实名' where user_id="+ID;
		String sql2="update USER set SMRZ='1' where user_id="+ID;
		try{
			stmt = conn.createStatement();
			stmt.executeUpdate(sql1);
			System.out.println("--LOGIN已实名--");
			stmt.executeUpdate(sql2);
			System.out.println("--USER已认证--");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public void deleteUser(int ID){
		DB db = new DB();
		conn = db.getConn();
		String sql1="delete from LOGIN where user_id="+ID;//暂时不能登陆，但是用户信息并没有完全删除
		try{
			stmt = conn.createStatement();
			stmt.executeUpdate(sql1);
			System.out.println("--LOGIN已除名--");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public int isUser(int ID){
		int value = 0;
		DB db = new DB();
		conn = db.getConn();
		String sql="select * from login where user_id="+ID;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				if(rs.getString("STATE").equals("未实名")){
					value = 1;
				}
				else if(rs.getString("STATE").equals("已实名")){
					value = 2;
				}
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return value;
	}
	public boolean fillSID(int ID){
		boolean value = false;
		DB db = new DB();
		conn = db.getConn();
		String sql="select SID from user where user_id="+ID;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				if(rs.getString(1)!=null){
					value=true;
				}
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return value;
	}
	public boolean fillNAME(int ID){
		boolean value = false;
		DB db = new DB();
		conn = db.getConn();
		String sql="select NAME from user where user_id="+ID;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				if(rs.getString(1)!=null && !rs.getString(1).equals("")){
					value=true;
				}
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return value;
	}
	public int fillSENDER(int ID){
		int value = 0;
		DB db = new DB();
		conn = db.getConn();
		String sql="select SENDER from user where user_id="+ID;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				if(rs.getString(1)!=null && !rs.getString(1).equals("")){
					if(rs.getString(1).equals("f")){
						value=1;
					}
					else if(rs.getString(1).equals("m")){
						value=2;
					}
				}
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return value;
	}
	public int isSMRZ(int ID){
		int value = 0;
		DB db = new DB();
		conn = db.getConn();
		String sql="select SMRZ from user where user_id="+ID;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				if(rs.getString(1).equals("0")){
					value = 1;
				}
				if(rs.getString(1).equals("1")){
					value = 2;
				}
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return value;
	}
	public int getID(){//1
		return ID;
	}
	public String getUSER_NAME(){//2
		return USER_NAME;
	}
	public String getSTATE(){//3
		return STATE;
	}
	public String getSMRZ(){//4
		return SMRZ;
	}
	public String getSID(){//5
		return SID;
	}
	public String getNAME(){//6
		return NAME;
	}
	public String getSENDER(){//7
		return SENDER;
	}
}

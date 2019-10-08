package source;

import java.util.*;
import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;

import source.AlbBean;
public class PicBean {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int PIC_ID;
	int USER_ID;
	String PIC_ADDR=null;
	String PIC_TIME=null;
	int PIC_ALBID;
	int FROM_ID = 0;
	String PIC_DES = null;
	private String driver="com.mysql.cj.jdbc.Driver";
    private String url="jdbc:mysql://localhost:3306/qiagua?characterEncoding=UTF-8&serverTimezone=UTC&use Unicode=true";
    private String user="root";
    private String password="root";
	
    public PicBean(){
		
	}
    public void setPic(int pic_id,int user_id,String pic_addr,String time,int alb_id,int from_id,String des){
    	PIC_ID = pic_id;
    	USER_ID = user_id;
    	PIC_ADDR = pic_addr;
    	PIC_TIME = time;
    	PIC_ALBID = alb_id;
    	FROM_ID = from_id;
    	PIC_DES = des;
    }
    public void savePic(String time,String pic_url,int user_id,int alb_id,int from_id,String des){
    	String sql="insert into pic values(0,"+user_id+",'"+pic_url+"','"+time+"',"+alb_id+","+from_id+",'"+des+"');";
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		stmt.executeUpdate(sql);
    		sql = "update alb set alb_sum=alb_sum+1 where alb_id="+alb_id;
    		stmt.executeUpdate(sql);
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public int createPic(String time,String pic_url,int user_id,int alb_id,String des){
    	int pic_id = 0;
    	String sql="insert into pic values(0,"+user_id+",'"+pic_url+"','"+time+"',"+alb_id+",0,'"+des+"');";
    	System.out.println(sql);
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		stmt.executeUpdate(sql);
    		sql = "update alb set alb_sum=alb_sum+1 where alb_id="+alb_id;
    		stmt.executeUpdate(sql);
    		sql = "select * from pic where pic_addr='"+url+"'";
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			pic_id=rs.getInt("pic_id");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return pic_id;
    }
    public int colPic(int user_id,int from_id,String pic_addr,int albid,String des){
    	Date date=new Date();
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");//-时间秒级
		String date1 = sdf.format(date);
    	int pic_id = 0;
    	String sql="insert into pic values(0,"+user_id+",'"+pic_addr+"','"+date1+"',"+albid+","+from_id+",'"+des+"');";
    	System.out.println(sql);
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		stmt.executeUpdate(sql);
    		sql = "update alb set alb_sum=alb_sum+1 where alb_id="+albid;
    		stmt.executeUpdate(sql);
    		System.out.println(sql);
    		sql = "select * from pic where pic_addr='"+url+"'";
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			pic_id=rs.getInt("pic_id");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return pic_id;
    }
    public boolean delColPic(int from_id){
    	String sql = "delete from pic where from_id="+from_id;
    	System.out.println(sql);
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		stmt.executeUpdate(sql);
    		return true;
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return false;
    }
    public boolean getPic(int pic_id){
    	boolean ok = false;
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from pic where pic_id="+pic_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			setPic(pic_id,rs.getInt(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getString(7));
    			ok = true;
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return ok;
    }
    public PicBean getOnePic(int alb_id){
    	PicBean pic = new PicBean();
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from pic where pic_albid="+alb_id;
    		System.out.println(sql);
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			pic.setPic(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getString(7));
    			System.out.println("YES out");
    		}
    		else{
    			System.out.println("NO out");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return pic;
    }
    public List<PicBean> getPics(int alb_id){
    	List<PicBean> pics = new ArrayList<>();
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from pic where pic_albid="+alb_id;
    		rs = stmt.executeQuery(sql);
    		while(rs.next()){
    			PicBean pic = new PicBean();
    			pic.setPic(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getString(7));
    			pics.add(pic);
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return pics;
    }
    public void deletePic(int pic_id){
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from pic where pic_id="+pic_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			int alb_id = rs.getInt("PIC_ALBID");
        		sql = "delete from pic where pic_id="+pic_id;
        		stmt.executeUpdate(sql);
        		sql = "update alb set alb_sum=alb_sum-1 where alb_id="+alb_id;
        		stmt.executeUpdate(sql);
        		sql = "delete from collection where svhc_id="+pic_id;
        		stmt.executeUpdate(sql);
        		sql = "delete from praise where source_id="+pic_id;
        		stmt.executeUpdate(sql);
        		sql = "delete from pic_label where pic_id="+pic_id;
        		stmt.executeUpdate(sql);
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public int getPic_id(){
    	return PIC_ID;
    }
    public int getUser_id(){
    	return USER_ID;
    }
    public int getUser_id(int pic_id){
    	int user_id = 0;
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from pic where pic_id="+pic_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			user_id = rs.getInt("user_id");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return user_id;
    }
    public String getPic_addr(){
		System.out.println("输出："+PIC_ADDR);
    	return PIC_ADDR;
    }
    public String getPic_addr(int pic_id){
    	String pic_addr = null;
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from pic where pic_id="+pic_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			pic_addr = rs.getString("PIC_ADDR");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return pic_addr;
    }
    public String getPic_time(){
    	return PIC_TIME;
    }
    public String getPic_time(int pic_id){
    	String time = "";
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from pic where pic_id="+pic_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			time = rs.getString("PIC_TIME");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return time;
    }
    public int getPic_albid(){
    	return PIC_ALBID;
    }
    public int getPic_albid(int pic_id){
    	int pic_albid = 0;
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from pic where pic_id="+pic_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			pic_albid = rs.getInt("PIC_ALBID");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return pic_albid;
    }
    public int getFrom_id(){
    	return FROM_ID;
    }
    public int getFrom_id(int pic_id){
    	int from_id = 0;
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from pic where pic_id="+pic_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			from_id = rs.getInt("from_id");
    			if(from_id==0){
    				from_id=rs.getInt("user_id");
    			}
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return from_id;
    }
    public String getDes(){
    	return PIC_DES;
    }
    public String getDes(int pic_id){
    	String des = null;
    	try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from pic where pic_id="+pic_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			des = rs.getString("PIC_DES");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return des;
    }
    
}

package source;
import java.util.*;
import java.sql.*;
import people.DB;
import people.AllUserBean;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import source.PicBean;
public class AlbBean {

    private String driver="com.mysql.cj.jdbc.Driver";
    private String url="jdbc:mysql://localhost:3306/qiagua?characterEncoding=UTF-8&serverTimezone=UTC&use Unicode=true";
    private String user="root";
    private String password="root";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int USER_AUTHOR;
	int ALB_ID=0;
	String ALB_TIME=null;
	String ALB_NAME=null;
	String ALB_DES=null;
	int ALB_SUM=0;
	
	public AlbBean(){
		
	}
	public AlbBean(int alb_id,int user_author,String time,String name,String des,int sum){
		ALB_ID = alb_id;
		USER_AUTHOR = user_author;
		ALB_TIME = time;
		ALB_NAME = name;
		ALB_DES = des;
		ALB_SUM = sum;
	}
	public int getOnePic(int alb_id){
		int pic_id = 0;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		rs = stmt.executeQuery("select max(pic_id)from pic where pic_albid="+alb_id);
    		if(rs.next()){
    			pic_id = rs.getInt(1);
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
	public List<Integer> getPics(int alb_id){
		List<Integer> pics = new ArrayList<>();
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		rs = stmt.executeQuery("select * from pic where pic_albid"+alb_id);
    		while(rs.next()){
    			Integer alb = rs.getInt(1);
    			pics.add(alb);
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
	public List<Integer> getAlbs(int user_id){
		List<Integer> albs = new ArrayList<>();
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		rs = stmt.executeQuery("select * from alb where user_author="+user_id);
    		while(rs.next()){
    			Integer alb = rs.getInt(1);
    			albs.add(alb);
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return albs;
	}
	public List<AlbBean> getAlbDetail(int user_id){
		List<AlbBean> albs = new ArrayList<>();
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		rs = stmt.executeQuery("select * from alb where user_author="+user_id);
    		while(rs.next()){
    			AlbBean alb = new AlbBean(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6));
    			albs.add(alb);
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return albs;
	}
	public void getAlb(int alb_id){
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		rs = stmt.executeQuery("select * from alb where alb_id="+alb_id);
    		if(rs.next()){
    			setAlbBean(rs.getInt(2),alb_id,rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6));
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void setAlbBean(int user_id,int alb_id,String time,String name,String des,int sum){
		USER_AUTHOR = user_id;
		ALB_ID = alb_id;
		ALB_TIME = time;
		ALB_NAME = name;
		ALB_DES = des;
		ALB_SUM = sum;
	}
	//闇�瑕佸湪鏈嶅姟鍣ㄤ笂鏂板缓鏂囦欢澶�
	public int createAlb(int user_id,String time,String name,String des){/*鍒涘缓鏂颁笓杈�*/
		int alb_id=0;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		stmt.executeUpdate("insert into alb values(0,"+user_id+",'"+time+"','"+name+"','"+des+"',0);");
    		String sql="select ALB_ID from alb where USER_AUTHOR="+user_id+" and ALB_TIME='"+time+"' and ALB_NAME='"+name+"';";
    		rs=stmt.executeQuery(sql);
    		if(rs.next()){
    			alb_id=rs.getInt("ALB_ID");
    			setAlbBean(user_id,alb_id,time,name,des,0);
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return alb_id;
	}
	public boolean updateAlb(int id,int type){/*鏇存柊涓撹緫琛ㄦ暟閲忓彉鍖� 1:+,2:-*/
		boolean ok=false;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);
    		stmt=conn.createStatement();
    		if(type==1){
    			stmt.executeUpdate("update alb set alb_sum=alb_sum+1 where alb_id="+id);
        		ok=true;
    		}
    		else if(type==2){
    			stmt.executeUpdate("update alb set alb_sum=alb_sum-1 where alb_id="+id);
        		ok=true;
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
	public boolean deleteAlb(int id){/*鍒犻櫎鏁翠釜涓撹緫*/
		boolean ok=false;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		stmt.executeUpdate("delete from alb where alb_id="+id);
        	ok=true;
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ok;
	}
	public int getUser_id(){
		return USER_AUTHOR; 
	}
	public int getAlb_id(){
		return ALB_ID; 
	}
	public String getAlb_time(){
		return ALB_TIME; 
	}
	public String getAlb_name(){
		return ALB_NAME; 
	}
	public String getAlb_des(){
		return ALB_DES; 
	}
	public int getAlb_sum(){
		return ALB_SUM; 
	}
}

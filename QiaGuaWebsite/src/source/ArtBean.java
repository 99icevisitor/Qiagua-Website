package source;
import java.util.*;
import java.sql.*;
import people.DB;
import people.AllUserBean;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import source.*;
public class ArtBean {

	private String driver="com.mysql.cj.jdbc.Driver";
    private String url="jdbc:mysql://localhost:3306/qiagua?characterEncoding=UTF-8&serverTimezone=UTC&use Unicode=true";
    private String user="root";
    private String password="root";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int ART_ID;
	int ART_AUTHOR;
	String ART_TITLE=null;
	String ART_TIME=null;
	String ART_PIC_URL=null;
	String ART_CONTENT=null;
	int ART_STATE=0;
	
	public int getArt_id(){
		return ART_ID;
	}
	public String getArt_title(){
		return ART_TITLE;
	}
	public int getArt_author(){
		return ART_AUTHOR;
	}
	public String getArt_time(){
		return ART_TIME;
	}
	public String getArt_pic_url(){
		return ART_PIC_URL;
	}
	public String getArt_content(){
		return ART_CONTENT;
	}
	public int getArt_state(){
		return ART_STATE;
	}
	public ArtBean(){
		
	}
	public ArtBean(int art_id){
		ART_ID=art_id;
	}
	public void setContent(String content){
		ART_CONTENT = content;
	}
	public ArtBean(int art_id,int user_id,String title,String time,String pic_url,String content,int state){
		ART_ID = art_id;
		ART_AUTHOR = user_id;
		ART_TITLE = title;
		ART_TIME = time;
		ART_PIC_URL = pic_url;
		ART_CONTENT = content;
		ART_STATE = state;
	}
	public void getArt(int art_id){
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql="select * from art where art_id="+art_id;
    		System.out.println(sql);
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			this.ART_ID=rs.getInt(1);
    			this.ART_AUTHOR=rs.getInt(2);
    			this.ART_TITLE=rs.getString(3);
    			this.ART_TIME = rs.getString(4);
    			this.ART_PIC_URL = rs.getString(5);
    			this.ART_CONTENT = rs.getString(6);
    			this.ART_STATE = rs.getInt(7);
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getDrafts(int user_id){
		int num = 0;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql="select count(*) as number from art where art_author="+user_id+" and ART_STATE=0";
    		System.out.println(sql);
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			num = rs.getInt("number");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	public int getOk(int user_id){
		int num = 0;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql="select count(*) as number from art where art_author="+user_id+" and ART_STATE=1";
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			num = rs.getInt("number");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	public int getArts(int user_id){
		int num = 0;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql="select count(*) as number from art where art_author="+user_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			num = rs.getInt("number");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
	public List<ArtBean> getArts_0(int user_id){
		List<ArtBean> list = new ArrayList<>();
		DB db = new DB();
		conn = db.getConn();
		//选出所有的草稿相关信息
		String sql = "SELECT * from art where ART_AUTHOR="+user_id+" and ART_STATE=0";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				ArtBean user = new ArtBean(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<ArtBean> getArts_1(int user_id){
		List<ArtBean> list = new ArrayList<>();
		DB db = new DB();
		conn = db.getConn();
		//选出所有的已发表文章相关信息
		String sql = "SELECT * from art where ART_AUTHOR="+user_id+" and ART_STATE=1";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				ArtBean user = new ArtBean(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<ArtBean> getArts_2(int user_id){
		List<ArtBean> list = new ArrayList<>();
		DB db = new DB();
		conn = db.getConn();
		//选出所有的文章相关信息
		String sql = "SELECT * from art where ART_AUTHOR="+user_id;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				ArtBean user = new ArtBean(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	} 
	//文章对当前浏览者是否隐蔽
	public boolean isBlock(int art_id,int user_id){
		boolean ok = false;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql="select * from art where ART_ID="+art_id+" and ART_STATE=0 and ART_AUTHOR ="+user_id;
    		rs = stmt.executeQuery(sql);
    		if(!rs.next()){
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
	//文章对于当前浏览者是否可操作
	public boolean isManager(int art_id,int user_id){
		boolean ok = false;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql="select * from art where ART_ID="+art_id+" and ART_AUTHOR ="+user_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
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
	//查询文章状态
	public boolean isPoster(int art_id){
		boolean ok = false;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql="select * from art where ART_ID="+art_id+" and ART_STATE=1";
    		rs = stmt.executeQuery(sql);
    		if(!rs.next()){
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
	//查询文章收藏数
	public int getCollection(int art_id){
		int sum = 0;
		try {
			CollectBean coll = new CollectBean();
			sum = coll.getCol_Num(art_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sum;
		
	}
	//查询文章点赞数
	public int getPraise(int art_id){
		int sum = 0;
		try {
			ThumbBean praise = new ThumbBean();
			sum = praise.getThumb_Num(art_id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sum;
		
	}
	//若当前文章ID为0，表示新建文章，检查是否重复
	public boolean isValid(int user_id,String title){
		boolean ok=false;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql="select * from art where ART_AUTHOR="+user_id+" and ART_TITLE='"+title+"'";
    		rs = stmt.executeQuery(sql);
    		if(!rs.next()){
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
	//按“保存”按钮：先检查是否已新建：未新建，则新建，状态为0，返回文章ID；已新建，跳到文章修改方法
	//按“发布”按钮，先检查是否已建立；
	//若未建立，检查是否重名：若无重名，则新建保存，有重名提示用户修改；
	//若已经建立，更新修改内容，更改文章属性
	//新建文章
	//保存修改文章时，检查是否和其他文章重复
	public boolean isValid(int user_id,int art_id,String title){
		boolean ok=false;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql="select * from art where ART_AUTHOR="+user_id+" and ART_TITLE='"+title+"' and ART_ID<>"+art_id;
    		rs = stmt.executeQuery(sql);
    		if(!rs.next()){
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
	public int AddArt(int user_id,String title,String time,String content){
		int art_id=0;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "insert into art (ART_ID,ART_AUTHOR,ART_TITLE,ART_TIME,ART_CONTENT,ART_STATE)"
    				+ "values(0,"+user_id+",'"+title+"','"+time+"','"+content+"',0);";
    		System.out.println(sql);
    		stmt.executeUpdate(sql);
    		sql="select * from art where ART_AUTHOR="+user_id+" and ART_TITLE='"+title+"'";
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			art_id = rs.getInt("ART_ID");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return art_id;
	}
	public int AddArt(int user_id,String title,String time,String pic_url,String content){
		int art_id=0;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "insert into art values(0,"+user_id+",'"+title+"','"+time+"','"+pic_url+"','"+content+"',0);";
    		System.out.println(sql);
    		stmt.executeUpdate(sql);
    		sql="select * from art where ART_AUTHOR="+user_id+" and ART_TITLE='"+title+"'";
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			art_id = rs.getInt("ART_ID");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return art_id;
	}
	public boolean AddArtImg(int art_id,String pic_url){
		boolean ok = false;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "update art set ART_PIC_URL="+pic_url+" where ART_ID="+art_id;
    		System.out.println(sql);
    		stmt.executeUpdate(sql);
    		
    		if(rs.next()){
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
	//已经新建的情况下，修改文章(标题、图片、内容、时间)
	public void changeArt(int art_id,String content,String title,String time){
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "update art set ART_TITLE='"+title+"', ART_TIME= '"+time+"',ART_CONTENT='"+
    				content+"' where ART_ID="+art_id;
    		System.out.println(sql);
    		stmt.executeUpdate(sql);
    		if(rs.next()){
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void ChangeArt(int art_id,String content,String pic_url,String title,String time){
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "update art set ART_TITLE='"+title+"', ART_TIME= '"+time+"',ART_PIC_URL='"+pic_url+"',ART_CONTENT='"+
    				content+"' where ART_ID="+art_id;
    		System.out.println(sql);
    		stmt.executeUpdate(sql);
    		if(rs.next()){
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//发表文章最后一步——更改文章状态
	public boolean PosterArt(int art_id){
		boolean ok=false;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "update art set ART_STATE=1 where ART_ID="+art_id;
    		System.out.println(sql);
    		stmt.executeUpdate(sql);
    		if(rs.next()){
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
	//查询和修改时，都需要获取文章的标题、图片、内容和时间
	//标题
	public int getArtId(){
		return ART_ID;
	}
	public String getArtTitle(){
		return ART_TITLE;
	}
	public String getArtTitle(int art_id){
		String art_title=null;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from art where ART_ID="+art_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			art_title = rs.getString("ART_TITLE");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return art_title;
	}
	//图片
	public String getArtPicUrl(){
		return ART_PIC_URL;
	}
	public String getArtPicUrl(int art_id){
		String art_pic_url=null;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from art where ART_ID="+art_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			art_pic_url = rs.getString("ART_PIC_URL");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return art_pic_url;
	}
	//内容
	public String getArtContent(){
		return ART_CONTENT;
	}
	public String getArtContent(int art_id){
		String art_content=null;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from art where ART_ID="+art_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			art_content = rs.getString("ART_CONTENT");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return art_content;
	}
	//时间
	public String getArtTime(){
		return ART_TIME;
	}
	public String getArtTime(int art_id){
		String time=null;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from art where ART_ID="+art_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			time = rs.getString("ART_TIME");
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
	//获取文章作者
	public int getArtAuthor(){
		return ART_AUTHOR;
	}
	public int getArtAuthor(int art_id){
		int author=0;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "select * from art where ART_ID="+art_id;
    		rs = stmt.executeQuery(sql);
    		if(rs.next()){
    			author = rs.getInt("ART_AUTHOR");
    		}
		}
		catch(SQLException e){
    		System.out.println(e.toString());
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return author;
	}
	//文章删除后，数据库里一起删除
	public boolean DeleteArt(int user_id,int art_id){
		boolean ok = false;
		try{
			Class.forName(driver);
    		conn=DriverManager.getConnection(url, user, password);	
    		stmt=conn.createStatement();
    		String sql = "delete from art where ART_AUTHOR="+user_id+" and ART_ID="+art_id;
    		System.out.println(sql);
    		stmt.executeUpdate(sql);
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
}

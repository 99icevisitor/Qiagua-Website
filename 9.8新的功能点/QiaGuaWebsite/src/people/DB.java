package people;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	private String name="root";
	private String pwd="123456";
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/qiagua?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	public DB(){
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,name,pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public Connection getConn(){
		return this.conn;
	}
}

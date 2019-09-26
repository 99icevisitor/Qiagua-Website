package people;

import java.sql.*;
import java.io.*;

public class AdministratorBean {
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
    
    
    
}


package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
	

Connection con;
	public Connection getConnection(){
		try {
			//Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","admin");
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return con;
	}

}

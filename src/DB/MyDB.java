package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyDB {

	public Connection getConnection() throws Exception{
		String url= "jdbc:sqlserver://HoangLong;databaseName=Unify;user=sa;password=123";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		return DriverManager.getConnection(url); // sql Authention
	}

	
	
}

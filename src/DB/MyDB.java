package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyDB {

	public Connection getConnection() throws Exception{
		String url= "jdbc:sqlserver://localhost:1433;databaseName=Uni2;user=sa;password=reallyStrongPwd123";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url); // sql Authention
	}
}

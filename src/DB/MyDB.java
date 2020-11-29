package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyDB {

	public Connection getConnection() throws Exception{
<<<<<<< HEAD
		// BLACPINK IN YOUR AREA
		//
		//"jdbc:sqlserver:SERVER-NAME;databaseName=Unify;user=USERNAME;password=PASSWORD";
=======
>>>>>>> be5f72e (sua het)
		String url= "jdbc:sqlserver://LAPTOP-5TF2OMA3\\KIET01;databaseName=Unify;user=admin;password=1234";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url); // sql Authention
	}
}

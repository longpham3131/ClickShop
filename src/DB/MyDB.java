package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyDB {

	public Connection getConnection() throws Exception{
<<<<<<< HEAD
		String url= "jdbc:sqlserver://localhost:1433;databaseName=Uni2;user=sa;password=123";
=======
		String url= "jdbc:sqlserver://LAPTOP-5TF2OMA3\\KIET01;databaseName=Uni;user=admin;password=1234";
>>>>>>> 4287a170f7f70447378f8bbcccb55459d0b07a6e
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		return DriverManager.getConnection(url); // sql Authention
	}

<<<<<<< HEAD
	// Dung xoa cua tao -----   "jdbc:sqlserver://LAPTOP-5TF2OMA3\\KIET01;user=admin;password=1234";
=======
	
	// Dung xoa cua tao -----   "jdbc:sqlserver://LAPTOP-5TF2OMA3\\KIET01;databaseName=Unify;user=admin;password=1234";
>>>>>>> 4287a170f7f70447378f8bbcccb55459d0b07a6e
	//của kha
//		String url= "jdbc:sqlserver://localhost:1433;databaseName=Unify;user=sa;password=reallyStrongPwd123";
//		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		return DriverManager.getConnection(url); // sql Authention
	
}

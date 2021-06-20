package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDB {

	public Connection getConnection() throws Exception{
		try {
			String dbURL = "jdbc:sqlserver://DESKTOP-EC1TT8T:1433;database=ClickShopV3;user=sa;password=123";

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(dbURL);
			if (conn != null) {
				return conn;
			}

		} catch (SQLException ex) {
			System.err.println("Cannot connect database, " + ex);
		}

		return null;
	}
}

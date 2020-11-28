package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.model.Account;

import DB.MyDB;

// // query here <
public class LoginDAO {
	Connection conn = null;  // open connect to sql server
	PreparedStatement ps = null; // send query from ide to sqlserver
	ResultSet rs = null;  
	
	public boolean checkRole(String email, String role)
	{
		try {
			String query= "select * from AccountRole where Email='"+email+"' and Role='"+role+"'";		
			conn = new  MyDB().getConnection(); 
			ps = conn.prepareStatement(query);			
			rs = ps.executeQuery();	
			while(rs.next())
			{
				return true;
			}
			} catch (Exception e) { System.out.println(e);
		}
		return false;
	}
	public Account checkLogin(String email, String pass)
	{
		try {
			String query= "select * from Account where Email=? and Password=?";
			
			conn = new  MyDB().getConnection(); // sai o day
			ps = conn.prepareStatement(query);			
			ps.setString(1, email);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				Account a = new Account(rs.getString(1), rs.getString(2));
				return a;
			}
			} catch (Exception e) { System.out.println(e);
		}
		return null;
	}
	
}

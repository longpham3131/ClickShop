package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DB.MyDB;
import com.model.Article;
import com.model.Article1;
import com.model.OrderList;

public class queryDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// ------------------ ACCOUNT ---------------//
	
	public boolean insertAccount(String role, String email, String pass, String img, String firstName, String lastName,
			String phone, String address, String gender, String dateBirth, String dateCreared, boolean isAvailable) {
		Connection conn1 = null, conn2 = null;
		PreparedStatement ps1 = null, ps2 = null;
		ResultSet rs = null;
		try {
			String query = "insert into Account values('" + email + "','" + pass + "','" + img + "','" + firstName
					+ "','" + lastName + "','" + phone + "','" + address + "' ,'" + gender + "','" + dateBirth + "' ,'"
					+ dateCreared + "','" + isAvailable + "')";
			System.out.println(query);
			conn1 = new MyDB().getConnection();
			ps1 = conn1.prepareStatement(query);
			ps1.executeUpdate();

			String query2 = "insert into AccountRole values('" + email + "','" + role + "')";
			conn2 = new MyDB().getConnection();
			System.out.println(query2);
			ps2 = conn2.prepareStatement(query2);
			ps2.executeUpdate();

			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public boolean deleteAccount(String email) {
		try { // delete Role truoc, vi no co khoa ngoai
			String query2 = "delete from AccountRole where email='" + email + "'";
			conn = new MyDB().getConnection();
			System.out.println(query2);
			ps = conn.prepareStatement(query2);
			ps.executeUpdate();

			String query = "delete from Account where email='" + email + "'";
			conn = new MyDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();

			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public boolean updateAccount(String role, String email, String pass, String img, String firstName, String lastName,
			String phone, String address, String gender, String dateBirth, String dateCreared, boolean isAvailable) {
		Connection conn1 = null, conn2 = null;
		PreparedStatement ps1 = null, ps2 = null;
		ResultSet rs = null;
		try {
			String query = "update Account" + " set Password='" + pass + "', ImageLink='" + img + "',FirstName='"
					+ firstName + "',LastName='" + lastName + "',Phone='" + phone + "',Address='" + address
					+ "' ,Gender='" + gender + "',DayOfBirth='" + dateBirth + "' , CreatedDate='" + dateCreared
					+ "',isAvailable='" + isAvailable + "'" + " WHERE Email='" + email + "'";
			System.out.println(query);
			conn1 = new MyDB().getConnection();
			ps1 = conn1.prepareStatement(query);
			ps1.executeUpdate();

//			String query2 = "update AccountRole set Role='" + role + "'"
//					+ " Where Email='" + email + "'";
//			conn2 = new MyDB().getConnection();
//			System.out.println(query2);
//			ps2 = conn2.prepareStatement(query2);
//			ps2.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public boolean accountExists(String email) {
		String query = "select * from Account where Email=?";
		try {
			conn = new MyDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();

			if (rs.next()) {
				return true; // co ton tai email nay trong dbo.Account
			}
			return false;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public ResultSet selectAllAccount() {
		String query = "select * from Account,AccountRole  where Account.Email=AccountRole.Email";
		try { // Account.*, AccountRole.Role where Account.Email=AccountRole.Email
			conn = new MyDB().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	} // k dung nua

	public int totalAccount() {
		String query = "select count(*) from Account";
		try {
			conn = new MyDB().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			int total = rs.getInt(1);
			return total;
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	/// k dung nua,
	public int getNumberPage() {
		String query = "select count(*) from Account";
		try {
			conn = new MyDB().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				int total = rs.getInt(1);
				int countPage = total / 20; // moi trang 20 hng;
				if (total % 20 != 0)
					countPage++;
				return countPage;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	public List<Article> paging(int index) {
		String query = "SELECT * FROM  Account";
		List<Article> list = new ArrayList<Article>();
		try {

			conn = new MyDB().getConnection();
			ps = conn.prepareStatement(query);
			// ps.setInt(1, (index * 20 - 20));
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Article(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getString(11), rs.getString(12)));
			}
			return list;
		} catch (Exception e) {
		}
		return null;
	}
	
	// ------------------ END ACCOUNT ---------------//
	
	// ------------------ START PRODUCT ---------------//
	
	public List<Article1> sanpham(int index) {
		String query = "SELECT * FROM  Product";
		List<Article1> list1 = new ArrayList<Article1>();
		try {

			conn = new MyDB().getConnection();
			ps = conn.prepareStatement(query);
			// ps.setInt(1, (index * 20 - 20));
			rs = ps.executeQuery();
			while (rs.next()) {
				list1.add(new Article1(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));

				// user = new User(rs.getString("productId"),
				// rs.getString("subcategoryId"),
				// rs.getString("name"),
				// rs.getString("unitprice"),
				// rs.getString("like"),
				// rs.getString("gender"),
				// rs.getString("description"),
				// rs.getString("available"));
			}
			return list1;
		} catch (Exception e) {
		}
		return null;
	}

	public boolean insertProduct(String productid, String subcategory, String name, String unitprice, String like,
			String gender, String description, String available) {
		Connection conn1 = null, conn2 = null;
		PreparedStatement ps1 = null, ps2 = null;
		ResultSet rs = null;
		try {
			String query = "insert into Product values('" + subcategory + "','" + name + "','" + unitprice + "','"
					+ like + "','" + gender + "' ,'" + description + "' ,'" + available + "')";
			System.out.println(query);
			conn1 = new MyDB().getConnection();
			ps1 = conn1.prepareStatement(query);
			ps1.executeUpdate();

			// String query2 = "insert into AccountRole values('" + email + "','" + role +
			// "')";
			// conn2 = new MyDB().getConnection();
			// System.out.println(query2);
			// ps2 = conn2.prepareStatement(query2);
			// ps2.executeUpdate();

			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public boolean productExists(String productid) {
		String query = "select * from Product where ProductId=?";
		try {
			conn = new MyDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, productid);
			rs = ps.executeQuery();

			if (rs.next()) {
				return true; // co ton tai productid nay trong dbo.product
			}
			return false;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public boolean deleteProduct(String productid) { // khong xai` vi anh huong toi don dat hang
		try { // delete Role truoc, vi no co khoa ngoai
			String query2 = "delete from PriceHistory where productid='" + productid + "'";
			conn = new MyDB().getConnection();
			System.out.println(query2);
			ps = conn.prepareStatement(query2);
			ps.executeUpdate();

			String query3 = "delete from Image where productid='" + productid + "'";
			conn = new MyDB().getConnection();
			System.out.println(query3);
			ps = conn.prepareStatement(query3);
			ps.executeUpdate();

			String query4 = "delete from Comment where productid='" + productid + "'";
			conn = new MyDB().getConnection();
			System.out.println(query4);
			ps = conn.prepareStatement(query4);
			ps.executeUpdate();

			String query = "delete from Product where productid='" + productid + "'";
			conn = new MyDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();

			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public boolean updateProduct(String productid, String subcategory, String name, String unitprice, String gender,
			String description, String available) {
		Connection conn1 = null, conn2 = null;
		PreparedStatement ps1 = null, ps2 = null;
		ResultSet rs = null;
		try {
			String query = "update Product" + " set SubCategoryId='" + subcategory + "', Name='" + name
					+ "',UnitPrice='" + unitprice + "',Gender='" + gender + "',Description='" + description
					+ "' ,Available='" + available + "'" + " WHERE ProductId=" + productid + "";
			System.out.println(query);
			conn1 = new MyDB().getConnection();
			ps1 = conn1.prepareStatement(query);
			ps1.executeUpdate();

//			String query2 = "update AccountRole set Role='" + role + "'"
//					+ " Where Email='" + email + "'";
//			conn2 = new MyDB().getConnection();
//			System.out.println(query2);
//			ps2 = conn2.prepareStatement(query2);
//			ps2.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	// ------------------ END PRODUCT ---------------//

	// ------------------ START ORDER ---------------//
	public List<OrderList> donhang(int index) {
		String query = "SELECT P.PurchaseOrderId, P.CreatedDate , A.Email, P.SubTotal, P.Address, P.Phone FROM PurchaseOrder P, Account A WHERE A.AccountId = P.AccountId";
		List<OrderList> listDon = new ArrayList<OrderList>();
		try {

			conn = new MyDB().getConnection();
			ps = conn.prepareStatement(query);
			// ps.setInt(1, (index * 20 - 20));
			rs = ps.executeQuery();
			while (rs.next()) {
				listDon.add(new OrderList(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6)));
			}
			return listDon;
		} catch (Exception e) {
		}
		return null;
	}

	 // ----------------- DASH BOARD ---------------- //
	 public int countEmployee() {
		 String query = "Select * From CountNV";
			try {
				conn = new MyDB().getConnection();
				ps = conn.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()){
					int total = rs.getInt(1);
					return total;
				}
			}
			catch (Exception e) {
				System.out.println(e);
			}
			return 0;
	 }
	 
	 public int countUser() {
		 String query = "select count(*) from AccountRole WHERE (Role='USER')";
			try {
				conn = new MyDB().getConnection();
				ps = conn.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()){
					int total = rs.getInt(1);
					return total;
				}
			}
			catch (Exception e) {
				System.out.println(e);
			}
			return 0;
	 }

	 public int countOtherDetail() {
		 String query = "select count(*) from PurchaseOrder WHERE (CancelInvoice='TRUE')";
			try {
				conn = new MyDB().getConnection();
				ps = conn.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()){
					int total = rs.getInt(1);
					return total;
				}
			}
			catch (Exception e) {
				System.out.println(e);
			}
			return 0;
	 }
	 
	 public int countSubTotal() {
		 String query = "select SUM(SubTotal) from PurchaseOrder";
			try {
				conn = new MyDB().getConnection();
				ps = conn.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()){
					int total = rs.getInt(1);
					return total;
				}
			}
			catch (Exception e) {
				System.out.println(e);
			}
			return 0;
	 }
	 public int[] countPie() {
		 String query = "select soLanMua from DemTheoCategory() ORDER BY CategoryId ASC";
			try {
				conn = new MyDB().getConnection();
				ps = conn.prepareStatement(query);
				rs = ps.executeQuery();
				List<String> list = new ArrayList<String>();
				while(rs.next())
				{
				    String val = rs.getString(1);
				    list.add(val);
				} 
				
				String[] pies = new String[list.size()];
				 System.out.println("Contents of list ::"+list);
				//list.toArray(pies);		
				pies = (String[]) list.toArray(new String[list.size()]);
				 int[] pie = new int[pies.length];
				   for (int i = 0; i < pies.length; i++) {
					   pie[i] = Integer.parseInt(pies[i]);
				   }		
				return pie;
			}
			catch (Exception e) {
				 System.out.println  ("   m�mmam    t  ");
				System.out.println(e);			
			}
			return null;
	 }
	// -----------------END DASH BOARD ---------------- //
}

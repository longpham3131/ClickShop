package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DB.MyDB;
import com.model.*;

public class queryDAO {

    Connection conn = null;
    Statement stmt = null;
    PreparedStatement ps = null;
    CallableStatement clmt = null;
    ResultSet rs = null;

    public boolean insertAccount(String email, String firstName, String lastName,
                                 String phone, String address, String gender, String dateBirth, String role) {

        try {

//        String sqlBgTran =  "BEGIN TRANSACTION SAVE TRANSACTION Tran_InsertUpdateAccountRole ";
            String sqlExec = "{ Call USP_TaoUser (?,?,?, ?, ?, ?, ?, ?) }";
//        String sqlCommit = " COMMIT";


            conn = new MyDB().getConnection();

            conn.setAutoCommit(false);

            clmt = conn.prepareCall(sqlExec);
            clmt.setString(1, email);
            clmt.setString(2, firstName);
            clmt.setString(3, lastName);
            clmt.setString(4, phone);
            clmt.setString(5, address);
            clmt.setString(6, gender);
            clmt.setString(7, dateBirth);
            clmt.setString(8, role);
            clmt.execute();
            conn.commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteAccount(String email) {  // isAvailable = 0
        try {

            String query2 = "update Account set isAvailable='0'  WHERE Email='" + email + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean blockProduct(String id) {  // isAvailable = 0
        try { // delete Role truoc, vi no co khoa ngoai
            //String query2 = "delete from AccountRole where email='" + email + "'";
            String query2 = "update Product set Available='0'  WHERE ProductId='" + id + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean unBlockAccount(String email) {  // isAvailable = 0
        try {

            String query2 = "update Account set isAvailable='1'  WHERE Email='" + email + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean unBlockProduct(String id) {  // isAvailable = 0
        try {
            String query2 = "update Product set Available='1'  WHERE ProductId='" + id + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean resetPass(String email) {  // isAvailable = 0
        try { // delete Role truoc, vi no co khoa ngoai
            //String query2 = "delete from AccountRole where email='" + email + "'";
            String query2 = "update Account set Password='1'  WHERE Email='" + email + "'";
            System.out.println(query2);
            conn = new MyDB().getConnection();
            System.out.println(query2);
            ps = conn.prepareStatement(query2);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateAccount(String email, String firstName, String lastName,
                                 String phone, String address, String gender, String dateBirth) {
        Connection conn1 = null;
        CallableStatement cs = null;
        try {
            String query = "{Call USP_CapNhatUser(?,?,?,?,?,?,?)}";

            conn1 = new MyDB().getConnection();
            cs = conn1.prepareCall(query);
            cs.setString(1, email);
            cs.setString(2, firstName);
            cs.setString(3, lastName);
            cs.setString(4, phone);
            cs.setString(5, address);
            cs.setString(6, gender);
            cs.setString(7, dateBirth);
            cs.execute();
            return true;

        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean accountExists(String email) {
        try {
            String query = "{  ? = call UF_KiemTraTonTai(?)}";
            conn = new MyDB().getConnection();
            clmt = conn.prepareCall(query);

            clmt.registerOutParameter(1, Types.INTEGER);
            clmt.setString(2, email);
            clmt.execute();

            int result = clmt.getInt(1);

            if (result == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean productIDExists(String id) {
        String query = "select * from Product where ProductId='" + id + "'";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
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


    public List<Article> paging(int index) {
        String query = "SELECT Account.*, AccountRole.Role FROM  Account, AccountRole where Account.Email = AccountRole.Email";
        List<Article> list = new ArrayList<Article>();
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            // ps.setInt(1, (index * 20 - 20));
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Article(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    // ------------------ END ACCOUNT ---------------//
    // ------------------ START DISPLAY ---------------//

    public List<Display> hienthi(int index) {
        String query = "SELECT Product.ProductId, Product.Name,Product.UnitPrice , Image.ImagePath FROM dbo.Product ,dbo.[Image] WHERE Product.ProductId = Image.ProductId";
        List<Display> listSanpham = new ArrayList<Display>();
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listSanpham.add(new Display(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
            return listSanpham;
        } catch (Exception e) {
        }
        return null;
    }


    // ------------------ END DISPLAY ---------------//

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

    public List<Category> listcategory(int index) {
        String query = "SELECT * FROM  Category";
        List<Category> list = new ArrayList<Category>();
        System.out.print("category");
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            // ps.setInt(1, (index * 20 - 20));
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getString(1), rs.getString(2)));

                // user = new User(rs.getString("productId"),
                // rs.getString("subcategoryId"),
                // rs.getString("name"),
                // rs.getString("unitprice"),
                // rs.getString("like"),
                // rs.getString("gender"),
                // rs.getString("description"),
                // rs.getString("available"));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean insertProduct(String productid, String subcategory, String name, String unitprice, String like,
                                 String gender, String description, String available, String img) {
        Connection conn1 = null, conn2 = null;
        PreparedStatement ps1 = null, ps2 = null;
        ResultSet rs = null;
        try {
            String query = "EXEC dbo.PSP_ThemSP " + subcategory + "," + name + "," + img + "," + unitprice + "," + 0 + "," + gender + "," + description;
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
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    // ------------------ END PRODUCT ---------------//

    // ------------------ START ORDER ---------------//
    public List<OrderList> donhang(int index) {
        String query = "SELECT * FROM dbo.OV_OrderView";
        List<OrderList> listDon = new ArrayList<OrderList>();
        try {

            conn = new MyDB().getConnection();
            stmt = conn.createStatement();

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                listDon.add(new OrderList(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6)));
            }
            return listDon;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateOrder(String purchaseorderid, String address, String phone) {
        Connection conn1 = null;
        CallableStatement clsm = null;
        ResultSet rs = null;
        try {
            String query = "{ Call OSP_CapNhanDonHang(?,?,?)}";
            System.out.println(query);
            conn1 = new MyDB().getConnection();
            clsm = conn1.prepareCall(query);

            clsm.setString(1, purchaseorderid);
            clsm.setString(2, address);
            clsm.setString(3, phone);
            clsm.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateOrderDetail(String purchaseorderdetailid, String purchaseorder, String productid, String quantity, String unitprice,
                                     String subtotal) {
        Connection conn1 = null;
        CallableStatement clmst = null;
        ResultSet rs = null;
        try {
            String query = "{ CALL dbo.OSP_CapNhatChiTiet(?,?,?,?,?,?)}";

            System.out.println(query);
            conn1 = new MyDB().getConnection();
            clmst = conn1.prepareCall(query);
            clmst.setString(1, purchaseorderdetailid);
            clmst.setString(2, purchaseorder);
            clmst.setString(3, productid);
            clmst.setString(4, quantity);
            clmst.setString(5, unitprice);
            clmst.setString(6, subtotal);
            clmst.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // ----------------- DASH BOARD ---------------- //
    public int countEmployee() {

        // String query = "Select * From CountNV()";
        String query = "select count(*) as SoluongNV from AccountRole where Role= 'Shipper' OR Role ='Saler'";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
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
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
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
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
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
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
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
            while (rs.next()) {
                String val = rs.getString(1);
                list.add(val);
            }

            String[] pies = new String[list.size()];
            System.out.println("Contents of list ::" + list);
            //list.toArray(pies);
            pies = (String[]) list.toArray(new String[list.size()]);
            int[] pie = new int[pies.length];
            for (int i = 0; i < pies.length; i++) {
                pie[i] = Integer.parseInt(pies[i]);
            }
            return pie;
        } catch (Exception e) {
            System.out.println("  bug  ");
            System.out.println(e);
        }
        return null;
    }

    // -----------------END DASH BOARD ---------------- //

    // -------------------- Ship in Admin -------------------------//

    //----- fill 4 o dau -------//
    public int countNeedShipper() {
        String query = "select Count(PurchaseOrderId) from PurchaseOrder Where Status='init'";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countInShipping() {
        String query = "select Count(S.PurchaseOrderId) from Shipper S Where (S.Status='shipping' OR S.Status='Cancel' OR S.Status='Completed')";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countPickingUP() {
        String query = "select count(*) from Shipper WHERE (Status='Picking')";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countShipper() {
        String query = "select count(*) from AccountRole WHERE (Role='shipper')";
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    //----- fill 4 o dau -------//

    //------ Bang so 1 ---------//
    public List<Shipper> shipperList() {         // rs2.next() can then undo trong truong hop co testcase nhieu shipper
        // return ---- accountId,  email,  firstName,  phone,   ortherCarring
        String query = "SELECT A.AccountId, A.Email, A.FirstName, A.Phone, A.LastName, A.Address, A.Gender\n" +
                " FROM Shipper S, Account A, AccountRole AR\n" +
                "WHERE A.Email=AR.Email AND AR.Role='shipper' AND A.AccountId = S.ShipperId \n" +
                "GROUP BY A.AccountId, A.Email, A.FirstName, A.Phone, A.LastName, A.Address, A.Gender";

        String query2 = "SELECT S.ShipperId ,COUNT(*) as carrying\n" +
                "\tFROM  Shipper S\n" +
                "\tWHERE S.Status='shipping'\n" +
                "\tGROUP BY S.ShipperId";
        List<Shipper> list = new ArrayList<Shipper>();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            System.out.print("////////");

            Connection conn2 = null;
            PreparedStatement ps2 = null;
            ResultSet rs2 = null;
            conn2 = new MyDB().getConnection();
            ps2 = conn2.prepareStatement(query2);
            rs2 = ps2.executeQuery();
            //    rs.next();
            //    rs2.next();
            //    System.out.print("```"+rs.getString(1)+"```"+rs2.getString(1));
            while (rs.next()) {
                //   System.out.print("```"+rs.getString(1)+"```"+rs2.getString(1));
                if (rs2.next()==true && rs.getString(1).equals(rs2.getString(1))) {
                    list.add(new Shipper(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                            rs2.getString(2), rs.getString(5), rs.getString(6), rs.getString(7)));
                    System.out.print("```"+rs.getString(1)+"```"+rs2.getString(1));
                } else
                    list.add(new Shipper(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                            "0", rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return list;
        } catch (Exception e) {
            System.out.print(e);
        }
        return null;
    }

    // ----- Bang so 2 ---------//
    public List<OrtherNoShipper> initOrderList() {
        // return ---- accountId,  email,  firstName,  phone,   ortherCarring
        String query = "SELECT P.PurchaseOrderId, A.Email, P.SubTotal, P.Address, P.Phone, P.Status\r\n"
                + "	FROM Account A, PurchaseOrder P\r\n"
                + "	WHERE A.AccountId= P.AccountId AND P.Status ='init'";
        List<OrtherNoShipper> list = new ArrayList<OrtherNoShipper>();
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrtherNoShipper(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<DetailOrder> OrtherDetailNoShip() {
        String query = "SELECT  PO.PurchaseOrderId, P.ProductId, Pro.Name, P.Quantity, P.Subtotal\n" +
                "FROM PurchaseOrderDetail P, Product Pro, PurchaseOrder PO\n" +
                "WHERE PRO.ProductId = P.ProductId AND PO.Status='init' AND PO.PurchaseOrderId = P.PurchaseOrderId ";
        List<DetailOrder> list = new ArrayList<DetailOrder>();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DetailOrder(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5)));
            }
            //System.out.println("Contents of list ::" + list);
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    // dang lam o day
    public boolean convertNoShipToPickup(String shipperID, String OrtherID) {      // can them transaction here <<<<<<<<<<
        System.out.println("Vao querrryyyyyyyyy");
        Connection conn1 = null, conn2 = null;
        PreparedStatement ps1 = null, ps2 = null;
        ResultSet rs = null;
        try {
            String query = "update PurchaseOrder set Status='Processing' WHERE PurchaseOrderId='" + OrtherID + "'";
            String query2 = "insert into Shipper  values('" + OrtherID + "', '" + shipperID + "', 'Picking')";
            conn1 = new MyDB().getConnection();
            conn2 = new MyDB().getConnection();

            ps1 = conn1.prepareStatement(query);
            ps1.executeUpdate();

            ps2 = conn2.prepareStatement(query2);
            ps2.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // ----end Bang so 2 ---------//
    // ---- Bang so 3 ---------//
    public List<PickingUp> pickupList() {
        // return ---- accountId,  email,  firstName,  phone,   ortherCarring
        String query = "	SELECT S.PurchaseOrderId, S.ShipperId, A.Email, P.SubTotal, P.Address, P.Phone, S.Status\r\n"
                + "	FROM Account A, PurchaseOrder P, Shipper S\r\n"
                + "	WHERE A.AccountId= P.AccountId  AND S.PurchaseOrderId = P.PurchaseOrderId AND S.Status='Picking'";
        List<PickingUp> list = new ArrayList<PickingUp>();
        try {


            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PickingUp(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<DetailOrder> OrtherDetailPicking() {
        String query = "SELECT  PO.PurchaseOrderId, P.ProductId, Pro.Name, P.Quantity, P.Subtotal\n" +
                "FROM PurchaseOrderDetail P, Product Pro, PurchaseOrder PO, Shipper SP \n" +
                "WHERE PRO.ProductId = P.ProductId AND SP.Status='Picking' AND PO.PurchaseOrderId = P.PurchaseOrderId AND SP.PurchaseOrderId=P.PurchaseOrderId";
        List<DetailOrder> list = new ArrayList<DetailOrder>();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DetailOrder(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5)));
            }
            //System.out.println("Contents of list ::" + list);
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean Shipperpicked(String OrtherID) {      // can them transaction here <<<<<<<<<<
        Connection conn1 = null;
        PreparedStatement ps1 = null;
        ResultSet rs = null;
        try {
            String query = "update Shipper set Status='Shipping' WHERE PurchaseOrderId='" + OrtherID + "'";
            conn1 = new MyDB().getConnection();

            ps1 = conn1.prepareStatement(query);
            ps1.executeUpdate();

            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // ---End Bang 3 ---//
    //---- Bang so 4 -----//
    public List<Shipping> shippingList() {
        String query = "SELECT S.PurchaseOrderId, S.ShipperId, A.Email, P.SubTotal, P.Address, P.Phone, S.Status\r\n"
                + "	FROM Account A, PurchaseOrder P, Shipper S\r\n"
                + "	WHERE A.AccountId= P.AccountId  AND S.PurchaseOrderId = P.PurchaseOrderId AND (S.Status='shipping' OR S.Status='Cancel' OR S.Status='Completed')\r\n";
        List<Shipping> list = new ArrayList<Shipping>();
        try {

            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Shipping(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<DetailOrder> OrtherDetailShipping() {
        String query = "SELECT  PO.PurchaseOrderId, P.ProductId, Pro.Name, P.Quantity, P.Subtotal\n" +
                "FROM PurchaseOrderDetail P, Product Pro, PurchaseOrder PO, Shipper SP \n" +
                "WHERE PRO.ProductId = P.ProductId AND SP.Status='Shipping' AND PO.PurchaseOrderId = P.PurchaseOrderId AND SP.PurchaseOrderId=P.PurchaseOrderId";
        List<DetailOrder> list = new ArrayList<DetailOrder>();
        try {
            conn = new MyDB().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DetailOrder(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5)));
            }
            //System.out.println("Contents of list ::" + list);
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean endOrder(String OrtherID, String Status) {
        Connection conn1 = null, conn2 = null;
        PreparedStatement ps1 = null, ps2 = null;
        ResultSet rs = null;
        try {
            String query = "update PurchaseOrder set Status='" + Status + "' WHERE PurchaseOrderId='" + OrtherID + "'";
            String query2 = "delete from Shipper WHERE PurchaseOrderId='" + OrtherID + "'";
            conn1 = new MyDB().getConnection();
            conn2 = new MyDB().getConnection();

            ps1 = conn1.prepareStatement(query);
            ps1.executeUpdate();

            ps2 = conn2.prepareStatement(query2);
            ps2.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    // ----------- End ship Admin -------------------//
}

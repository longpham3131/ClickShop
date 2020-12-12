package com.model;

public class DetailNoShip {
    private String OrderID;
    private String ProductID;
    private String Name;
    private String Quanity;
    private String SubTotal;

    public DetailNoShip(String orderID, String productID,  String name,  String quanity, String subTotal)
    {
        OrderID = orderID;
        ProductID = productID;
        SubTotal = subTotal;
        Name = name;
        Quanity = quanity;
        //System.out.print(" ==88 " +ProductID+" ss==");
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String orderID) {
        OrderID = orderID;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String productID) {
        ProductID = productID;
    }

    public String getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(String subTotal) {
        SubTotal = subTotal;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getQuanity() {
        return Quanity;
    }

    public void setQuanity(String quanity) {
        Quanity = quanity;
    }

}

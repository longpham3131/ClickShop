package com.model;

public class Display {
	private String ProductId;
	private String Name;
	private String UnitPrice;
	private String ImagePath;
	public Display(){}
	public Display(String productId, String name, String unitprice, String imagepath) {
		ProductId = productId;
		Name = name;
		UnitPrice = unitprice;
		ImagePath = imagepath;
	}
	public String getProductId() {
		return ProductId;
	}
	public void setProductId(String productId) {
		ProductId = productId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getUnitPrice() {
		return UnitPrice;
	}
	public void setUnitPrice(String unitprice) {
		UnitPrice = unitprice;
	}

	public String getImagePath() {
		return ImagePath;
	}

	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}
}

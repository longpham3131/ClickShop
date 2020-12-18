package com.model;

public class Display {
	private String ProductId;
	private String Name;
	private String UnitPrice;
	private String ImagePath;
	private String Description;
	public Display(){}
	public Display(String productId, String name, String unitprice, String imagePath, String description) {
		ProductId = productId;
		Name = name;
		UnitPrice = unitprice;
		ImagePath = imagePath;
		Description = description;
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

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}
}

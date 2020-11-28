package com.model;

public class Article1 {
	private String ProductId;
	private String SubCategoryId;
	private String Name;
	private String UnitPrice;
	private String Like;
	private String Gender;
	private String Description;
	private String Available;
	public Article1(){}
	public Article1(String productId, String subcategoryId, String name, String unitprice, String like, String gender,
			String description, String available) {
		ProductId = productId;
		SubCategoryId = subcategoryId;
		Name = name;
		UnitPrice = unitprice;
		Like = like;
		Gender = gender;
		Description = description;
		Available = available;
		// this.isAvailable = isAvailable;

	}
	public String getProductId() {
		return ProductId;
	}
	public void setProductId(String productId) {
		ProductId = productId;
	}
	public String getSubCategoryId() {
		return SubCategoryId;
	}
	public void setSubCategoryId(String subcategoryId) {
		SubCategoryId = subcategoryId;
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
	public String getLike() {
		return Like;
	}
	public void setLike(String like) {
		Like = like;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getAvailable() {
		return Available;
	}
	public void setAvailable(String available) {
		Available = available;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}

}

package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Products")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ProductID;
	
	@Column(name="ProductName")
	private String ProductName;
	
	@Column(name="ProductDescription")
	private String ProductDescription;
	 
	@Column(name="ProductPrice")
	private double ProductPrice;
	
	@Column(name="AvailableQuantity")
	private int AvailableQuantity;
	
	@Column(name="ProductImage")
	private String ProductImage;	
	
	
	public Product(String ProductName, String ProductDescription, double ProductPrice, int AvailableQuantity,
			String ProductImage) {
		super();
		this.ProductName = ProductName;
		this.ProductDescription = ProductDescription;
		this.ProductPrice = ProductPrice;
		this.AvailableQuantity = AvailableQuantity;
		this.ProductImage = ProductImage;
	}


	public Product() {
		
	}
	
	public void setid(Long ProductID) {
		this.ProductID=ProductID;
	}
	public Long getid() {
		return ProductID;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String ProductName) {
		this.ProductName = ProductName;
	}
	public String getProductDescription() {
		return ProductDescription;
	}
	public void setProductDescription(String ProductDescription) {
		this.ProductDescription = ProductDescription;
	}
	public double getProductPrice() {
		return ProductPrice;
	}
	public void setProductPrice(double ProductPrice) {
		this.ProductPrice = ProductPrice;
	}
	public int getAvailableQuantity() {
		return AvailableQuantity;
	}
	public void setAvailableQuantity(int AvailableQuantity) {
		this.AvailableQuantity = AvailableQuantity;
	}
	public String getProductImage() {
		return ProductImage;
	}
	public void setProductImage(String ProductImage) {
		this.ProductImage = ProductImage;
	}

	
	
}

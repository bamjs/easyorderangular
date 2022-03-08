package com.example.demo.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Orders")
public class Order {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long orderID;
	@Column(name="OrderDate")
	public Date orderDate;
	@Column(name="Amount")
	public float amount;
	@Column(name="Status")
	public String status;
	@Column (name="UserID")
	public int userID;
	@Column(name="Quantity")
	public int quantity;
	@Column(name="ProductIDs")
	public String productIDs;
	@Column(name="ProductsQuantity")
	public String productsQuantity;
	
	public Order() {}
	public Order(Long orderID, Date orderDate, float amount, String status, int userID, int quantity, String productIDs,
			String productsQuantity) {
		this.orderID = orderID;
		this.orderDate = orderDate;
		this.amount = amount;
		this.status = status;
		this.userID = userID;
		this.quantity = quantity;
		this.productIDs = productIDs;
		this.productsQuantity = productsQuantity;
	}
	public Long getrderID() {
		return orderID;
	}
	public void setOrderID(Long orderID) {
		this.orderID = orderID;
	}
	public Date getorderDate() {
		return orderDate;
	}
	public void setorderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public float getamount() {
		return amount;
	}
	public void setamount(float amount) {
		this.amount = amount;
	}
	public String getstatus() {
		return status;
	}
	public void setstatus(String status) {
		this.status = status;
	}
	public int getuserID() {
		return userID;
	}
	public void setuserID(int userID) {
		this.userID = userID;
	}
	public int getquantity() {
		return quantity;
	}
	public void setquantity(int quantity) {
		this.quantity = quantity;
	}
	public String getproductIDs() {
		return productIDs;
	}
	public void setproductIDs(String productIDs) {
		this.productIDs = productIDs;
	}
	public String getproductsQuantity() {
		return productsQuantity;
	}
	public void setproductsQuantity(String productsQuantity) {
		this.productsQuantity = productsQuantity;
	}
}

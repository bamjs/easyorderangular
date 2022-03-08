package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SavedList {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long ID;
	@Column(name="ProductID")
	private Long ProductID;
	@Column (name="UserID")
	private Long userID;	
	public SavedList() {}

	public SavedList(Long productID, Long userID) {
		ProductID = productID;
		this.userID = userID;
		
	}

	public Long getID() {
		return ID;
	}

	public void setID(Long ID) {
		this.ID = ID;
	}

	public Long getProductID() {
		return ProductID;
	}

	public void setProductID(Long productID) {
		ProductID = productID;
	}

	public Long getUserID() {
		return userID;
	}

	public void setUserID(Long userID) {
		this.userID = userID;
	}

	

	
}

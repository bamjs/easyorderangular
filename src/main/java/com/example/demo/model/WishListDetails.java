/**
 * 
 */
package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class WishListDetails {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long ProductID;
   
    private String ProductName;
    @Column
    private String ProductDescription;
    @Column
    private String ProductImage;
    @Column
    private int AvailableQuantity;
    @Column
    private int ProductPrice;
	public Long getProductID() {
		return ProductID;
	}
	public String getProductName() {
		return ProductName;
	}
	public String getProductDescription() {
		return ProductDescription;
	}
	public String getProductImage() {
		return ProductImage;
	}
	public int getAvailableQuantity() {
		return AvailableQuantity;
	}
    public int getProductPrice() {
    	return ProductPrice;
    }
    

}

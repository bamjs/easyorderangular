package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;

import com.example.demo.model.WishListDetails;

public interface WishListDetailsInterface extends JpaRepository<WishListDetails,Long> {
	@Procedure(procedureName = "GetWishListProducts")
	List<WishListDetails> getallWishProductsByUserID(Long UserID);
	
}

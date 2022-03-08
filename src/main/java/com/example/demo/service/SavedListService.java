package com.example.demo.service;

import org.springframework.http.ResponseEntity;

import com.example.demo.model.SavedList;

public interface SavedListService {

	ResponseEntity<SavedList> postSavedListproducts(SavedList savedlist);
	ResponseEntity<SavedList> postWishListProducts(SavedList savedlist);
	ResponseEntity<SavedList> deleteSavedListproducts(SavedList savedlist);
	ResponseEntity<SavedList> deleteWishListProducts(SavedList savedlist);
	ResponseEntity<SavedList> deleteAllSavedListWithProductID(SavedList savedlist);
	String deleteByUserID(Long UserID);
}

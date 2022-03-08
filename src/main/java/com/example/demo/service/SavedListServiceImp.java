package com.example.demo.service;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.demo.model.SavedList;
import com.example.demo.repository.SavedListInterface;

@Service
public class SavedListServiceImp implements SavedListService  {
	SavedListInterface _savedListInterface;
	public SavedListServiceImp(SavedListInterface savedListInterface) {
		this._savedListInterface=savedListInterface;
	}
	@Override
	public ResponseEntity<SavedList> postSavedListproducts(SavedList savedlist){
		 _savedListInterface.postSavedListProducts(savedlist.getUserID(), savedlist.getProductID());
		 return new ResponseEntity<SavedList>(HttpStatus.CREATED);
		}
	@Override
	public ResponseEntity<SavedList> postWishListProducts(SavedList savedlist) {
		_savedListInterface.postWishListProducts(savedlist.getUserID(),savedlist.getProductID());
		return new ResponseEntity<SavedList>(HttpStatus.CREATED);
	}
	@Override
	public ResponseEntity<SavedList> deleteSavedListproducts(SavedList savedlist) {
		_savedListInterface.deleteSavedListProducts(savedlist.getUserID(), savedlist.getProductID());
		return new ResponseEntity<SavedList> (HttpStatus.CREATED);
	}
	@Override
	public ResponseEntity<SavedList> deleteWishListProducts(SavedList wishlist) {
		_savedListInterface.deleteWishListProducts(wishlist.getUserID(), wishlist.getProductID());
		return new ResponseEntity<SavedList> (HttpStatus.CREATED);
	}
	@Override
	public ResponseEntity<SavedList> deleteAllSavedListWithProductID(SavedList savedlist) {
		_savedListInterface.deleteAllSavedItemsWithProductID(savedlist.getUserID(), savedlist.getProductID());;
		return new ResponseEntity<SavedList>(HttpStatus.CREATED);
	}
	@Override
	public String deleteByUserID(Long UserID) {
		_savedListInterface.deleteByUserID(UserID);
		return "Deleted ";
	}
}

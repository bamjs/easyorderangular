package com.example.demo.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.SavedList;
import com.example.demo.model.SavedListDetails;
import com.example.demo.model.WishListDetails;
import com.example.demo.repository.SavedListDeatilsInterface;
import com.example.demo.repository.WishListDetailsInterface;
import com.example.demo.service.SavedListServiceImp;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;

@RestController
@CrossOrigin
public class SavedListController {

	SavedListDeatilsInterface _savedListProcInterface;
	SavedListServiceImp _savedlistimp;
	WishListDetailsInterface _wishListInterface;
	public SavedListController(SavedListDeatilsInterface savedListInterface, SavedListServiceImp savedlistimp,
			WishListDetailsInterface wishlistinterface) {
		this._savedListProcInterface = savedListInterface;
		this._savedlistimp = savedlistimp;
		this._wishListInterface = wishlistinterface;
	}

	@Transactional
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@GetMapping("/savedlist/{UserID}")
	public List<SavedListDetails> getSavedListByUserID(@PathVariable(name = "UserID") Long UserID) {
		return _savedListProcInterface.getallSavedProductByUserID(UserID);
	}

	@Transactional
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@GetMapping("/wishlist/{UserID}")
	public List<WishListDetails> getWishListByUserID(@PathVariable(name = "UserID") Long UserID) {
		return _wishListInterface.getallWishProductsByUserID(UserID);
	}

	@Transactional
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PostMapping("/savedlist")
	public ResponseEntity<SavedList> postSavedList(@RequestBody SavedList savedlist){
		System.out.println(savedlist.getUserID()+"this is the user id ");
		return _savedlistimp.postSavedListproducts(savedlist);
	}

	@Transactional
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PostMapping("/wishlist")
	public ResponseEntity<SavedList> postwishlist(@RequestBody SavedList savedlist) {
		return _savedlistimp.postWishListProducts(savedlist);
	}

	@Transactional
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@DeleteMapping("/savedlist/delete")
	public ResponseEntity<SavedList> deleteSavedList(@RequestBody SavedList savedlist) {
		return _savedlistimp.deleteSavedListproducts(savedlist);
	}

	@Transactional
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@DeleteMapping("/wishlist/delete")
	public ResponseEntity<SavedList> deleteWishlist(@RequestBody SavedList wishlist) {
		return _savedlistimp.deleteWishListProducts(wishlist);
	}

	@Transactional
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@DeleteMapping("/savedlist/deletewithproductid")
	public ResponseEntity<SavedList> deleteSavedListWithProductID(@RequestBody SavedList savedlist) {
		return _savedlistimp.deleteAllSavedListWithProductID(savedlist);
	}
	@Transactional
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@DeleteMapping("/savedlist/userid/{UserID}")
	public ResponseEntity<String> delelteByUserID(@PathVariable Long UserID){
		return new ResponseEntity<String> (_savedlistimp.deleteByUserID(UserID), HttpStatus.ACCEPTED);
	}

}

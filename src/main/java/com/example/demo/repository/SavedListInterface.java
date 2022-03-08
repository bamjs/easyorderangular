package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;

import com.example.demo.model.SavedList;

public interface SavedListInterface extends JpaRepository<SavedList,Long> {

	@Procedure(procedureName = "SavedItems")
    void postSavedListProducts(Long UserID,Long ProductID);
    @Procedure(procedureName = "SaveWishList")
    void postWishListProducts(Long UserID,Long ProductID);
    @Procedure (procedureName="DeleteSavedList")
    void deleteSavedListProducts(Long UserID,Long ProductID);
    @Procedure(procedureName = "DeleteWishList")
    void deleteWishListProducts(Long UserID,Long ProductID);
    @Procedure (procedureName = "deleteSavedListWithProductID")
    void deleteAllSavedItemsWithProductID(Long UserID,Long ProductID);
	String deleteByUserID(Long UserID);

}

package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;

import com.example.demo.model.SavedListDetails;

public interface SavedListDeatilsInterface extends JpaRepository<SavedListDetails,Integer> {
	@Procedure(procedureName = "GetAllSavedProducts")
    List<SavedListDetails> getallSavedProductByUserID(Long UserID);
}

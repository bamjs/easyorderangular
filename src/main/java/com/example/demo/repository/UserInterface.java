package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;

import com.example.demo.model.User;

public interface UserInterface extends JpaRepository<User,Long> {

	@Procedure(procedureName = "Login")
	User findByUserName(String userName);
	@Procedure(procedureName = "ResetPassword")
	User findByEmailIDAndPhoneNumber(String EmailID,String PhoneNumber);
	
	
	}

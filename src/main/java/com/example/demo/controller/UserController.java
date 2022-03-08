package com.example.demo.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.User;
import com.example.demo.repository.UserInterface;
import com.example.demo.service.UserService;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;

@RestController
@CrossOrigin
@RequestMapping("/user")
public class UserController {
	
	UserService _userService;
	@Autowired
	UserInterface userinterface;

	public UserController(UserService userService) {
		this._userService = userService;
	}

	
	@PostMapping("/registration")
	public ResponseEntity<User> saveUser(@RequestBody User user) {
		return new ResponseEntity<User>(_userService.saveUser(user), HttpStatus.CREATED);

	}

	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@GetMapping
	public List<User> getAllUser() {
		return _userService.getAllUser();
	}

	@Transactional
	@GetMapping("getByusername/{username}")
	public User getuserDetails(@PathVariable(name = "username") String UserName) {
		// return _userService.findByUserName(UserName);
		return userinterface.findByUserName(UserName);
	}

	
	@GetMapping("/userid/{UserID}")
	public User getUserById(@PathVariable Long UserID) {
		return userinterface.findById(UserID).get();
	}

	
	@Transactional
	@GetMapping("/getuserByEmailId")
	public ResponseEntity<?> getByemailIDAndPhoneNumber(@RequestParam(name = "emailID") String EmailID,
			@RequestParam(name = "PhoneNumber") String PhoneNumber) {
		return ResponseEntity.ok(_userService.findByEmailIDAndPhoneNumber(EmailID, PhoneNumber));
	}

}

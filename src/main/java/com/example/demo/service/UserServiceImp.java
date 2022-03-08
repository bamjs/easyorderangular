package com.example.demo.service;

import java.util.List;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.User;
import com.example.demo.repository.UserInterface;

@Service
public class UserServiceImp implements UserService {
	@Autowired
	UserInterface _userInterface;

	@Override
	public User saveUser(User user) {
		return _userInterface.save(user);
	}

	@Override
	public List<User> getAllUser() {
		return _userInterface.findAll();
	}

	@Override
	public User findByUserName(String UserName) {

		return _userInterface.findByUserName(UserName);
	}

	@Override
	public User findByEmailIDAndPhoneNumber(String emailID, String phoneNumber) {
		try {

			User user = _userInterface.findByEmailIDAndPhoneNumber(emailID, phoneNumber);
			return user;
		} catch (BeansException ex) {
			ex.getMessage();
			return null;
		}
	}

	

}

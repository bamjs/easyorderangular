package com.example.demo.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "Users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long UserID;
	@Column(name = "UserName")
	private String UserName;
	@Column(name = "Password")
	private String Password;
	@Column(name = "FirstName")
	private String FirstName;
	@Column(name = "SecondName")
	private String SecondName;
	@Column(name = "PhoneNumber")
	private String PhoneNumber;
	@Column(name = "EmailID")
	private String EmailID;
	@Column(name = "Gender")
	private String Gender;
	@Column(name = "Address1")
	private String Address1;
	@Column(name = "Address2")
	private String Address2;
	@Column(name = "DateOfBirth")
	private Date DateOfBirth;
	@Column(name = "Salary")
	private double Salary;
	@Column(name = "TermsAndConditions")
	private String TermsAndConditions;
	@Column(name = "Age")
	private int Age;
	@Column(name = "UserType")
	private String UserType;
	@Column(name = "GSTNumber")
	private String GSTNumber;
	
	
	public User() {}


	public User(String userName, String password, String firstName, String secondName, String phoneNumber,
			String emailID, String gender, String address1, String address2, Date dateOfBirth, double salary,
			String termsAndConditions, int age, String userType, String gSTNumber) {
		UserName = userName;
		Password = password;
		FirstName = firstName;
		SecondName = secondName;
		PhoneNumber = phoneNumber;
		EmailID = emailID;
		Gender = gender;
		Address1 = address1;
		Address2 = address2;
		DateOfBirth = dateOfBirth;
		Salary = salary;
		TermsAndConditions = termsAndConditions;
		Age = age;
		UserType = userType;
		GSTNumber = gSTNumber;
	}


	public Long getUserID() {
		return UserID;
	}


	public void setUserID(Long userID) {
		UserID = userID;
	}


	public String getUserName() {
		return UserName;
	}


	public void setUserName(String userName) {
		UserName = userName;
	}


	public String getPassword() {
		return Password;
	}


	public void setPassword(String password) {
		Password = password;
	}


	public String getFirstName() {
		return FirstName;
	}


	public void setFirstName(String firstName) {
		FirstName = firstName;
	}


	public String getSecondName() {
		return SecondName;
	}


	public void setSecondName(String secondName) {
		SecondName = secondName;
	}


	public String getPhoneNumber() {
		return PhoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}


	public String getEmailID() {
		return EmailID;
	}


	public void setEmailID(String emailID) {
		EmailID = emailID;
	}


	public String getGender() {
		return Gender;
	}


	public void setGender(String gender) {
		Gender = gender;
	}


	public String getAddress1() {
		return Address1;
	}


	public void setAddress1(String address1) {
		Address1 = address1;
	}


	public String getAddress2() {
		return Address2;
	}


	public void setAddress2(String address2) {
		Address2 = address2;
	}


	public Date getDateOfBirth() {
		return DateOfBirth;
	}


	public void setDateOfBirth(Date dateOfBirth) {
		DateOfBirth = dateOfBirth;
	}


	public double getSalary() {
		return Salary;
	}


	public void setSalary(double salary) {
		Salary = salary;
	}


	public String getTermsAndConditions() {
		return TermsAndConditions;
	}


	public void setTermsAndConditions(String termsAndConditions) {
		TermsAndConditions = termsAndConditions;
	}


	public int getAge() {
		return Age;
	}


	public void setAge(int age) {
		Age = age;
	}


	public String getUserType() {
		return UserType;
	}


	public void setUserType(String userType) {
		UserType = userType;
	}


	public String getGSTNumber() {
		return GSTNumber;
	}


	public void setGSTNumber(String gSTNumber) {
		GSTNumber = gSTNumber;
	}
	
	
}

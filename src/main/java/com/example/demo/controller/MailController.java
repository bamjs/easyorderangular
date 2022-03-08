package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Mail;
import com.example.demo.service.MailSenderService;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;

@RestController
@CrossOrigin
@RequestMapping("/mail")
public class MailController {

	@Autowired
	public MailSenderService mailservice;
	 @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
	@PostMapping
	public String sendMail(@RequestBody Mail mail) {
		mailservice.sendSimpleEmail(mail.getToAddress(), mail.getSubject(), mail.getText());
		return "mail send succesfully !!!!!";
	}
	 
	 @ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PostMapping("{orderID}")
	public String sendOrderMail(@PathVariable Long orderID ,@RequestBody Mail mail) {
		mailservice.sendmimeEmail(orderID, mail.getToAddress(), mail.getSubject());
		return "mail send succesfully";
	}
}

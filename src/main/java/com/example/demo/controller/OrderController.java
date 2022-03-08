package com.example.demo.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Mail;
import com.example.demo.model.Order;
import com.example.demo.model.Product;
import com.example.demo.repository.SavedListInterface;
import com.example.demo.service.MailSenderService;
import com.example.demo.service.OrderServiceImp;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;

@RestController
@CrossOrigin("http://localhost:4200")
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderServiceImp orderservice;
	@Autowired
	SavedListInterface savedlist;
	@Autowired
	MailSenderService mailservice;

	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@Transactional
	@PostMapping
	public ResponseEntity<Order> saveOrder(@RequestBody Order order) {
		savedlist.deleteByUserID((long) order.getuserID());
		return new ResponseEntity<Order>(orderservice.saveOrder(order), HttpStatus.CREATED);
	}
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@GetMapping("{orderID}")
	public ResponseEntity<Order> getOrderByid(@PathVariable Long orderID) {

		return new ResponseEntity<Order>(orderservice.getOrderDetailsByID(orderID), HttpStatus.CREATED);
	}

	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@Transactional
	@PutMapping("/updatepayment/{orderID}")
	public ResponseEntity<String> updatePaymentAndSendMail(@PathVariable Long orderID, @RequestBody Mail mail) {
		orderservice.updatepayment(orderID, mail.getPaymentStatus());
		mailservice.sendmimeEmail(orderID, mail.getToAddress(), mail.getSubject());
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@GetMapping("/getorders/{userID}")
	public ResponseEntity<List<Order>> getOrderByUserID(@PathVariable int userID) {
		System.out.println(userID);
		return ResponseEntity.ok(orderservice.findByUserID(userID));
	}

	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@GetMapping("/getproductdetails")
	public ResponseEntity<List<Product>> getproductdetails(@RequestParam(name = "productids") String productids) {
		return ResponseEntity.ok(orderservice.getProductDetails(productids));
	}
}

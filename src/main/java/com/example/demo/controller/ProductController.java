package com.example.demo.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Product;
import com.example.demo.service.MailSenderService;
import com.example.demo.service.ProductService;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;

@RestController
@CrossOrigin
@RequestMapping("/product")
public class ProductController {

	@Autowired
	public MailSenderService mailsender;
	private ProductService productService;

	public ProductController(ProductService productservice) {
		this.productService = productservice;

	}
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PostMapping
	public Product saveProduct(@RequestBody Product product) {
		return productService.saveProduct(product);

	}
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@GetMapping
	public List<Product> getallProducts() {
		return productService.getallProducts();
	}
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@Transactional
	@GetMapping("{id}")
	public ResponseEntity<Product> getProductByID(@PathVariable Long id) {
		return productService.getProductById(id);
	}
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@DeleteMapping("{id}")
	public ResponseEntity<Product> deleteProduct(@PathVariable Long id) {
		return productService.deleteProductByID(id);
	}
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@Transactional
	@PutMapping("{id}")
	public ResponseEntity<Product> updateProduct(@PathVariable Long id, @RequestBody Product product) {
		return productService.updateProduct(product, id);
	}



}

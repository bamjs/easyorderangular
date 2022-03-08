package com.example.demo.service;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.demo.model.Product;

public interface ProductService{
	
	Product saveProduct(Product product);
	List<Product> getallProducts();
	ResponseEntity<Product> deleteProductByID(Long id);
	ResponseEntity<Product> getProductById(Long id);
	ResponseEntity<Product> updateProduct(Product product,Long id);
}

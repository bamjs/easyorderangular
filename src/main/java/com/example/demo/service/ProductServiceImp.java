package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.demo.model.Product;
import com.example.demo.repository.ProductsInterface;

@Service
public class ProductServiceImp implements ProductService {

	ProductsInterface productinterface;

	public ProductServiceImp(ProductsInterface objproductsinterface) {
		this.productinterface = objproductsinterface;
	}

	@Override
	public Product saveProduct(Product product) {
		return productinterface.save(product);

	}

	@Override
	public List<Product> getallProducts() {

		return productinterface.findAll();
	}

	@Override
	public ResponseEntity<Product> deleteProductByID(Long id) {

		if (productinterface.existsById(id)) {

			productinterface.deleteById(id);
			return new ResponseEntity<Product>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Product>(HttpStatus.NO_CONTENT);
		}
	}

	@Override
	public ResponseEntity<Product> getProductById(Long id) {

		Optional<Product> products = productinterface.findById(id);
		if (products.isPresent()) {
			return new ResponseEntity<Product>(products.get(), HttpStatus.OK);
		} else {
			return new ResponseEntity<Product>(HttpStatus.NOT_FOUND);
		}
	}

	@Override
	public ResponseEntity<Product> updateProduct(Product product, Long id) {
		if (productinterface.existsById(id)) {
			product.setid(id);
			return new ResponseEntity<Product>(productinterface.save(product), HttpStatus.OK);
		} else {
			return new ResponseEntity<Product>(product, HttpStatus.NOT_FOUND);
		}
	}

}

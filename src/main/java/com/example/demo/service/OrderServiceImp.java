package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Order;
import com.example.demo.model.Product;
import com.example.demo.repository.OrderInterface;
import com.example.demo.repository.ProductsInterface;

@Service
public class OrderServiceImp implements OrderService {

	@Autowired
	OrderInterface orderinterface;
	@Autowired
	ProductsInterface _productinterface;

	@Override
	public Order saveOrder(Order order) {
		return orderinterface.save(order);
	}

	@Override
	public Order getOrderDetailsByID(Long orderID) {
	return orderinterface.findById(orderID).get();
	}

	@Override
	public void updatepayment(Long orderID, String paymentStatus) {
	Order order =orderinterface.findById(orderID).get();
	order.setstatus(paymentStatus);
	String[] productQuantity= order.getproductsQuantity().split(",");
	String[] productid= order.getproductIDs().split(",");
	for (int i = 0; i < productid.length; i++) {
		Product product=_productinterface.findById( (long) Integer.parseInt(productid[i])).get();
		product.setAvailableQuantity(product.getAvailableQuantity()-Integer.parseInt(productQuantity[i]));
	}
	}

	@Override
	public List<Order> findByUserID(int UserID) {
		
		return orderinterface.findByUserID(UserID);
	}

	@SuppressWarnings("null")
	@Override
	public List<Product> getProductDetails(String productIDs) {
		List<Product>productList = new ArrayList();
		String [] productIDArray=productIDs.split(",");
		for (@SuppressWarnings("unused") String productid : productIDArray) {
			productList.add(_productinterface.findById(Long.parseLong(productid)).get());
		}
		return productList ;
		
	}

}

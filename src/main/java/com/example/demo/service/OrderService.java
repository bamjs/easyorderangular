package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Order;
import com.example.demo.model.Product;

public interface OrderService {

	Order saveOrder(Order order);
	Order getOrderDetailsByID(Long orderID);
	void updatepayment(Long orderID,String paymentStatus);
	List<Order> findByUserID(int UserID);
	List<Product> getProductDetails(String productIDs);
	

}

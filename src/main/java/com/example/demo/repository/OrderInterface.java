package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Order;

public interface OrderInterface extends JpaRepository<Order,Long> {
List<Order> findByUserID(int UserID);
}

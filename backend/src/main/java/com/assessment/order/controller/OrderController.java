package com.assessment.order.controller;

import com.assessment.order.model.Order;
import com.assessment.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    // Issue: No pagination, will load all orders into memory
    @GetMapping
    public List<Order> getAllOrders() {
        return orderService.getAllOrders();
    }

    // Issue: No validation, no error handling
    @GetMapping("/{id}")
    public Order getOrderById(@PathVariable Long id) {
        return orderService.getOrderById(id);
    }

    // Issue: SQL injection vulnerability through search parameter
    @GetMapping("/search")
    public List<Order> searchOrders(@RequestParam String customerName) {
        return orderService.searchByCustomerName(customerName);
    }

    // Issue: No request body validation, returns null on error
    @PostMapping
    public Order createOrder(@RequestBody Order order) {
        try {
            return orderService.createOrder(order);
        } catch (Exception e) {
            return null; // Bad error handling
        }
    }

    // Issue: No authorization check, anyone can update any order
    @PutMapping("/{id}/status")
    public Order updateStatus(@PathVariable Long id, @RequestParam String status) {
        Order order = orderService.getOrderById(id);
        order.setStatus(status); // No validation of status values
        return orderService.updateOrder(order);
    }

    // Issue: Hard delete without soft delete option, no cascade handling
    @DeleteMapping("/{id}")
    public void deleteOrder(@PathVariable Long id) {
        orderService.deleteOrder(id);
    }
}

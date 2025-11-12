package com.assessment.order.service;

import com.assessment.order.model.Order;
import com.assessment.order.model.OrderItem;
import com.assessment.order.repository.OrderRepository;
import com.assessment.order.repository.OrderItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private EntityManager entityManager;

    // Issue: N+1 query problem - loads items separately for each order
    public List<Order> getAllOrders() {
        List<Order> orders = orderRepository.findAll();
        for (Order order : orders) {
            // This triggers a separate query for each order
            order.getOrderItems().size(); // Force lazy loading
        }
        return orders;
    }

    public Order getOrderById(Long id) {
        // Issue: Returns null instead of throwing exception
        return orderRepository.findById(id).orElse(null);
    }

    // Issue: SQL injection vulnerability - concatenating user input directly
    public List<Order> searchByCustomerName(String customerName) {
        String sql = "SELECT * FROM orders WHERE customer_name = '" + customerName + "'";
        Query query = entityManager.createNativeQuery(sql, Order.class);
        return query.getResultList();
    }

    // Issue: No transaction management, partial saves possible
    public Order createOrder(Order order) {
        Order savedOrder = orderRepository.save(order);
        
        // If this fails, order is saved but items aren't
        for (OrderItem item : order.getOrderItems()) {
            item.setOrder(savedOrder);
            orderItemRepository.save(item);
        }
        
        return savedOrder;
    }

    // Issue: No validation, no status transition rules
    public Order updateOrder(Order order) {
        return orderRepository.save(order);
    }

    // Issue: No check if order exists, no cascade delete handling
    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }

    // Issue: Inefficient - loads entire order to calculate total
    public Double calculateOrderTotal(Long orderId) {
        Order order = getOrderById(orderId);
        double total = 0;
        for (OrderItem item : order.getOrderItems()) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }
}

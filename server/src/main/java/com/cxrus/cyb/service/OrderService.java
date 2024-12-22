package com.cxrus.cyb.service;

import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.repositories.OrderRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
  private final OrderRepository orderRepository;

  public OrderService(OrderRepository orderRepository) {
    this.orderRepository = orderRepository;
  }

  public List<OrderEntity> getOrders() {
    return null;
  }

}

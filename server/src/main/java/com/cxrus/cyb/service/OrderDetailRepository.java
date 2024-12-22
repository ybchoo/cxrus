package com.cxrus.cyb.service;


import com.cxrus.cyb.repositories.CustomerRepository;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailRepository {
  private final OrderDetailRepository orderDetailRepository;

  public OrderDetailRepository(OrderDetailRepository orderDetailRepository) {
     this.orderDetailRepository = orderDetailRepository;
  }

}

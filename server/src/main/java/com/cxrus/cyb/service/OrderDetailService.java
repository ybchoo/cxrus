package com.cxrus.cyb.service;


import com.cxrus.cyb.entity.OrderdetailEntity;
import com.cxrus.cyb.repositories.CustomerRepository;
import com.cxrus.cyb.repositories.OrderDetailRepository;
import com.cxrus.cyb.repositories.OrderRepository;
import com.cxrus.cyb.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailService {

  @Autowired
  private final OrderDetailRepository orderDetailRepository;

  public OrderDetailService(
      OrderDetailRepository orderDetailRepository) {
    this.orderDetailRepository = orderDetailRepository;
  }

  public OrderdetailEntity getOrderDetailById(int id) {
    return null;
  }

  public List<OrderdetailEntity> getOrderDetails() {
    return null;
  }

  public List<OrderdetailEntity> getTopTenOrderDetails() {
    return null;
  }

}

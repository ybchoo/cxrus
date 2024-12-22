package com.cxrus.cyb.service;


import com.cxrus.cyb.entity.OrderdetailEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailService {
  private final OrderDetailService orderDetailService;

  public OrderDetailService(OrderDetailService orderDetailService) {
     this.orderDetailService = orderDetailService;
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

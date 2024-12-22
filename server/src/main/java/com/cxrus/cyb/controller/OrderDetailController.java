package com.cxrus.cyb.controller;

import java.util.List;
import java.util.Optional;

import com.cxrus.cyb.entity.CustomerEntity;
import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.entity.OrderdetailEntity;
import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.service.OrderDetailService;
import com.cxrus.cyb.service.OrderService;
import com.cxrus.cyb.service.ProductService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/order-details")
@RestController
public class OrderDetailController {

  private OrderDetailService orderDetailService;
  public OrderDetailController(OrderDetailService orderDetailService) {
    this.orderDetailService = orderDetailService;
  }
  @GetMapping("/{id}")
  public OrderdetailEntity getOrderDetailById(Integer id) {
    return orderDetailService.getOrderDetailById(id);
  }

  @GetMapping("/")
  public List<OrderdetailEntity> getOrderDetails() {
    return orderDetailService.getOrderDetails();
  }

  @GetMapping("/top-ten")
  public List<OrderdetailEntity> getTopTenOrders() {
    return orderDetailService.getTopTenOrderDetails();
  }
}

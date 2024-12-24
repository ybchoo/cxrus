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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/order-details")
@RestController
@ResponseBody
public class OrderDetailController {

  protected static final Logger logger = LoggerFactory.getLogger(OrderDetailController.class);

  @Autowired
  private final OrderDetailService orderDetailService;


  public OrderDetailController(OrderDetailService orderDetailService) {
    this.orderDetailService = orderDetailService;
  }

  @GetMapping("/{id}")
  public OrderdetailEntity getOrderDetailById(Integer id) {
    return orderDetailService.getOrderDetailById(id);
  }

  @GetMapping("/")
  public List<OrderdetailEntity> getOrderDetails() {
    System.out.println("Inside getOrderDetails");
    return orderDetailService.getOrderDetails();
  }

  @GetMapping("/top-ten")
  public List<OrderdetailEntity> getTopTenOrders() {
    System.out.println("Inside getTopTenOrders");
    return orderDetailService.getTopTenOrderDetails();
  }
}

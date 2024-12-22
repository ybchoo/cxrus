package com.cxrus.cyb.controller;
import java.util.List;
import java.util.Optional;

import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.service.OrderService;
import com.cxrus.cyb.service.ProductService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RequestMapping("/order")
@RestController
public class OrderController {

  private OrderService orderService;

  public OrderController(OrderService orderService) {
    this.orderService = orderService;
  }

  @GetMapping("/")
  public List<OrderEntity> getOrders() {
    return orderService.getOrders();
  }
}

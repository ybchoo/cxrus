package com.cxrus.cyb.controller;
import java.util.List;
import java.util.Optional;

import com.cxrus.cyb.entity.CustomerEntity;
import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.repositories.OrderRepository;
import com.cxrus.cyb.service.OrderService;
import com.cxrus.cyb.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;


@RestController
@ResponseBody
public class OrderController {
  protected static final Logger logger = LoggerFactory.getLogger(OrderController.class);
  @Autowired
  private final OrderService orderService;
  @Autowired
  private final OrderRepository orderRepository;

  public OrderController(
      OrderRepository orderRepository,
      OrderService orderService) {
    this.orderRepository = orderRepository;
    this.orderService = orderService;
  }
  @GetMapping("/orders/{id}")
  @ResponseStatus(code = HttpStatus.OK)
  public Optional<OrderEntity> getOrderById(Integer id) {
    logger.info("Inside getOrderById");
    System.out.println("Inside getOrderById");
    return orderService.getOrderById(id);
  }

  @GetMapping("/orders")
  @ResponseStatus(code = HttpStatus.OK)
  public List<OrderEntity> getOrders() {
    logger.info("Inside getOrders");
    System.out.println("Inside getOrders");
    return orderService.getOrders();
  }
}

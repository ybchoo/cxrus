package com.cxrus.cyb.controller;
import java.util.List;
import java.util.Optional;

import com.cxrus.cyb.entity.CustomerEntity;
import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.repositories.OrderRepository;
import com.cxrus.cyb.service.OrderService;
import com.cxrus.cyb.service.ProductService;
import io.swagger.v3.oas.annotations.Operation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;


@RequestMapping("/orders")
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

  @GetMapping("/{id}")
  @ResponseStatus(code = HttpStatus.OK)
  @Operation(summary = "Get Order By ID")
  public OrderEntity getOrderById(Integer id) {
    System.out.println("Inside getOrderById");
    return orderService.getOrderById(id);
  }

  @GetMapping("/")
  @ResponseStatus(code = HttpStatus.OK)
  @Operation(summary = "Get All Orders")
  public List<OrderEntity> getOrders() {
    System.out.println("Inside getOrders");
    return orderService.getOrders();
  }
}

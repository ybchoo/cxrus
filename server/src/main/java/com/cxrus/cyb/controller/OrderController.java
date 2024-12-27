package com.cxrus.cyb.controller;
import java.util.List;
import java.util.Optional;

import com.cxrus.cyb.entity.CustomerEntity;
import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.exception.CustomerIdExistException;
import com.cxrus.cyb.exception.handler.HandlerException;
import com.cxrus.cyb.repositories.OrderRepository;
import com.cxrus.cyb.service.OrderService;
import com.cxrus.cyb.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
public class OrderController {

  protected static final Logger logger =
      LoggerFactory.getLogger(OrderController.class);
  @Autowired
  private final OrderService orderService;

  public OrderController(
      OrderService orderService) {
    this.orderService = orderService;
  }

  @GetMapping("/order/{id}")
  @ResponseStatus(code = HttpStatus.OK)
  public ResponseEntity getOrderById(@PathVariable Long id) {
    System.out.println("Inside getCustomerById");
    logger.info("Inside getCustomerById");
    Optional<OrderEntity> _order = orderService.getOrderById(id);
    if (_order.isEmpty()) {
      HandlerException _handlerException = new HandlerException();
      return (ResponseEntity<OrderEntity>) _handlerException.handleCustomerNotFound(
          new CustomerIdExistException(String.format("Order  [",id+"] Not Found") ));
    }
    return ResponseEntity.ok(_order.get());
  }

  @GetMapping("/orders")
  @ResponseStatus(code = HttpStatus.OK)
  public ResponseEntity getOrders() {
    logger.info("Inside getOrders");
    System.out.println("Inside getOrders");
    List<OrderEntity> _orderList = orderService.getOrders();
    return ResponseEntity.ok(_orderList);
  }

  @GetMapping("/orders/top-ten")
  @ResponseStatus(code = HttpStatus.OK)
  public ResponseEntity getTopTenOrders() {
    logger.info("Inside Top Ten Orders");
    System.out.println("Inside Top Ten Orders");
    Optional<List<OrderEntity>> _orderList = orderService.getTopTenOrders();
    return ResponseEntity.ok(_orderList);
  }

  @PostMapping("/orders")
  public ResponseEntity saveProduct(@RequestBody OrderEntity orderEntity)
  {
    OrderEntity _order = orderService.saveProduct(orderEntity);
    return ResponseEntity.ok(_order);
  }

  @PutMapping("/order")
  public ResponseEntity updateOrder(@RequestBody OrderEntity orderEntity) {
    String _string = orderService.updateProduct(orderEntity);
    return ResponseEntity.ok(_string);
  }

  @DeleteMapping("/order/{id}")
  public ResponseEntity deleteOrder(@PathVariable int id) {
    String _string = orderService.deleteOrder(id);
    return ResponseEntity.ok(_string);
  }

}

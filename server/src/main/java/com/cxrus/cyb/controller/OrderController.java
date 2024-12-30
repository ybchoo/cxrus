package com.cxrus.cyb.controller;
import java.util.List;
import java.util.Optional;

import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping(
    consumes = MediaType.APPLICATION_JSON_VALUE,
    produces = MediaType.APPLICATION_JSON_VALUE)
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
    logger.info("============Inside getOrderById  [[["+id+"]]");
    System.out.println("===========Inside getOrderById");
    Optional<OrderEntity> _order =
        orderService.findOrderById(id);
    return ResponseEntity.ok( _order );
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

    OrderEntity _order =
        orderService.findByOrderId( orderEntity.getOrderId() );
    System.out.println("Product Id   [["+orderEntity.getOrderId()+"]]");
    System.out.println("Product Size   [["+_order.getOrderId()+"]]");

    _order.setCustomer(orderEntity.getCustomer());
    _order.setEmployeeId(orderEntity.getEmployeeId());
    _order.setOrderDate(orderEntity.getOrderDate());
    _order.setShipperId(orderEntity.getShipperId());
    return ResponseEntity.ok(
        orderService.updateOrder(_order));

  }

  @DeleteMapping("/order/{id}")
  public ResponseEntity deleteOrder(@PathVariable int id) {
    String _string = orderService.deleteOrder(id);
    return ResponseEntity.ok(_string);
  }

}

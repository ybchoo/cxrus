package com.cxrus.cyb.service;

import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.repositories.OrderRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
  protected static final Logger logger =
      LoggerFactory.getLogger(OrderService.class);

  @Autowired
  private final OrderRepository orderRepository;

  public OrderService(OrderRepository orderRepository)
  {
    this.orderRepository = orderRepository;
  }

  public Optional<OrderEntity> findOrderById(long id)
  {
    return orderRepository.findById( ((Number)id).intValue() );
  }
  public OrderEntity findByOrderId(long num) {
    return orderRepository.findByOrderId(num);
  }

  public List<OrderEntity> getOrders()
  {
    return orderRepository.findAll();
  }

  public Optional<List<OrderEntity>> getTopTenOrders() {
    return orderRepository.getTopTenOrder();
  }

  public OrderEntity saveProduct(OrderEntity orderEntity) {
    OrderEntity _orderEntity = orderRepository.save(orderEntity);
    return _orderEntity;
  }

  public String updateOrder(OrderEntity orderEntity) {
    if (orderEntity != null) {
      long _id = orderEntity.getOrderId();
      if (!orderRepository.findById((int)_id).isEmpty()) {
        orderRepository.save(orderEntity);
        return "Order ["+_id +"} Updated Successfully";
      } else {
        return "Order ["+_id +"} Not Found";
      }
    }
    return "Cannot Update Null Object";
  }

  public String deleteOrder(int id) {
    if (!orderRepository.findById(id).isEmpty()) {
      orderRepository.deleteById(id);
      return "Deleted Successfully";
    } else {
      return "Order Id Not Found";
    }
  }
}

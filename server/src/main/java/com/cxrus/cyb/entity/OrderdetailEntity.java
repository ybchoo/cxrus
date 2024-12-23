package com.cxrus.cyb.entity;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;
import lombok.*;
import java.util.*;
import java.math.*;

import org.springframework.data.annotation.Id;

@Data
@Table(name = "orderdetails")
public class OrderdetailEntity{
  @Id
//  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Integer orderDetailID;

  @Column(name = "OrderID")
  private Integer orderId;

  @Column(name = "ProductID")
  private Integer productId;

  @Column(name = "Quantity")
  private Integer quantity;


  public OrderdetailEntity(Integer orderDetailID, Integer orderId, Integer productId, Integer quantity) {
    this.orderDetailID = orderDetailID;
    this.orderId = orderId;
    this.productId = productId;
    this.quantity = quantity;
  }


  public Integer getOrderDetailID() {
    return orderDetailID;
  }

  public void setOrderDetailID(Integer orderDetailID) {
    this.orderDetailID = orderDetailID;
  }

  public Integer getOrderId() {
    return orderId;
  }

  public void setOrderId(Integer orderId) {
    this.orderId = orderId;
  }

  public Integer getProductId() {
    return productId;
  }

  public void setProductId(Integer productId) {
    this.productId = productId;
  }

  public Integer getQuantity() {
    return quantity;
  }

  public void setQuantity(Integer quantity) {
    this.quantity = quantity;
  }



}

package com.cxrus.cyb.entity;
import jakarta.persistence.*;

import java.time.LocalDate;
import lombok.Data;

@Entity
@Table(name = "orders")
public class OrderEntity {
  @Id
//  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Integer orderId;

//  @OneToOne(mappedBy = "match", fetch = FetchType.LAZY)

  @Column(name = "CustomerID")
  private Integer customerId;

  @Column(name = "EmployeeID")
  private Integer employeeId;

  @Column(name = "OrderDate")
  private LocalDate orderDate;

  @Column(name = "ShipperID")
  private Integer shipperId;

  public OrderEntity(Integer orderId, Integer customerId, Integer employeeId, LocalDate orderDate, Integer shipperId) {
    this.orderId = orderId;
    this.customerId = customerId;
    this.employeeId = employeeId;
    this.orderDate = orderDate;
    this.shipperId = shipperId;
  }

  public OrderEntity() {
  }

  public Integer getOrderId() {
    return orderId;
  }

  public void setOrderId(Integer orderId) {
    this.orderId = orderId;
  }

  public Integer getCustomerId() {
    return customerId;
  }

  public void setCustomerId(Integer customerId) {
    this.customerId = customerId;
  }

  public Integer getEmployeeId() {
    return employeeId;
  }

  public void setEmployeeId(Integer employeeId) {
    this.employeeId = employeeId;
  }

  public LocalDate getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(LocalDate orderDate) {
    this.orderDate = orderDate;
  }

  public Integer getShipperId() {
    return shipperId;
  }

  public void setShipperId(Integer shipperId) {
    this.shipperId = shipperId;
  }

}

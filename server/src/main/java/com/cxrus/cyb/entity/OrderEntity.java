package com.cxrus.cyb.entity;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.Objects;

import lombok.Data;

@Entity
@Table(name = "orders")
public class OrderEntity {
//  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long orderId;

//  @OneToOne(mappedBy = "match", fetch = FetchType.LAZY)

  @Column(name = "CustomerID")
  private Integer customerId;

  @Column(name = "EmployeeID")
  private Integer employeeId;

  @Column(name = "OrderDate")
  private LocalDate orderDate;

  @Column(name = "ShipperID")
  private Integer shipperId;

  public OrderEntity(Long orderId, Integer customerId, Integer employeeId, LocalDate orderDate, Integer shipperId) {
    this.orderId = orderId;
    this.customerId = customerId;
    this.employeeId = employeeId;
    this.orderDate = orderDate;
    this.shipperId = shipperId;
  }

  public OrderEntity() {
  }

  public Long getOrderId() {
    return orderId;
  }

  public void setOrderId(Long orderId) {
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

  @Override
  public boolean equals(Object o) {
    if (o == null || getClass() != o.getClass()) return false;
    OrderEntity that = (OrderEntity) o;
    return Objects.equals(orderId, that.orderId) && Objects.equals(customerId, that.customerId) && Objects.equals(employeeId, that.employeeId) && Objects.equals(orderDate, that.orderDate) && Objects.equals(shipperId, that.shipperId);
  }

  @Override
  public int hashCode() {
    return Objects.hash(orderId, customerId, employeeId, orderDate, shipperId);
  }

  @Override
  public String toString() {
    return "OrderEntity{" +
        "orderId=" + orderId +
        ", customerId=" + customerId +
        ", employeeId=" + employeeId +
        ", orderDate=" + orderDate +
        ", shipperId=" + shipperId +
        '}';
  }
}

package com.cxrus.cyb.entity;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.*;

@Entity
@NoArgsConstructor
@Table(name = "orders")
@JsonIdentityInfo(
    generator= ObjectIdGenerators.PropertyGenerator.class,
    property="orderId",
    scope=OrderEntity.class)

public class OrderEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @JsonProperty("orderId")
  @Column(name = "OrderID")
  private Long orderId;

  @Column(name = "EmployeeID")
  @JsonProperty("employeeId")
  private Integer employeeId;

  @Column(name = "OrderDate")
  @JsonProperty("orderDate")
  private LocalDate orderDate;

  @Column(name = "ShipperID")
  @JsonProperty("shipperId")
  private Integer shipperId;

  @ManyToOne
  @JoinColumn(name = "CustomerID", nullable = false)
  private CustomerEntity customer;

  public OrderEntity() {}

  public OrderEntity(CustomerEntity customer, Integer employeeId, LocalDate orderDate, Long orderId, Integer shipperId) {
    this.customer = customer;
    this.employeeId = employeeId;
    this.orderDate = orderDate;
    this.orderId = orderId;
    this.shipperId = shipperId;
  }

  public CustomerEntity getCustomer() {
    return customer;
  }

  public void setCustomer(CustomerEntity customer) {
    this.customer = customer;
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

  public Long getOrderId() {
    return orderId;
  }

  public void setOrderId(Long orderId) {
    this.orderId = orderId;
  }

  public Integer getShipperId() {
    return shipperId;
  }

  public void setShipperId(Integer shipperId) {
    this.shipperId = shipperId;
  }


}

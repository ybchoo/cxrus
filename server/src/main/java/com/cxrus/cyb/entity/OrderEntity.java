package com.cxrus.cyb.entity;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import lombok.Data;

@Entity
@Table(name = "orders")
public class OrderEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long orderId;

//  private Integer customerId;

  @Column(name = "EmployeeID")
  private Integer employeeId;

  @Column(name = "OrderDate")
  private LocalDate orderDate;

  @Column(name = "ShipperID")
  private Integer shipperId;

  @OneToOne(
      fetch = FetchType.LAZY,
      optional = false, // NOT NULL
      cascade = CascadeType.PERSIST
  )
  @JoinColumn(unique = true)
  private CustomerEntity customer;

  @ManyToMany
  @JoinTable(name = "orderdetails",
      joinColumns = @JoinColumn(name = "OrderID"),
      inverseJoinColumns = @JoinColumn(name = "ProductID"))
  private List<ProductEntity> productList =
        new ArrayList<>();

  public OrderEntity() {}

  public OrderEntity(CustomerEntity customer, Integer employeeId, LocalDate orderDate, Long orderId, Integer shipperId) {
    this.customer = customer;
    this.employeeId = employeeId;
    this.orderDate = orderDate;
    this.orderId = orderId;
    this.shipperId = shipperId;
  }

  public Long getOrderId() {
    return orderId;
  }

  public void setOrderId(Long orderId) {
    this.orderId = orderId;
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

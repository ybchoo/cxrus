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

  public OrderEntity(
      CustomerEntity customer,
      Integer employeeId,
      LocalDate orderDate,
      Long orderId,
      List<ProductEntity> productList,
      Integer shipperId) {
    this.customer = customer;
    this.employeeId = employeeId;
    this.orderDate = orderDate;
    this.orderId = orderId;
    this.productList = productList;
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

  public List<ProductEntity> getProductList() {
    return productList;
  }

  public void setProductList(List<ProductEntity> productList) {
    this.productList = productList;
  }

  public CustomerEntity getCustomer() {
    return customer;
  }

  public void setCustomer(CustomerEntity customer) {
    this.customer = customer;
  }
  @Override
  public boolean equals(Object o) {
    if (o == null || getClass() != o.getClass()) return false;
    OrderEntity that = (OrderEntity) o;
    return Objects.equals(orderId, that.orderId) && Objects.equals(employeeId, that.employeeId) && Objects.equals(orderDate, that.orderDate) && Objects.equals(shipperId, that.shipperId) && Objects.equals(customer, that.customer) && Objects.equals(productList, that.productList);
  }

  @Override
  public int hashCode() {
    return Objects.hash(orderId, employeeId, orderDate, shipperId, customer, productList);
  }

  @Override
  public String toString() {
    return "OrderEntity{" +
        "customer=" + customer +
        ", orderId=" + orderId +
        ", employeeId=" + employeeId +
        ", orderDate=" + orderDate +
        ", shipperId=" + shipperId +
        ", productList=" + productList +
        '}';
  }
}

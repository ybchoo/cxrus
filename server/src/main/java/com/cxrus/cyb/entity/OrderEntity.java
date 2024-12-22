package com.cxrus.cyb.entity;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDate;

import lombok.Data;

@Entity
@Table(name = "orders")
@Data

public class OrderEntity {
  @Id @GeneratedValue
  private Long customerId;
  private Integer orderId;
  private Integer employeeId;
  private LocalDate orderDate;
  private LocalDate requiredDate;
  private LocalDate shippedDate;
  private String shipVia;
  private String freight;
  private String shipName;
  private String shipAddress;
  private String shipCity;
  private String shipRegion;
  private Integer shipPostalCode;
  private String shipCountry;
}

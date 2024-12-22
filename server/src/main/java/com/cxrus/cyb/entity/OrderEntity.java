package com.cxrus.cyb.entity;
import jakarta.persistence.*;

import java.time.LocalDate;

import lombok.Data;

@Entity
@Table(name = "orders")
@Data

public class OrderEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer orderId;

  @OneToOne(mappedBy = "match", fetch = FetchType.LAZY)
  private String customerId;

  private Integer employeeId;
  private LocalDate orderDate;
  private LocalDate requiredDate;
  private LocalDate shippedDate;
  private Integer shipVia;
  private Float freight;
  private String shipName;
  private String shipAddress;
  private String shipCity;
  private String shipRegion;
  private String shipPostalCode;
  private String shipCountry;
}

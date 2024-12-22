package com.cxrus.cyb.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "orderdetails")
@Data
public class OrderdetailEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer orderDetailId;

  @ManyToOne(fetch = FetchType.LAZY)
  private Integer orderId;

  @ManyToOne(fetch = FetchType.LAZY)
  private Integer productId;
  private Float unitPrice;
  private Integer quantity;
  private Float discount;
}

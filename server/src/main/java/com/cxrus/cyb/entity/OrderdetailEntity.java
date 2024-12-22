package com.cxrus.cyb.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "orderdetails")
@Data
public class OrderdetailEntity {
  @Id @GeneratedValue
  private Integer orderDetailId;
  private Integer orderId;
  private Integer productId;
  private Float unitPrice;
  private Integer quantity;
  private Float discount;
}

package com.cxrus.cyb.entity;

import jakarta.persistence.*;
import lombok.Data;


@Entity
@Table(name = "products")
@Data
public class ProductEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer productId;
  private String productName;
  private Integer supplierId;
  private Integer categoryId;
  private String quantityPerUnit;
  private Float unitPrice;
  private Integer unitsInStock;
  private Integer unitsOnOrder;
  private Integer reorderLevel;
  private Integer discontinued;
}

package com.cxrus.cyb.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;


@Entity
@Table(name = "products")
@Data
public class ProductEntity {
  @Id @GeneratedValue
  private Integer productId;
  private String productName;
  private Integer supplierId;
  private Integer categoryId;
  private Integer quantityPerUnit;
  private Float unitPrice;
  private Integer unitsInStock;
  private Integer unitsOnOrder;
  private Integer reorderLevel;
  private Integer discontinued;
  private String shipCountry;
}

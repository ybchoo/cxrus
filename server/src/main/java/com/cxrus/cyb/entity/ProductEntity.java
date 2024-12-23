package com.cxrus.cyb.entity;

import jakarta.persistence.*;
import lombok.Data;


@Entity
@Table(name = "products")

public class ProductEntity {
  @Id
//  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long productId;

  @Column(name = "ProductName")
  private String productName;

  @Column(name = "SupplierID")
  private Integer supplierId;

  @Column(name = "CategoryID")
  private Integer categoryId;

  @Column(name = "Unit")
  private String quantityPerUnit;

  @Column(name = "Price")
  private Float unitPrice;

  private Integer unitsInStock;

  private Integer unitsOnOrder;

  private Integer reorderLevel;

  private Integer discontinued;

  public ProductEntity(){}

  public ProductEntity(Float unitPrice, String quantityPerUnit, Integer categoryId, Integer supplierId, String productName, Long productId) {
    this.unitPrice = unitPrice;
    this.quantityPerUnit = quantityPerUnit;
    this.categoryId = categoryId;
    this.supplierId = supplierId;
    this.productName = productName;
    this.productId = productId;
  }


  public Long getProductId() {
    return productId;
  }

  public void setProductId(Long productId) {
    this.productId = productId;
  }

  public String getProductName() {
    return productName;
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }

  public Integer getSupplierId() {
    return supplierId;
  }

  public void setSupplierId(Integer supplierId) {
    this.supplierId = supplierId;
  }

  public Integer getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(Integer categoryId) {
    this.categoryId = categoryId;
  }

  public String getQuantityPerUnit() {
    return quantityPerUnit;
  }

  public void setQuantityPerUnit(String quantityPerUnit) {
    this.quantityPerUnit = quantityPerUnit;
  }

  public Float getUnitPrice() {
    return unitPrice;
  }

  public void setUnitPrice(Float unitPrice) {
    this.unitPrice = unitPrice;
  }

  public Integer getUnitsInStock() {
    return unitsInStock;
  }

  public void setUnitsInStock(Integer unitsInStock) {
    this.unitsInStock = unitsInStock;
  }

  public Integer getUnitsOnOrder() {
    return unitsOnOrder;
  }

  public void setUnitsOnOrder(Integer unitsOnOrder) {
    this.unitsOnOrder = unitsOnOrder;
  }

  public Integer getReorderLevel() {
    return reorderLevel;
  }

  public void setReorderLevel(Integer reorderLevel) {
    this.reorderLevel = reorderLevel;
  }

  public Integer getDiscontinued() {
    return discontinued;
  }

  public void setDiscontinued(Integer discontinued) {
    this.discontinued = discontinued;
  }
}

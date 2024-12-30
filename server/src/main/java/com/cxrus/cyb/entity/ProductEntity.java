package com.cxrus.cyb.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "products")
@NoArgsConstructor
@AllArgsConstructor
@JsonIdentityInfo(
    generator= ObjectIdGenerators.PropertyGenerator.class,
    property="productId",
    scope=ProductEntity.class)

public class ProductEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @JsonProperty("productId")
  @Column(name ="ProductID")
  private Long productId;

  @JsonProperty("ProductName")
  @Column(name = "\"ProductName\"")
  private String productName;

  @Column(name = "SupplierID")
  @JsonProperty("supplierId")
  private Integer supplierId;

  @Column(name = "CategoryID")
  @JsonProperty("categoryId")
  private Integer categoryId;

  @Column(name = "Unit")
  @JsonProperty("quantityPerUnit")
  private String quantityPerUnit;

  @Column(name = "Price")
  @JsonProperty("unitPrice")
  private Float unitPrice;

  @JsonProperty("unitsInStock")
  @Column(name = "\nunits_in_stock\"")
  private Integer unitsInStock;

  @JsonProperty("unitsOnOrder")
  @Column(name = "\"units_on_order\"")
  private Integer unitsOnOrder;

  @JsonProperty("reorderLevel")
  private Integer reorderLevel;

  @JsonProperty("discontinued")
  private Integer discontinued;

  public Integer getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(Integer categoryId) {
    this.categoryId = categoryId;
  }

  public Integer getDiscontinued() {
    return discontinued;
  }

  public void setDiscontinued(Integer discontinued) {
    this.discontinued = discontinued;
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

  public String getQuantityPerUnit() {
    return quantityPerUnit;
  }

  public void setQuantityPerUnit(String quantityPerUnit) {
    this.quantityPerUnit = quantityPerUnit;
  }

  public Integer getReorderLevel() {
    return reorderLevel;
  }

  public void setReorderLevel(Integer reorderLevel) {
    this.reorderLevel = reorderLevel;
  }

  public Integer getSupplierId() {
    return supplierId;
  }

  public void setSupplierId(Integer supplierId) {
    this.supplierId = supplierId;
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




}

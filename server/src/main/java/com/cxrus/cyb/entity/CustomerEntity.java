package com.cxrus.cyb.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Data
@Entity
@NoArgsConstructor

@Table(name = "customers")
@JsonIdentityInfo(
    generator= ObjectIdGenerators.PropertyGenerator.class,
    property="customerID",
    scope=CustomerEntity.class)
public class CustomerEntity {

  @GeneratedValue(strategy = GenerationType.AUTO)
  @Id
  @JsonProperty("customerID")
  @Column(name="CustomerID")
  private Long customerID;

  @Column(name = "CustomerName")
  private String customerName;

  @Column(name = "ContactName")
  private String contactName;

  @Column(name = "Address")
  private String address;

  @Column(name = "City")
  private String city;

  @Column(name = "PostalCode")
  private String postalCode;

  @Column(name = "Country")
  private String country;


  public String getPostalCode() {
    return postalCode;
  }

  public void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  public String getCustomerName() {
    return customerName;
  }

  public void setCustomerName(String customerName) {
    this.customerName = customerName;
  }

  public Long getCustomerID() {
    return customerID;
  }

  public void setCustomerID(Long customerID) {
    this.customerID = customerID;
  }

  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }

  public String getContactName() {
    return contactName;
  }

  public void setContactName(String contactName) {
    this.contactName = contactName;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


}

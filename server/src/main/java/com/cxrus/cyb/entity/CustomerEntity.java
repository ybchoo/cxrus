package com.cxrus.cyb.entity;

import jakarta.persistence.*;


@Entity
@Table(name="customers")
public class CustomerEntity {

  @Id
//  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @GeneratedValue(strategy = GenerationType.AUTO)

  private Integer customerID;

  @Column(name = "PostalCode")
  private String postalCode;

  @Column(name = "Country")
  private String country;

  public CustomerEntity(Integer customerID, String customerName, String contactName, String address, String city, String postalCode, String country) {
    this.customerID = customerID;
    this.customerName = customerName;
    this.contactName = contactName;
    this.address = address;
    this.city = city;
    this.postalCode = postalCode;
    this.country = country;
  }

  public Integer getCustomerID() {
    return customerID;
  }

  public void setCustomerID(Integer customerID) {
    this.customerID = customerID;
  }

  public String getCustomerName() {
    return customerName;
  }

  public void setCustomerName(String customerName) {
    this.customerName = customerName;
  }

  public String getContactName() {
    return contactName;
  }

  public void setContactName(String contactName) {
    this.contactName = contactName;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getPostalCode() {
    return postalCode;
  }

  public void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }

  @Column(name = "CustomerName")
  private String customerName;

  @Column(name = "ContactName")
  private String contactName;

  @Column(name = "Address")
  private String address;

  @Column(name = "City")
  private String city;



}

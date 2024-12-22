package com.cxrus.cyb.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "customers")
@Data
public class CustomerEntity {

  @Id
  @GeneratedValue
  private Integer customerId;
  private String companyName;
  private String contactName;
  private String contactTitle;
  private String address;
  private String city;
  private String region;
  private Integer postalCode;
  private String country;
  private Integer phone;
  private Integer fax;

}

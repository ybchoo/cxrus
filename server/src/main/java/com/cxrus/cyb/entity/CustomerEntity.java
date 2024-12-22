package com.cxrus.cyb.entity;

import jakarta.persistence.*;

import lombok.Data;

@Entity
@Table(name = "customers")
@Data
public class CustomerEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer customerId;
  private String companyName;
  private String contactName;
  private String contactTitle;
  private String address;
  private String city;
  private String region;
  private String postalCode;
  private String country;
  private String phone;
  private String fax;

}

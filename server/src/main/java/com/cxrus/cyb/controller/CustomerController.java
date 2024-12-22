package com.cxrus.cyb.controller;
import java.util.List;
import java.util.Optional;

import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.service.OrderService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cxrus.cyb.service.CustomerService;
import  com.cxrus.cyb.entity.CustomerEntity;

@RequestMapping("/customer")
@RestController
public class CustomerController {

  private CustomerService customerService;

  public CustomerController(CustomerService customerService) {
    this.customerService = customerService;
  }

  @GetMapping("/")
  public List<CustomerEntity> getCustomers() {
    return customerService.getCustomers();
  }
}

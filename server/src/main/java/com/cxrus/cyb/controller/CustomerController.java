package com.cxrus.cyb.controller;
import java.util.List;
import java.util.Optional;

import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.repositories.CustomerRepository;
import com.cxrus.cyb.service.OrderService;

import com.cxrus.cyb.service.CustomerService;
import com.cxrus.cyb.entity.CustomerEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/customers")
@ResponseBody
public class CustomerController {
  protected static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
  @Autowired
  private final CustomerService customerService;
  @Autowired
  private final CustomerRepository customerRepository;

  public CustomerController(
      CustomerRepository customerRepository,
      CustomerService customerService) {
    this.customerRepository = customerRepository;
    this.customerService = customerService;
  }

  @GetMapping("/{id}")
  @ResponseStatus(code = HttpStatus.OK)
  public CustomerEntity getCustomerById(Integer id) {
    System.out.println("Inside getCustomerById");
    logger.info("Inside getCustomerById");
    return customerService.getCustomerById(id);
  }

  @GetMapping("/")
  @ResponseStatus(code = HttpStatus.OK)
  public List<CustomerEntity> getCustomers() {
    logger.info("Inside getCustomers");
    System.out.println("Inside getCustomers");
    return customerService.getCustomers();
  }

  @GetMapping("/topten")
  @ResponseStatus(code = HttpStatus.OK)
  public List<CustomerEntity> getTopTenCustomers() {
    logger.info("Inside getTopTenCustomers");
    System.out.println("Inside getTopTenCustomers");
    return customerService.getCustomers();
  }
}

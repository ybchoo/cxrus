package com.cxrus.cyb.controller;
import java.util.List;
import java.util.Optional;

import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.exception.CustomerIdExistException;
import com.cxrus.cyb.exception.handler.HandlerException;

import com.cxrus.cyb.service.CustomerService;
import com.cxrus.cyb.entity.CustomerEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping(
    consumes = MediaType.APPLICATION_JSON_VALUE,
    produces = MediaType.APPLICATION_JSON_VALUE)
public class CustomerController {
  protected static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
  @Autowired
  private final CustomerService customerService;

  public CustomerController(
      CustomerService customerService) {
    System.out.println("Inside Customer Controller");
    this.customerService = customerService;
  }
  @GetMapping("/customer/{id}")
  @ResponseStatus(code = HttpStatus.OK)
  public ResponseEntity<Optional<CustomerEntity>> getCustomerById(@PathVariable Integer id) {
    logger.info("============Inside getCustomerById  [[["+id+"]]");
    System.out.println("===========Inside getCustomerById");
    Optional<CustomerEntity> _customer =
        customerService.getCustomerById(id);
    return ResponseEntity.ok( _customer );
  }

  @GetMapping("/customers")
  public ResponseEntity getCustomers() {
    logger.info("=========================");
    logger.info("Inside getCustomers");
    System.out.println("=========================");
    System.out.println("Inside getCustomers");
    List<CustomerEntity> _customerList =
        customerService.getCustomers();
    return ResponseEntity.ok(_customerList);
  }

  @GetMapping("/customers/top-ten")
  public ResponseEntity getTopTenCustomers() {
    logger.info("Inside getTopTenCustomers");
    System.out.println("Inside getTopTenCustomers");
    List<CustomerEntity> _customerList =
        customerService.getCustomers();
    return ResponseEntity.ok(_customerList);
  }

  @PostMapping("/customer")
  public ResponseEntity  saveProduct(@RequestBody CustomerEntity customerEntity) {
    CustomerEntity _customer =
        customerService.saveProduct(customerEntity);
    return ResponseEntity.ok(_customer);
  }

  @PutMapping("/customer")
  public ResponseEntity updateCustomer(
      @RequestBody CustomerEntity customerEntity) {




    String _string =
        customerService.updateCustomer(customerEntity);
    return ResponseEntity.ok(_string);
  }

  @DeleteMapping("/customer/{id}")
  public ResponseEntity deleteCustomer
    (@Valid @PathVariable int id) {
    
    if (customerService.getCustomerById(id) == null) {
            return new ResponseEntity<>(
          "ID not found", 
          HttpStatus.NOT_FOUND);
    }
    String _string = customerService.deleteCustomer(id);
    return ResponseEntity.ok(_string);
  }
}

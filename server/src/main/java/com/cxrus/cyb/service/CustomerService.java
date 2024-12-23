package com.cxrus.cyb.service;
import com.cxrus.cyb.entity.CustomerEntity;
import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.repositories.CustomerRepository;
import com.cxrus.cyb.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class CustomerService {

  @Autowired
  private final CustomerRepository customerRepository;
//  private final OrderRepository orderRepository;

  @Autowired
  public CustomerService(
      CustomerRepository customerRepository) {
    this.customerRepository = customerRepository;

  }

  public CustomerEntity getCustomerById(int id) {
    return null;
  }

  public List<CustomerEntity> getCustomers() {
    return null;
  }

  public List<CustomerEntity> getTopTenCustomers() {
    return null;
  }

}

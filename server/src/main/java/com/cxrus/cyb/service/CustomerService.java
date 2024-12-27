package com.cxrus.cyb.service;
import com.cxrus.cyb.entity.CustomerEntity;
import com.cxrus.cyb.repositories.CustomerRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerService {

  protected static final Logger logger =
      LoggerFactory.getLogger(CustomerService.class);
  @Autowired
  private final CustomerRepository customerRepository;

  @Autowired
  public CustomerService(
      CustomerRepository customerRepository) {
    this.customerRepository = customerRepository;

  }

  public Optional<CustomerEntity> getCustomerById(int id) {
    return customerRepository.findById(id);
  }

  public List<CustomerEntity> getCustomers()
  {
    return customerRepository.findAll();
  }

  public Optional<List<CustomerEntity>> getTopTenCustomers()
  {
    return customerRepository.getTopTenCustomers();
  }

  public CustomerEntity saveProduct(CustomerEntity customerEntity) {
    CustomerEntity _customerEntity = customerRepository.save(customerEntity);
    return _customerEntity;
  }

  public String updateCustomer(CustomerEntity customerEntity) {
    if (customerEntity != null) {
      long _id = customerEntity.getCustomerID();
      if (!customerRepository.findById((int)_id).isEmpty()) {
        customerRepository.save(customerEntity);
        return "Customer ["+_id +"} Updated Successfully";
      } else {
        return "Customer ["+_id +"} Not Found";
      }
    }
    return "Cannot Update Null Object";
  }

  public String deleteCustomer(int id) {
    if (!customerRepository.findById(id).isEmpty()) {
      customerRepository.deleteById(id);
      return "Deleted Successfully";
    } else {
      return "Customer Id Not Found";
    }
  }


}

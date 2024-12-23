package com.cxrus.cyb.service;

import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
  @Autowired
  private final ProductRepository productRepository;

  public ProductService(ProductRepository productRepository) {
    this.productRepository =productRepository;
  }

  public ProductEntity getProductById(int id) {
    return null;
  }

  public List<ProductEntity> getProducts() {
    return null;
  }

  public List<ProductEntity> getTopTenProducts() {
    return null;
  }
}

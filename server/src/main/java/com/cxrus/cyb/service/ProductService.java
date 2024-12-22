package com.cxrus.cyb.service;

import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.repositories.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
  private final ProductRepository productRepository;

  public ProductService(ProductRepository productRepository) {
    this.productRepository =productRepository;
  }

  public List<ProductEntity> getProducts() {
    return null;
  }

}

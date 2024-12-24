package com.cxrus.cyb.service;

import com.cxrus.cyb.controller.ProductController;
import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.repositories.ProductRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductService {

  protected static final Logger logger =
      LoggerFactory.getLogger(ProductService.class);

  @Autowired
  private final ProductRepository productRepository;

  public ProductService(ProductRepository productRepository) {
    this.productRepository =productRepository;
  }


  public Optional<ProductEntity> getProductById(long id) {
    System.out.println("======================== [["+id+"]]");
    logger.info("======================== [["+id+"]]" );
    return productRepository.findById(  ((Number)id).intValue()  );
  }

  public List<ProductEntity> getProducts() {
    return productRepository.findAll();
  }

  public ProductEntity findByProductId(long num) {
    return productRepository.findByProductId(num);
  }

  public List<ProductEntity> getTopTenProducts() {
    return productRepository.getTopTenProduct()
        .stream().limit(10).collect(Collectors.toList());
  }

  public ProductEntity saveProduct(ProductEntity productEntity) {
    ProductEntity _productEntity = productRepository.save(productEntity);
    return _productEntity;
  }

  public String updateProduct(ProductEntity productEntity) {
    if (productEntity != null) {
      long _id = productEntity.getProductId();
      if (!productRepository.findById((int)_id).isEmpty()) {
        productRepository.save(productEntity);
        return "Product ["+_id +"} Updated Successfully";
      } else {
        return "Product ["+_id +"} Not Found";
      }
    }
    return "Cannot Update Null Object";
  }

  public String deleteProduct(int id) {
    if (!productRepository.findById(id).isEmpty()) {
      productRepository.deleteById(id);
      return "Deleted Successfully";
    } else {
      return "Product Id Not Found";
    }
  }
}

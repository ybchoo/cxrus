package com.cxrus.cyb.controller;
import java.util.List;


import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.repositories.ProductRepository;
import com.cxrus.cyb.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/products")
@RestController
public class ProductController {
  protected static final Logger logger = LoggerFactory.getLogger(ProductController.class);
//  @Autowired
//  private final ProductRepository productRepository;

  @Autowired
  private final ProductService productService;

  public ProductController(
      ProductService productService) {
    this.productService = productService;
  }

  @GetMapping("/{id}")
  public ProductEntity getProductById(Integer id) {
    logger.info("Inside getProductById");
    System.out.println("Inside getProductById");
    return productService.getProductById(id);
  }

  @GetMapping("/")
  public List<ProductEntity> getProducts() {
    logger.info("Inside getProducts");
    System.out.println("Inside getProducts");
    return productService.getProducts();
  }

  @GetMapping("/top-ten")
  public List<ProductEntity> getTopTenProducts() {
    logger.info("Inside getTopTenProducts");
    System.out.println("Inside getTopTenProducts");
    return productService.getProducts();
  }
}

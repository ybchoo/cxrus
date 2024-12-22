package com.cxrus.cyb.controller;
import java.util.List;

import com.cxrus.cyb.entity.OrderdetailEntity;
import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.service.ProductService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/products")
@RestController
public class ProductController {

  private ProductService productService;

  public ProductController(ProductService productService) {
    this.productService = productService;
  }

  @GetMapping("/{id}")
  public ProductEntity getProductById(Integer id) {
    return productService.getProductById(id);
  }

  @GetMapping("/")
  public List<ProductEntity> getProducts() {
    return productService.getProducts();
  }

  @GetMapping("/top-ten")
  public List<ProductEntity> getTopTenProducts() {
    return productService.getProducts();
  }
}

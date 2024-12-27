package com.cxrus.cyb.controller;
import java.util.List;
import java.util.Optional;


import com.cxrus.cyb.entity.CustomerEntity;
import com.cxrus.cyb.entity.ProductEntity;
import com.cxrus.cyb.exception.CustomerIdExistException;
import com.cxrus.cyb.exception.ProductIdExistException;
import com.cxrus.cyb.exception.handler.HandlerException;
import com.cxrus.cyb.repositories.ProductRepository;
import com.cxrus.cyb.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

@RestController
public class ProductController {
  protected static final Logger logger = LoggerFactory.getLogger(ProductController.class);


  @Autowired
  private final ProductService productService;

  public ProductController(
      ProductService productService) {
    this.productService = productService;
  }

  @GetMapping("/product/{id}")
  public ResponseEntity getProductById(@PathVariable Long id) {
    logger.info("============Inside getProductById  [[["+id+"]]");
    System.out.println("===========Inside getProductById");
    Optional<ProductEntity> _product =
        productService.getProductById(id);
    return ResponseEntity.ok( _product );
  }

  @GetMapping("/products")
  public ResponseEntity getProducts() {
    logger.info("Inside getProducts");
    System.out.println("Inside getProducts");
    List<ProductEntity> _productList = productService.getProducts();
    return ResponseEntity.ok(_productList);
  }

  @GetMapping("/products/top-ten")

  public ResponseEntity getTopTenProducts() {
    logger.info("========== Inside getTopTenProducts");
    System.out.println("========== Inside getTopTenProducts");
    List<ProductEntity> _productList =
        productService.getTopTenProducts();
    return ResponseEntity.ok(_productList);
  }

  @PostMapping("/product")
  @ResponseBody
  public ResponseEntity saveProduct(@RequestBody ProductEntity productEntity) {
    return ResponseEntity.ok(productService.saveProduct(productEntity));
  }

  @PutMapping("/product")
  @ResponseStatus( code = HttpStatus.NO_CONTENT )
  @ResponseBody
  public ResponseEntity updateProduct(
      @RequestBody ProductEntity productEntity) {


    ProductEntity _product =
        productService.findByProductId( productEntity.getProductId() );
    System.out.println("Product Id   [["+productEntity.getProductId()+"]]");
    System.out.println("Product Size   [["+_product.getProductId()+"]]");

    _product.setProductName(productEntity.getProductName());
    _product.setCategoryId(productEntity.getCategoryId());
    _product.setDiscontinued(productEntity.getDiscontinued());
    _product.setQuantityPerUnit(productEntity.getQuantityPerUnit());
    _product.setReorderLevel(productEntity.getReorderLevel());
    _product.setSupplierId(productEntity.getSupplierId());
    _product.setUnitPrice(productEntity.getUnitPrice());
    _product.setUnitsInStock(productEntity.getUnitsInStock());
    _product.setUnitsOnOrder(productEntity.getUnitsOnOrder());
    return ResponseEntity.ok(productService.updateProduct(_product));
  }
  @DeleteMapping("/product/{id}")
  public String deleteProduct(@PathVariable int id) {
    return productService.deleteProduct(id);
  }
}

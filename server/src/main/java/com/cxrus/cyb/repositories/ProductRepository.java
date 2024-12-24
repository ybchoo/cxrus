package com.cxrus.cyb.repositories;

import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.entity.ProductEntity;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
@Qualifier("products")
public interface ProductRepository extends JpaRepository<ProductEntity, Integer> {

  @Query(value = "SELECT * FROM cxrus.products where productId = %:num% ", nativeQuery = true)
  ProductEntity findByProductId(@Param("num")  long num);

  @Query(value = "SELECT * FROM cxrus.products LIMIT 0,10", nativeQuery = true)
  List<ProductEntity> getTopTenProduct();

}

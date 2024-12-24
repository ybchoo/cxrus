package com.cxrus.cyb.repositories;

import com.cxrus.cyb.entity.CustomerEntity;
import com.cxrus.cyb.entity.OrderEntity;
import com.cxrus.cyb.entity.ProductEntity;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
@Qualifier("orders")
public interface OrderRepository extends JpaRepository<OrderEntity, Integer>{

  @Query(value = "SELECT * FROM  cxrus.orders LIMIT 0, 10;", nativeQuery = true)
  Optional<List<OrderEntity>> getTopTenOrder();
}

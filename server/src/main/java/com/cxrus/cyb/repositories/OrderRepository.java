package com.cxrus.cyb.repositories;

import com.cxrus.cyb.entity.CustomerEntity;
import com.cxrus.cyb.entity.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<CustomerEntity, Long>{
  Optional<OrderEntity> findByStartEndDate(LocalDateTime startDate, LocalDateTime endDate);
}

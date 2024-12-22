package com.cxrus.cyb.repositories;

import com.cxrus.cyb.entity.OrderdetailEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderdetailEntity, Long> {
}

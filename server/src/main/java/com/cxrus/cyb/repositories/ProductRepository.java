package com.cxrus.cyb.repositories;

import com.cxrus.cyb.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository  extends JpaRepository<ProductEntity, Long> {
}

package com.cxrus.cyb.repositories;

import com.cxrus.cyb.entity.OrderdetailEntity;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@Qualifier("orderdetails")
public interface OrderDetailRepository extends JpaRepository<OrderdetailEntity, Integer> {

}

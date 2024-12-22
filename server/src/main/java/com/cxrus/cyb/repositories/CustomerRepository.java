package com.cxrus.cyb.repositories;

import com.cxrus.cyb.entity.CustomerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;


@Repository
public interface CustomerRepository extends JpaRepository<CustomerEntity, Long>{
  Optional<CustomerEntity> findByStartEndDate(LocalDateTime startDate, LocalDateTime endDate);

  @Modifying
  @Query(nativeQuery = true, value = "UPDATE cards " + //
      "SET album_id = r.album_id  " + //
      "FROM " + //
      "(SELECT available.album_id, (SELECT c2.id from cards c2 where c2.owner_id=?1 AND c2.player_id = available.player_id AND c2.album_id IS NULL LIMIT 1) as card_id "
      + //
      "FROM " + //
      "(SELECT DISTINCT a.id as album_id, c.player_id FROM albums a CROSS JOIN cards c WHERE a.owner_id=?1 AND c.owner_id=?1 AND c.album_id IS NULL AND c.player_id NOT IN (SELECT uc.player_id from cards uc WHERE uc.album_id = a.id)) available) as r "
      + //
      "WHERE cards.id = r.card_id " +
      "RETURNING cards.*")
  List<CustomerEntity> getTopTenCustomerByDate(LocalDateTime startDate, LocalDateTime endDate);

}

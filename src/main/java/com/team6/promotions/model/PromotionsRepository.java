package com.team6.promotions.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import org.springframework.data.repository.query.Param;

import jakarta.transaction.Transactional;

@Repository
public interface PromotionsRepository extends JpaRepository<Promotions, String> {

    //訂單用折扣碼查詢折扣
	@Transactional
	@Modifying
	@Query(value = "SELECT * from Promotions p WHERE p.Promotions_startDate < GETDATE() AND p.Promotions_endDate >= GETDATE();",nativeQuery = true)
	List<Promotions> findEfficientDiscountList();

    //查詢本月的優惠
    @Query("SELECT p FROM Promotions p WHERE MONTH(p.Promotions_startdate) = MONTH(CURRENT_DATE) AND YEAR(p.Promotions_startdate) = YEAR(CURRENT_DATE)")
    List<Promotions> findPromotionsForCurrentMonth();

    //前端用名稱查詢折扣碼
    @Query("SELECT p FROM Promotions p WHERE p.Promotions_name = :promotionsName")
    Promotions findPromotionsByPromotionsName(@Param("promotionsName") String promotionsName);

}

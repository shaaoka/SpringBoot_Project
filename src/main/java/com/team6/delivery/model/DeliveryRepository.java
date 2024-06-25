package com.team6.delivery.model;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface DeliveryRepository extends JpaRepository<Delivery, Integer> {

	//修改為已接單
	@Modifying
	@Transactional
	@Query(value = "UPDATE Delivery SET status = 2 WHERE delivery_id = ?", nativeQuery = true)
	public void upddeliverystate(Integer id);
	//復原訂單
	@Modifying
	@Transactional
	@Query(value = "UPDATE Delivery SET status = 1 WHERE delivery_id = ?", nativeQuery = true)
	public void rollback(Integer id);
	//修改外送員工姓名和外送狀態
	@Modifying
	@Transactional
	@Query(value = "UPDATE Delivery SET status = 3, ename = ?  ,starttime = GETDATE() WHERE delivery_id =?", nativeQuery = true)
	public void upddeliveryename(String ename,Integer id);
	//修改為已取消
	@Modifying
	@Transactional
	@Query(value = "UPDATE Delivery SET status = 0 WHERE delivery_id = ?", nativeQuery = true)
	public void upddeliverystatezero(Integer id);
	//修改為已送達
	@Modifying
	@Transactional
	@Query(value = "UPDATE Delivery  SET status = 4, endtime = GETDATE()  WHERE delivery_id = ?", nativeQuery = true)
	public void upddeliveryEnd(Integer id);
	
	//一次修改多筆
	@Modifying
	@Transactional
	@Query(value = "UPDATE Delivery SET status = 2 ,starttime = GETDATE()  WHERE status = 3;", nativeQuery = true)
	public void upddeliveyall();
	//一次修改多筆外送結束
	@Modifying
	@Transactional
	@Query(value = "UPDATE Delivery SET status = 4 ,endtime = GETDATE()  WHERE status = 3;", nativeQuery = true)
	public void endall();
//	===============================下面是查詢====================================================//
	//查詢 狀態!=0
	@Transactional
	@Query(value = "SELECT * FROM Delivery WHERE status != 0", nativeQuery = true)
	public List<Delivery> findallnotZero();
	//查詢 狀態為1
	@Transactional
	@Query(value = "SELECT * FROM Delivery WHERE status = 1", nativeQuery = true)
	public List<Delivery> findallOne();
	//查詢 狀態為2
	@Transactional
	@Query(value = "SELECT * FROM Delivery WHERE status = 2", nativeQuery = true)
	public List<Delivery> findallTwo();
	//查詢 狀態為3
	@Transactional
	@Query(value = "SELECT * FROM Delivery WHERE status = 3", nativeQuery = true)
	public List<Delivery> findallThree();
	//查詢 狀態為4
	@Transactional
	@Query(value = "SELECT * FROM Delivery WHERE status = 4", nativeQuery = true)
	public List<Delivery> findallFour();
	//查詢 狀態為0
	@Transactional
	@Query(value = "SELECT * FROM Delivery WHERE status = 0", nativeQuery = true)
	public List<Delivery> findallZero();
	
	@Transactional
	@Query(value = "INSERT INTO Delivery(order_id,date,address) VALUES ('?',GETDATE(),'?')", nativeQuery = true)
	public Delivery  add(String orderid,String address);
	
//	@Transactional
//	@Query(value = "Select count('蔡政恩') from Delivery where ename like '%蔡政恩%", nativeQuery = true)
//	public void FindEname();
	@Transactional(readOnly = true)
	@Query(value = "SELECT COUNT(*) FROM Delivery WHERE ename LIKE %:ename%", nativeQuery = true)
	int countByEname(@Param("ename") String ename);
}

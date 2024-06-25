package com.team6.product.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<ProductBean, Integer> {

	@Query(value = "from ProductBean where productName like concat('%',?1,'%') order by productCreateDate DESC, productId DESC")
	List<ProductBean> findByNameLike(String name);
	
//	@Query(value = "from ProductBean order by productCreateDate DESC, productId DESC")
	@Query(value = "from ProductBean")
	List<ProductBean> findAll();
	
	//查詢已上架產品
	@Query(value = "FROM ProductBean WHERE productState.productStateId = 1")
	Page<ProductBean> findAllProductWithState(Pageable pageable);
	
	//查詢已上架分類產品
	@Query(value = "FROM ProductBean WHERE productState.productStateId = 1 AND categoryId = ?1")
	Page<ProductBean> findAllProductWithStateAndCategory(Integer categoryId,Pageable pageable);
	
	//模糊查詢 套版
	@Query(value = "from ProductBean where productName like concat('%',?1,'%') AND productState.productStateId = 1 ")
	List<ProductBean> findByNameLikeWithState(String name);

	// 隨機查詢數筆產品 NEWID() -> SQL生成唯一標識(GUID) 搭配 ORDER BY 可以隨機排序
	@Query(value = "FROM ProductBean WHERE productState.productStateId = 1 ORDER BY FUNCTION('NEWID') ")
	List<ProductBean> findRandomProducts(Pageable pageable);

	
	
	
}

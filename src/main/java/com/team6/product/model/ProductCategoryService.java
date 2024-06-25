package com.team6.product.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service @Transactional
public class ProductCategoryService {

	@Autowired
	private ProductCategoryRepository pCategoryRepository;
	
	public ProductCategory findProductCategoryById(Integer id) {
		return pCategoryRepository.findById(id).get();
	}
	
	public List<ProductCategory> findAllProductCategory() {
		return pCategoryRepository.findAll();
	}
	
}

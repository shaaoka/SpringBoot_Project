package com.team6.product.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class ProductStateService {
	
	@Autowired
	private ProductStateRepository pSRespository;
	
	public ProductState findProductStateById(Integer id) {
		return pSRespository.findById(id).get();
	}
	
	public List<ProductState> findAllProductState() {
		return pSRespository.findAll();
	}

}

package com.team6.product.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service @Transactional
public class TestPageService {

	@Autowired
	private TestPageRepository tRepository;
	
	public Page<TestPage> findTestPageAll(Pageable pageable){
		return tRepository.findTestPageAll(pageable);
	}
	
	public Page<TestPage> findTestPageWithState(int state, String name, Pageable pageable){
		return tRepository.findTestPageWithState(state, name, pageable);
	}
	
}

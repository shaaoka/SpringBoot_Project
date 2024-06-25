package com.team6.product.dto;

public class ProductStateDto {
	
	private Integer ProductStateId;
	
	private String ProductStateName;
	
//	------------------------
	public ProductStateDto() {
	}
	
	public ProductStateDto(Integer productStateId, String productStateName) {
		this.ProductStateId = productStateId;
		this.ProductStateName = productStateName;
	}
//	------------------------

	public Integer getProductStateId() {
		return ProductStateId;
	}

	public void setProductStateId(Integer productStateId) {
		ProductStateId = productStateId;
	}

	public String getProductStateName() {
		return ProductStateName;
	}

	public void setProductStateName(String productStateName) {
		ProductStateName = productStateName;
	}


}

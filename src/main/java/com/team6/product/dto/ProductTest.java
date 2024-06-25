package com.team6.product.dto;

import org.springframework.web.bind.annotation.RequestParam;

public class ProductTest {
	private Integer  quantity;
	private Integer productId;
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	


}

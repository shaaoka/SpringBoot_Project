package com.team6.product.dto;

public class ProductCategoryDto {
	
	private Integer CategoryId;
	
	private String CategoryName;
	
//	--------------------------
	public ProductCategoryDto() {
	}
	
	public ProductCategoryDto(Integer categoryId, String categoryName) {
		this.CategoryId = categoryId;
		this.CategoryName = categoryName;
	}

//	--------------------------

	public Integer getCategoryId() {
		return CategoryId;
	}

	public void setCategoryId(Integer categoryId) {
		CategoryId = categoryId;
	}

	public String getCategoryName() {
		return CategoryName;
	}

	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}

	

}

package com.team6.product.dto;

import java.time.LocalDate;

public class ProductBeanDto {

	private Integer productId;

	private Integer CategoryId; 
	
	private String productName;

	private String productDesc;

	private String productImg_url;

	private Integer productPrice;

	private Integer productQuantity;

	private LocalDate productCreateDate;

	private ProductCategoryDto productCategory;
	
	private ProductStateDto productState;
//------------------測試----------------------	
	private String CategoryName;
	private String ProductStateName;
	
//	----------------------------------

	public ProductBeanDto() {
	}

	public ProductBeanDto(Integer productId, Integer categoryId, String productName, String productDesc,
			String productImg_url, Integer productPrice, Integer productQuantity, LocalDate productCreateDate,
			ProductCategoryDto productCategory, ProductStateDto productState) {
		this.productId = productId;
		this.CategoryId = categoryId;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productImg_url = productImg_url;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.productCreateDate = productCreateDate;
		this.productCategory = productCategory;
		this.productState = productState;
	}

	public ProductBeanDto(Integer productId, String categoryName, String productName, String productDesc,
			String productImg_url, Integer productPrice, Integer productQuantity, LocalDate productCreateDate,
			String productStateName) {
		this.productId = productId;
		this.CategoryName = categoryName;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productImg_url = productImg_url;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.productCreateDate = productCreateDate;
		this.ProductStateName = productStateName;
	}
	
//	----------------------------------
	

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getCategoryId() {
		return CategoryId;
	}

	public void setCategoryId(Integer categoryId) {
		CategoryId = categoryId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getProductImg_url() {
		return productImg_url;
	}

	public void setProductImg_url(String productImg_url) {
		this.productImg_url = productImg_url;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}

	public LocalDate getProductCreateDate() {
		return productCreateDate;
	}

	public void setProductCreateDate(LocalDate productCreateDate) {
		this.productCreateDate = productCreateDate;
	}

	public ProductCategoryDto getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategoryDto productCategory) {
		this.productCategory = productCategory;
	}

	public ProductStateDto getProductState() {
		return productState;
	}

	public void setProductState(ProductStateDto productState) {
		this.productState = productState;
	}
//-------------------測試--------------

	public String getCategoryName() {
		return CategoryName;
	}

	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}

	public String getProductStateName() {
		return ProductStateName;
	}

	public void setProductStateName(String productStateName) {
		ProductStateName = productStateName;
	}

}

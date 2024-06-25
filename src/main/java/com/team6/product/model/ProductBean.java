package com.team6.product.model;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "product")
@Component
public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PRODUCTID")
	private Integer productId;

	@Column(name = "CATEGORYID")
	private Integer categoryId;

	@Column(name = "PRODUCTNAME")
	private String productName;

	@Column(name = "PRODUCTDESC")
	private String productDesc;

	@Column(name = "PRODUCTIMG_URL")
	private String productImg_url;

	@Column(name = "PRODUCTPRICE")
	private Integer productPrice;

	@Column(name = "PRODUCTQUANTITY")
	private Integer productQuantity;

	@Column(name = "PRODUCTCREATEDATE")
	private LocalDate productCreateDate;

	@JsonIgnore 
	@JoinColumn(name = "CATEGORYID", insertable = false, updatable = false)
	@ManyToOne(fetch = FetchType.LAZY)
	private ProductCategory productCategory;
	
	// 避免傳一個集合到前台,所以用這個方式抓資料
	
	@Transient // 表示這個屬性不會對應到資料庫
	private String categoryName;
		
	public String getCategoryName() {
		return productCategory.getCategoryName();
	}

	@JsonIgnore //order的設計不需要處理無限迴圈先註解
	@JoinColumn(name = "PRODUCTSTATEID", insertable = false, updatable = true)
	@ManyToOne(fetch = FetchType.LAZY)
	private ProductState productState;
	
	@Transient
	private String stateName;
	
	public String getStateName() {
		return productState.getProductStateName();
	}
	
	@Transient
	private Integer stateId;
	
	public Integer getStateId() {
		return productState.getProductStateId();
	}

	
	//	----------------------
	public ProductBean() {
	}

//	新增有圖案用的
	public ProductBean(Integer categoryId, String productName, String productDesc, String productImg_url,
			Integer productPrice, ProductState productState, Integer productQuantity, LocalDate productCreateDate) {
		this.categoryId = categoryId;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productImg_url = productImg_url;
		this.productPrice = productPrice;
		this.productState = productState;
		this.productQuantity = productQuantity;
		this.productCreateDate = productCreateDate;
	}

//	新增沒圖案用的
	public ProductBean(Integer categoryId, String productName, String productDesc, Integer productPrice,
			ProductState productState, Integer productQuantity, LocalDate productCreateDate) {
		this.categoryId = categoryId;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productPrice = productPrice;
		this.productState = productState;
		this.productQuantity = productQuantity;
		this.productCreateDate = productCreateDate;
	}

//	修改用的	old
	public ProductBean(Integer productId, Integer categoryId, String productName, String productDesc,
			String productImg_url, Integer productPrice, ProductState productState, Integer productQuantity, LocalDate productCreateDate) {
		this.productId = productId;
		this.categoryId = categoryId;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productImg_url = productImg_url;
		this.productPrice = productPrice;
		this.productState = productState;
		this.productQuantity = productQuantity;
		this.productCreateDate = productCreateDate;
	}

//	修改用的	new(套版的版本)	
	public ProductBean(Integer productId, Integer categoryId, String productName, String productDesc,
			String productImg_url, Integer productPrice, Integer productQuantity, LocalDate productCreateDate,
			ProductCategory productCategory, ProductState productState) {
		this.productId = productId;
		this.categoryId = categoryId;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productImg_url = productImg_url;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.productCreateDate = productCreateDate;
		this.productCategory = productCategory;
		this.productState = productState;
	}

//	----------------------

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
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

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public ProductState getProductState() {
		return productState;
	}

	public void setProductState(ProductState productState) {
		this.productState = productState;
	}

	public LocalDate getProductCreateDate() {
		return productCreateDate;
	}

	public void setProductCreateDate(LocalDate productCreateDate) {
		this.productCreateDate = productCreateDate;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductBean [productId=");
		builder.append(productId);
		builder.append(", CategoryId=");
		builder.append(categoryId);
		builder.append(", productName=");
		builder.append(productName);
		builder.append(", productDesc=");
		builder.append(productDesc);
		builder.append(", productImg_url=");
		builder.append(productImg_url);
		builder.append(", productPrice=");
		builder.append(productPrice);
		builder.append(", productQuantity=");
		builder.append(productQuantity);
		builder.append(", productCreateDate=");
		builder.append(productCreateDate);
		builder.append(", productCategory=");
		builder.append(productCategory);
		builder.append(", productState=");
		builder.append(productState);
		builder.append("]");
		return builder.toString();
	}

	//匯出csv
	public String saveToCsv() {
		String csv = productId + "," + productCategory.getCategoryName() + "," + productName + "," + productDesc + "," + productImg_url + "," + productQuantity + "," + productPrice + "," + productCreateDate + "," + productState.getProductStateName();
		return csv;
	}



}

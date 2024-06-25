package com.team6.product.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity		   
@Table(name = "productcategory")
@Component
public class ProductCategory implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CATEGORYID")
	private Integer categoryId;
	
	@Column(name = "CATEGORYNAME")
	private String categoryName;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "productCategory", cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	private Set<ProductBean> pBeans = new LinkedHashSet<>();
	
//	--------------------------
	public ProductCategory() {
	}
//	--------------------------

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Set<ProductBean> getpBeans() {
		return pBeans;
	}

	public void setpBeans(Set<ProductBean> pBeans) {
		this.pBeans = pBeans;
	}


	
	
}

package com.team6.product.model;

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
@Table(name = "productstate")
@Component
public class ProductState {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PRODUCTSTATEID")
	private Integer productStateId;
	
	@Column(name = "PRODUCTSTATENAME")
	private String productStateName;

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productState", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	private Set<ProductBean> pBeans = new LinkedHashSet<>();
	
	
//	------------------------
	public ProductState() {
	}
//	------------------------


	public Integer getProductStateId() {
		return productStateId;
	}


	public void setProductStateId(Integer productStateId) {
		this.productStateId = productStateId;
	}


	public String getProductStateName() {
		return productStateName;
	}


	public void setProductStateName(String productStateName) {
		this.productStateName = productStateName;
	}


	public Set<ProductBean> getpBeans() {
		return pBeans;
	}


	public void setpBeans(Set<ProductBean> pBeans) {
		this.pBeans = pBeans;
	}



	
	
	
}

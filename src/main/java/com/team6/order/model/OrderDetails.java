package com.team6.order.model;

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

@Entity
@Table(name="ORDERDETAILS")
@Component
public class OrderDetails {
	
	@Id
	@Column(name="DETAILSID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer detailsId;
	
	@Column(name="ORDERID")
	private String orderId;
	
	@Column(name="PRODUCTID")
	private String productId;
	
	@Column(name="PRODUCT")
	private String product;
	
	@Column(name="UNITPRICE")
	private String unitPrice;
	
	@Column(name="QUANTITY")
	private String quantity;
	
	@Column(name="SUBTOTAL")
	private String subtotal;
	
	@Column(name="NOTE")
	private String note;
	
	@JoinColumn(name="ORDERID", insertable = false, updatable = false)
	@ManyToOne(fetch = FetchType.EAGER)
	private Order order;

	public OrderDetails(Integer detailsId, String orderId, String productId, String product, String unitPrice,
			String quantity, String subtotal, String note, Order order) {
		this.detailsId = detailsId;
		this.orderId = orderId;
		this.productId = productId;
		this.product = product;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.subtotal = subtotal;
		this.note = note;
		this.order= order;
	}

	public OrderDetails(String orderId, String productId, String product, String unitPrice, String quantity,
			String subtotal, String note, Order order) {
		this.orderId = orderId;
		this.productId = productId;
		this.product = product;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.subtotal = subtotal;
		this.note = note;
		this.order = order;
	}

	public OrderDetails(String orderId, String productId, String product, String unitPrice, String quantity,
			String subtotal, String note) {
		this.orderId = orderId;
		this.productId = productId;
		this.product = product;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.subtotal = subtotal;
		this.note = note;
	}
	
	public OrderDetails() {
		
	}

	public Integer getDetailsId() {
		return detailsId;
	}

	public void setDetailsId(Integer detailsId) {
		this.detailsId = detailsId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(String subtotal) {
		this.subtotal = subtotal;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "OrderDetails [detailsId=" + detailsId + ", orderId=" + orderId + ", productId=" + productId
				+ ", product=" + product + ", unitPrice=" + unitPrice + ", quantity=" + quantity + ", subtotal="
				+ subtotal + ", note=" + note + ", order=" + order + "]";
	}

	
	
}
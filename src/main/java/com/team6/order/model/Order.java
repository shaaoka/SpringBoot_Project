package com.team6.order.model;

import java.util.LinkedHashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "PIZZAORDER")
public class Order {

	@Id
	@Column(name = "ORDERID")
	private String orderId;

	@Column(name = "ORDERTIME")
	private String orderTime;

	@Column(name = "ACCOUNT")
	private String account;

	@Column(name = "ORIAMOUNT")
	private Integer oriAmount;

	@Column(name = "DISCOUNT")
	private String discount;

	@Column(name = "DISCOUNTPRICE")
	private Integer discountPrice;

	@Column(name = "PAIDAMOUNT")
	private Integer paidAmount;

	@Column(name = "PAYMENT")
	private String payment;

	@Column(name = "PICKUP")
	private String pickup;

	@Column(name = "ORDERSTATUS")
	private String orderStatus;
	
	@Column(name = "CANCELNOTE")
	private String cancelNote;
	
	@Column(name = "HIDE")
	private Integer hide;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "order", cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	@JsonIgnore
	private Set<OrderDetails> details = new LinkedHashSet<>();
	
	public Order() {
		
	}

	public Order(String orderId, String account, String payment, String pickup, String orderStatus) {
		this.orderId = orderId;
		this.account = account;
		this.payment = payment;
		this.pickup = pickup;
		this.orderStatus = orderStatus;
	}

	public Order(String orderId, String account, String discount, Integer discountPrice, String payment, String pickup,
			String orderStatus) {
		this.orderId = orderId;
		this.account = account;
		this.discount = discount;
		this.discountPrice = discountPrice;
		this.payment = payment;
		this.pickup = pickup;
		this.orderStatus = orderStatus;
	}

	public String getOrderId() {
		return orderId;
	}


	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public String getOrderTime() {
		return orderTime;
	}


	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}


	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public Integer getOriAmount() {
		return oriAmount;
	}


	public void setOriAmount(Integer oriAmount) {
		this.oriAmount = oriAmount;
	}


	public String getDiscount() {
		return discount;
	}


	public void setDiscount(String discount) {
		this.discount = discount;
	}


	public Integer getDiscountPrice() {
		return discountPrice;
	}


	public void setDiscountPrice(Integer discountPrice) {
		this.discountPrice = discountPrice;
	}


	public Integer getPaidAmount() {
		return paidAmount;
	}


	public void setPaidAmount(Integer paidAmount) {
		this.paidAmount = paidAmount;
	}


	public String getPayment() {
		return payment;
	}


	public void setPayment(String payment) {
		this.payment = payment;
	}


	public String getPickup() {
		return pickup;
	}


	public void setPickup(String pickup) {
		this.pickup = pickup;
	}


	public String getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}


	public String getCancelNote() {
		return cancelNote;
	}


	public void setCancelNote(String cancelNote) {
		this.cancelNote = cancelNote;
	}


	public Integer getHide() {
		return hide;
	}


	public void setHide(Integer hide) {
		this.hide = hide;
	}


	public Set<OrderDetails> getDetails() {
		return details;
	}


	public void setDetails(Set<OrderDetails> details) {
		this.details = details;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderTime=" + orderTime + ", account=" + account + ", oriAmount="
				+ oriAmount + ", discount=" + discount + ", discountPrice=" + discountPrice + ", paidAmount="
				+ paidAmount + ", payment=" + payment + ", pickup=" + pickup + ", orderStatus=" + orderStatus
				+ ", cancelNote=" + cancelNote + ", hide=" + hide + ",]";
	}
	

}
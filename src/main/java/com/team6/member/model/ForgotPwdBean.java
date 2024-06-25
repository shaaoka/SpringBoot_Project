package com.team6.member.model;

import java.time.LocalDateTime;
import java.util.UUID;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "forgotPwd")
@Component
public class ForgotPwdBean {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "maid")
	private int maid;
	@Column(name = "token")
	private String token;
	@Column(name = "RegistrationDate")
	private LocalDateTime RegistrationDate;
	
	// 方法----------------------------------------------------------------
	public ForgotPwdBean() {	}

	public ForgotPwdBean( int maid, String token, LocalDateTime registrationDate) {
		this.maid = maid;
		this.token = token;
		RegistrationDate = registrationDate;
	}
	// set and get----------------------------------------------------------------

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMaid() {
		return maid;
	}

	public void setMaid(int maid) {
		this.maid = maid;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public LocalDateTime getRegistrationDate() {
		return RegistrationDate;
	}

	public void setRegistrationDate(LocalDateTime registrationDate) {
		RegistrationDate = registrationDate;
	}

}

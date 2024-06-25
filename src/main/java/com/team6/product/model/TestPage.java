package com.team6.product.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Component
@Entity
@Table(name = "testpage")
public class TestPage {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer tid;
	private String tname1;
	private String tname2;
	private String tname3;
	private String tname4;
	private String tname5;
	private String tname6;
	private int tstate;
	
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTname1() {
		return tname1;
	}
	public void setTname1(String tname1) {
		this.tname1 = tname1;
	}
	public String getTname2() {
		return tname2;
	}
	public void setTname2(String tname2) {
		this.tname2 = tname2;
	}
	public String getTname3() {
		return tname3;
	}
	public void setTname3(String tname3) {
		this.tname3 = tname3;
	}
	public String getTname4() {
		return tname4;
	}
	public void setTname4(String tname4) {
		this.tname4 = tname4;
	}
	public String getTname5() {
		return tname5;
	}
	public void setTname5(String tname5) {
		this.tname5 = tname5;
	}
	public String getTname6() {
		return tname6;
	}
	public void setTname6(String tname6) {
		this.tname6 = tname6;
	}
	public int getTstate() {
		return tstate;
	}
	public void setTstate(int tstate) {
		this.tstate = tstate;
	}
	
	
	

}

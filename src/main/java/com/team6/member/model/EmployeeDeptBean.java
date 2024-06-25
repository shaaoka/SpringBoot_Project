package com.team6.member.model;

import java.util.Set;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity @Table(name = "employeedept")
@Component
public class EmployeeDeptBean {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "deptno")
	private int deptno;
	@Column(name = "deptname")
	private String deptname;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "deptBean", cascade = CascadeType.ALL)
	private Set<EmployeeDetailBean> employeeDetailBeans;
	
	// 方法----------------------------------------------------------------
	public EmployeeDeptBean() {	}
	public EmployeeDeptBean(int deptno, String deptname) {
		this.deptno = deptno;
		this.deptname = deptname;
	}
	
	// set and get----------------------------------------------------------------
	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

}

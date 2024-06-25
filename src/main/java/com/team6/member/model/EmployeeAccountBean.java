package com.team6.member.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity @Table(name = "employeeaccount")
@Component
public class EmployeeAccountBean {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "empid")
	private int empid;
	@Column(name = "empaccount")
	private String empAccount;
	@Column(name = "emppassword")
	private String empPassword;
	@Column(name = "emppermissions")
	private String empPermissions;
	
	@OneToOne(cascade = CascadeType.ALL,mappedBy = "empAccountBean")
	private EmployeeDetailBean detailBean;
	
	// 方法----------------------------------------------------------------
	public EmployeeAccountBean() {	}
	public EmployeeAccountBean(int empid, String empAccount, String empPassword, String empPermissions,
			EmployeeDetailBean detailBean) {
		this.empid = empid;
		this.empAccount = empAccount;
		this.empPassword = empPassword;
		this.empPermissions = empPermissions;
		this.detailBean = detailBean;
	}


	// set and get----------------------------------------------------------------
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public String getEmpAccount() {
		return empAccount;
	}
	public void setEmpAccount(String empAccount) {
		this.empAccount = empAccount;
	}
	public String getEmpPassword() {
		return empPassword;
	}
	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}
	public EmployeeDetailBean getDetailBean() {
		return detailBean;
	}
	public void setDetailBean(EmployeeDetailBean detailBean) {
		this.detailBean = detailBean;
	}
	public String getEmpPermissions() {
		return empPermissions;
	}
	public void setEmpPermissions(String empPermissions) {
		this.empPermissions = empPermissions;
	}
	
}

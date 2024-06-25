package com.team6.member.model;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity @Table(name = "employeedetail")
@Component
public class EmployeeDetailBean {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "empdid")
	private int empdid;
	
	// 外來建:接 EmployeeAccount 的 empid
	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "fk_empid")
	private EmployeeAccountBean empAccountBean;
	
	@Column(name = "empname")
	private String empName;
	@Column(name = "empemail")
	private String empEmail;
	@Column(name = "empphone")
	private String empPhone;
	@Column(name = "empbirthday")
	private LocalDate empbirthday;
	@Column(name = "hiredate")
	private LocalDate hiredate;
	
	// 自連自:接 EmployeeDetail 的 empdid 
	// 老師說不要那麼麻煩，直接用權限找
	@Column(name = "mgr")
	private String mgr;
	
	@Column(name = "job")
	private String job;
	@Column(name = "salary")
	private String salary;
	@Column(name = "comm")
	private String comm;
	
	@JsonIgnore
	@Column(name = "fk_deptno")
	@Transient
	private int deptno;
	
	// 外來建:接 EmployeeDept 的 deptno
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_deptno")
	private EmployeeDeptBean deptBean;
	
	// 方法----------------------------------------------------------------
	public EmployeeDetailBean() {	}
	public EmployeeDetailBean(int empdid, EmployeeAccountBean empAccountBean, String empName, String empEmail,
			String empPhone, LocalDate empbirthday, LocalDate hiredate, String mgr, String job, String salary, String comm,
			int deptno, EmployeeDeptBean deptBean) {
		this.empdid = empdid;
		this.empAccountBean = empAccountBean;
		this.empName = empName;
		this.empEmail = empEmail;
		this.empPhone = empPhone;
		this.empbirthday = empbirthday;
		this.hiredate = hiredate;
		this.mgr = mgr;
		this.job = job;
		this.salary = salary;
		this.comm = comm;
		this.deptno = deptno;
		this.deptBean = deptBean;
	}


	// set and get----------------------------------------------------------------
	public int getEmpdid() {
		return empdid;
	}

	public void setEmpdid(int empdid) {
		this.empdid = empdid;
	}

	public EmployeeAccountBean getEmpAccountBean() {
		return empAccountBean;
	}

	public void setEmpAccountBean(EmployeeAccountBean empAccountBean) {
		this.empAccountBean = empAccountBean;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public LocalDate getEmpbirthday() {
		return empbirthday;
	}

	public void setEmpbirthday(LocalDate empbirthday) {
		this.empbirthday = empbirthday;
	}

	public LocalDate getHiredate() {
		return hiredate;
	}

	public void setHiredate(LocalDate hiredate) {
		this.hiredate = hiredate;
	}

	public String getMgr() {
		return mgr;
	}
	public void setMgr(String mgr) {
		this.mgr = mgr;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getComm() {
		return comm;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	public EmployeeDeptBean getDeptBean() {
		return deptBean;
	}

	public void setDeptBean(EmployeeDeptBean deptBean) {
		this.deptBean = deptBean;
	}

}

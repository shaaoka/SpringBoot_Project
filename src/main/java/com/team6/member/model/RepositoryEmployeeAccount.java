package com.team6.member.model;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RepositoryEmployeeAccount extends JpaRepository<EmployeeAccountBean, Integer> {
	
	@Query(value ="from EmployeeAccountBean where empAccount= ?1 and empPassword = ?2")
	public Optional<EmployeeAccountBean> login(String acconut,String pwd);
	
	@Query(value ="SELECT * FROM EmployeeDetail edt join EmployeeAccount ea on ea.empid = edt.fk_empId join EmployeeDept edp on edt.fk_deptno=edp.deptno WHERE edt.empName like %:n%",nativeQuery = true)
//	@Query(value ="from EmployeeAccountBean where detailBean.getEmpName()= :n")
	public Page<MemberAccountBean> findByNamePage(Pageable pageable, @Param("n")String empName);
}

package com.team6.member.model;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class EmployeeService {

	@Autowired
	RepositoryEmployeeAccount raccount;
	@Autowired
	RepositoryEmployeeDetail rDetail;
	@Autowired
	RepositoryEmployeeDept rDept;
	
	// 員工登入
	public EmployeeAccountBean login(String account, String pwd) {
		Optional<EmployeeAccountBean> optional = raccount.login(account, pwd);
		if(!optional.isEmpty()) {
			return optional.get();
		}
		return null;
	}
	// =================================================================
}

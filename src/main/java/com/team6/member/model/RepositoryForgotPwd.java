package com.team6.member.model;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RepositoryForgotPwd extends JpaRepository<ForgotPwdBean, Integer> {
	
	@Query(value ="from ForgotPwdBean where maid=?1 and token= ?2")
	public Optional<ForgotPwdBean> checkToken(int maid, String token);
}

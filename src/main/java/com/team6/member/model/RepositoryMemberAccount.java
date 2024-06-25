package com.team6.member.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface RepositoryMemberAccount extends JpaRepository<MemberAccountBean, Integer> {

		// 登入查詢
		@Query(value ="from MemberAccountBean where mAccount= ?1 and mPassword = ?2")
		public Optional<MemberAccountBean> login(String acconut,String pwd);
		
		// google登入查詢
		@Query(value ="from MemberAccountBean where mAccount= ?1 and google = ?2")
		public Optional<MemberAccountBean> googleLogin(String acconut,String google);
		
		// 依 帳號 找到bean
		@Query(value ="from MemberAccountBean where mAccount= ?1")
		public Optional<MemberAccountBean> findAccountByAccount(String account);
		
		// 模糊查詢找到bean
		@Query(value ="from MemberAccountBean where detailBean.mName like %:n% or mAccount like %:n% ORDER BY maid")
		public List<MemberAccountBean> findByName(@Param("n")String name);
		
		// 模糊查詢 + 未被刪除 找到bean
		@Query(value ="from MemberAccountBean where hidden = 1 and ( detailBean.mName like %:n% or mAccount like %:n% ) ORDER BY maid")
		public List<MemberAccountBean> findByNameAndNotHidden(@Param("n")String name);
		
		// 查詢未被刪除之全部
		@Query(value ="SELECT * FROM memberAccount where hidden =1",nativeQuery = true)
		public List<MemberAccountBean> findAllByNotHidden();
		
		// 模糊查詢找到bean 分頁板
//		@Query(value ="SELECT * FROM memberAccount a join memberDetail d on a.maid = d.fk_maId WHERE d.mName like %:n%",nativeQuery = true)
		@Query(value ="from MemberAccountBean where detailBean.mName like %:n% or mAccount like %:n% ORDER BY maid")
		public Page<MemberAccountBean> findByNamePage(Pageable pageable, @Param("n")String empName);

		// 模糊查詢 + 未被刪除 分頁板
		@Query(value ="from MemberAccountBean where hidden = 1 and ( detailBean.mName like %:n% or mAccount like %:n% ) ORDER BY maid")
		public Page<MemberAccountBean> findByNameAndNotHiddenPage(Pageable pageable, @Param("n")String Name);
		
		// 查詢未被刪除之全部 分頁板
		@Query(value ="SELECT * FROM memberAccount where hidden =1",nativeQuery = true)
		public Page<MemberAccountBean> findAllByNotHiddenByPage(Pageable pageable);

		// 依 電子信箱 找到bean
		@Query(value ="from MemberAccountBean where detailBean.mEmail= ?1 and hidden = 1")
		public Optional<MemberAccountBean> findAccountByEmail(String email);
		
//		@Query(value ="from MemberAccountBean where :type like %:name% ORDER BY maid")
//		public Page<MemberAccountBean> findByNamePage(Pageable pageable, @Param("type")String type, @Param("name")String empName);
}

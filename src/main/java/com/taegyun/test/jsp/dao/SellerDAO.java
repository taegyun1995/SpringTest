package com.taegyun.test.jsp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.taegyun.test.jsp.model.Seller;

@Repository
public interface SellerDAO {

		public int insertSeller(
				@Param("nickname") String nickname
				, @Param("profileImage") String profileImage
				, @Param("temperature") double temperature);
		
		public Seller selectSeller();
		
		public Seller selectSeller2(@Param("id") int id);
		
}

package com.taegyun.test.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.taegyun.test.mybatis.model.RealEstate;

@Repository
public interface RealEstateDAO {
	
	// 전달받은 id의 realestate 매물 조회
	public RealEstate selectRealEstateList(@Param("id") int id);
	
	// 전달받은 rentPrice보다 월세가 적은 매물 조회
	public List<RealEstate> selectRealEstateList2(@Param("rentPrice") int rentPrice);
	
	public List<RealEstate> selectRealEstateList3(@Param("area") int area, @Param("price") int price);

}


package com.taegyun.test.mybatis.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.taegyun.test.mybatis.model.RealEstate;

@Repository
public interface RealEstateDAO {
	
	public RealEstate selectRealEstateList(@Param("id") int id);
	
	public RealEstate selectRealEstateList2(@Param("rentPrice") int rentPrice);

}


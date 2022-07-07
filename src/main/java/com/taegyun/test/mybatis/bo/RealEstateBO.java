package com.taegyun.test.mybatis.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taegyun.test.mybatis.dao.RealEstateDAO;
import com.taegyun.test.mybatis.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	public RealEstateDAO realestateDAO;

	public RealEstate getRealEstate(int id) {
		RealEstate realestate = realestateDAO.selectRealEstateList(id);
		
		return realestate;
	}
}

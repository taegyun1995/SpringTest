package com.taegyun.test.mybatis.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taegyun.test.mybatis.dao.RealEstateDAO;
import com.taegyun.test.mybatis.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	public RealEstateDAO realestateDAO;
	
    // id 파라미터
	public RealEstate getRealEstate(int id) {
		RealEstate realestate = realestateDAO.selectRealEstateList(id);
		
		return realestate;
	}
	
	// rentPrice 파라미터
	public List<RealEstate> getRealEstate2(int rentPrice) {
		List<RealEstate> realestate = realestateDAO.selectRealEstateList2(rentPrice);
		System.out.println(realestate);
		return realestate;
	}
	
}

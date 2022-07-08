package com.taegyun.test.mybatis.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taegyun.test.mybatis.dao.RealEstateDAO;
import com.taegyun.test.mybatis.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realestateDAO;
	
	// 전달받은 id 값인 realestate 정보전달
	public RealEstate getRealEstate(int id) {
		RealEstate realestate = realestateDAO.selectRealEstateList(id);
		
		return realestate;
	}
	
	public List<RealEstate> getRealEstate2(int rentPrice) {
		List<RealEstate> realestate = realestateDAO.selectRealEstateList2(rentPrice);
		
		return realestate;
	}
	
	public List<RealEstate> getRealEstate3(int area, int price) {
//		List<RealEstate> realestate = realestateDAO.selectRealEstateList3(area, price);
//		
//		return realestate;
		
		return realestateDAO.selectRealEstateList3(area, price);
	}
	
}

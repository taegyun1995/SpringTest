package com.taegyun.test.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.taegyun.test.mybatis.bo.RealEstateBO;
import com.taegyun.test.mybatis.model.RealEstate;

@RestController
@RequestMapping("/mybatis/test01")
public class RealEstateController {
	
	@Autowired
	private RealEstateBO realestateBO;
	
	@RequestMapping("/1")
	public RealEstate realestate(@RequestParam(value="id", defaultValue="22") int id) {
		
		RealEstate realestate = realestateBO.getRealEstate(id);
		return realestate;
	}
	
	@RequestMapping("/2")
	public List<RealEstate> realesate2(@RequestParam(value="rentPrice", defaultValue="90") int rentPrice) {
		
		List<RealEstate> realestate = realestateBO.getRealEstate2(rentPrice);
		return realestate;
	}
	
	@RequestMapping("/3")
	public List<RealEstate> realesate3(@RequestParam(value="area", defaultValue="90") int area,
									   @RequestParam(value="price", defaultValue="130000") int price) {
		
//		List<RealEstate> realestate = realestateBO.getRealEstate3(area, price);
//		return realestate;
		return realestateBO.getRealEstate3(area, price);
	}
}

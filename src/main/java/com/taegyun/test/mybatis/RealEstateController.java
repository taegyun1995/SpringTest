package com.taegyun.test.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taegyun.test.mybatis.bo.RealEstateBO;
import com.taegyun.test.mybatis.model.RealEstate;

@Controller
public class RealEstateController {
	
	@Autowired
	public RealEstateBO realestateBO;
	
	@ResponseBody
	@RequestMapping("/mybatis/test01/1")
	public RealEstate realestate(@RequestParam(value="id", defaultValue="22") int id) {
		
		RealEstate realestate = realestateBO.getRealEstate(id);
		return realestate;
	}
}

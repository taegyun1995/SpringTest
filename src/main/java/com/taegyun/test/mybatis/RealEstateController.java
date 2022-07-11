package com.taegyun.test.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.taegyun.test.mybatis.bo.RealEstateBO;
import com.taegyun.test.mybatis.model.RealEstate;

@RestController
@RequestMapping("/mybatis")
public class RealEstateController {
	
	@Autowired
	private RealEstateBO realestateBO;
	
	@RequestMapping("/test01/1")
	public RealEstate realestate(@RequestParam(value="id", defaultValue="22") int id) {
		
		RealEstate realestate = realestateBO.getRealEstate(id);
		return realestate;
	}
	
	@RequestMapping("/test01/2")
	public List<RealEstate> realesate2(@RequestParam(value="rentPrice", defaultValue="90") int rentPrice) {
		
		List<RealEstate> realestate = realestateBO.getRealEstate2(rentPrice);
		return realestate;
	}
	
	@RequestMapping("/test01/3")
	public List<RealEstate> realesate3(@RequestParam(value="area", defaultValue="90") int area,
									   @RequestParam(value="price", defaultValue="130000") int price) {
		
//		List<RealEstate> realestate = realestateBO.getRealEstate3(area, price);
//		return realestate;
		return realestateBO.getRealEstate3(area, price);
	}
	
	@RequestMapping("/test02/1")
	public String realestate4(RealEstate realEstate) {
		RealEstate realestate = new RealEstate();
		realestate.setRealtorId(3);
		realestate.setAddress("푸르지용 리버 303동 1104호");
		realestate.setArea(89);
		realestate.setType("매매");
		realestate.setPrice(100000);
		
		int count = realestateBO.addRealEstate(realestate);
		
		return "삽입 개수 : " + count;
	}
	
	@RequestMapping("/test02/2")
	public String realestate5(@RequestParam(value="realtorId", defaultValue="5") int realtorId) {
		
		int count = realestateBO.addRealEstate2(realtorId, "샹떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		
		return "삽입 개수 : " + count;
	}
	
	@RequestMapping("/test03/1")
	public String realestate6() {
		int count = realestateBO.amendRealEstate(26, "전세", 70000);
		
		return "수정 성공 : " + count;
	}
	
	@RequestMapping("/test04/1")
	public String realestate7(@RequestParam(value="id", defaultValue="25") int id) {
		
		int count = realestateBO.delRealEstate(id);
		
		return "삭제 성공 : " + count;
	}
	
}

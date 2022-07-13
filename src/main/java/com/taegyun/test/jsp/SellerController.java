package com.taegyun.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taegyun.test.jsp.bo.SellerBO;
import com.taegyun.test.jsp.model.Seller;

@Controller
@RequestMapping("/jsp/seller")
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;
	
	@ResponseBody
	@PostMapping("/insert")
	public String addSeller(
			@RequestParam("nickname") String nickname
			, @RequestParam(value="profileImage", required=false) String profileImage
			, @RequestParam("temperature") double temperature) {
		int count = sellerBO.addSeller(nickname, profileImage, temperature);
		
		return "삽입결과 : " + count;
	}
	
	@GetMapping("/input_View")
	public String sellerInputView() {
		return "jsp/sellerInput";
	}
	
	@GetMapping("/info")
	public String sellerInfo(
			@RequestParam(value="id", required=false) Integer id
			, Model model) {
		
		// 비필수 파라미터
		// 값이 전달되면 그 값으로 셋팅
		// 값이 전달이 안되면 null
		
//		Seller seller = null;
//		
//		if(id == null) {
//			seller = sellerBO.searchSeller();
//		} else {
//			seller = sellerBO.searchSeller2(id);
//		}
		Seller seller = sellerBO.searchSeller2(id);
		model.addAttribute("seller", seller);
		
		return "jsp/sellerInfo";
		
	}
	
}

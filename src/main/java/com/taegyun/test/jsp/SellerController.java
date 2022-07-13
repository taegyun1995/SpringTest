package com.taegyun.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taegyun.test.jsp.bo.SellerBO;

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
}

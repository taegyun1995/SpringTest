package com.taegyun.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.taegyun.test.jsp.bo.RealtorBO;
import com.taegyun.test.jsp.model.Realtor;

@Controller
@RequestMapping("/jsp/realtor")
public class RealtorController {
	
	// 공인중개사 정보 전달받고, 데이터 저장
	
	@Autowired
	private RealtorBO realtorBO;
	
	@GetMapping("/insert")
	public String addRealtor(@ModelAttribute Realtor realtor 
			, Model model) {
		
		int count = realtorBO.addRealtor(realtor);
		model.addAttribute("realtor", realtor);
		
		return "jsp/realtorInfo";
	}
	
	@GetMapping("/input")
	public String realtorInput() {
		return "jsp/realtorInput";
	}

}
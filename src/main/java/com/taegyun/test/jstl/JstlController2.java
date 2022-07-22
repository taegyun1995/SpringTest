package com.taegyun.test.jstl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.taegyun.test.jstl.bo.StoreBO2;
import com.taegyun.test.jstl.model.Store;

@Controller
@RequestMapping("/jstl/delivery")
public class JstlController2 {
	
	@Autowired
	private StoreBO2 storeBO2;

	@GetMapping("/info")
	public String deliveryinfo(Model model) {
		
		List<Store> store = storeBO2.getStore();
		
		model.addAttribute("str", store);
		
		
		return "jstl/deliveryInfo";
	}
	
	@GetMapping("/review")
	public String deliveryreview() {
		
		return "jstl/deliveryReview";
	}
	
	
	
}

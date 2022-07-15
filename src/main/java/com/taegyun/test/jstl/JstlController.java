package com.taegyun.test.jstl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JstlController {
	
	@GetMapping("/jstl/test01")
	public String test01() {
		return "jstl/test01";
	}

}

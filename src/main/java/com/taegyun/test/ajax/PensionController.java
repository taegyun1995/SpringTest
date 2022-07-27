package com.taegyun.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taegyun.test.ajax.bo.PensionBO;
import com.taegyun.test.ajax.model.Pension;

@Controller
@RequestMapping("/ajax/pension")
public class PensionController {
	
	@GetMapping("/main")
	public String pensionView() {
		
		return "ajax/pensionMain";
	}
	
	@Autowired
	private PensionBO pensionBO;
	
	@GetMapping("/list")
	public String bookingList(Model model) {
		
		List<Pension> booking = pensionBO.getBookingList();
		model.addAttribute("book", booking);
		
		return "ajax/pensionList";
	}
	
	@ResponseBody
	@GetMapping("/delete")
	public Map<String, String> bookingDelete(@RequestParam("id") int id) {
		
		int count = pensionBO.bookingDelete(id);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@GetMapping("/input")
	public String bookingInput() {
		
		return "ajax/pensionInput";
	}
	
	@ResponseBody
	@GetMapping("/insert")
	public Map<String, String> bookingInsert(
			@RequestParam("name") String name
			, @RequestParam("date") String date
			, @RequestParam("day") int day
			, @RequestParam("headcount") int headcount
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam(value="state", defaultValue="대기중") String state){
		
		int count = pensionBO.bookingInsert(name, date, day, headcount, phoneNumber, state);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}

}

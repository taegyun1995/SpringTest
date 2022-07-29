package com.taegyun.test.ajax;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
	
	// 메인 홈페이지 
	@GetMapping("/main")
	public String pensionView() {
		
		return "ajax/pensionMain";
	}
	
	@Autowired
	private PensionBO pensionBO;
	
	// 예약 목록보기
	@GetMapping("/list")
	public String bookingList(Model model) {
		
		List<Pension> booking = pensionBO.getBookingList();
		model.addAttribute("book", booking);
		
		return "ajax/pensionList";
	}
	
	// 예약 리스트 삭제하기
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
	
	// 예약하기 화면
	@GetMapping("/input")
	public String bookingInput() {
		
		return "ajax/pensionInput";
	}
	
	// 예약하기
	@ResponseBody
	@GetMapping("/insert")
	public Map<String, String> bookingInsert(
			@RequestParam("name") String name
			, @DateTimeFormat(pattern="yyyy년 MM월 dd일")
			  @RequestParam("date") Date date
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
	
	// 조회하기 api
	@ResponseBody
	@GetMapping("/lookup")
	public Pension bookingAlert(@RequestParam("name") String name
							  , @RequestParam("phoneNumber") String phoneNumber) {
		
		Pension pension = pensionBO.bookingLookup(name, phoneNumber);
		
		return pension;
	}

}

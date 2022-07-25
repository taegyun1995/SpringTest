package com.taegyun.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taegyun.test.ajax.bo.FavoriteBO;
import com.taegyun.test.ajax.model.Favorite;

@Controller
@RequestMapping("/ajax/favorite")
public class FavoriteController {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/list")
	public String favorList(Model model) {
		
		List<Favorite> favorite = favoriteBO.getFavoriteList();
		model.addAttribute("favor", favorite);
		
		return "ajax/favoriteList";
	}
	
	@ResponseBody
	@PostMapping("/insert")
	public Map<String, String> favorInsert(
			@RequestParam("name") String name
			, @RequestParam("url") String url
			, Model model) {
		
		int count = favoriteBO.favoriteInsert(name, url);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/input")
	public String favorInput() {
		
		return "ajax/favoriteInput";
	}
	
	@ResponseBody
	@PostMapping("/overlap")
	public Map<String, Boolean> favorOverLap(@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		
//		if(favoriteBO.favoriteOverLap(url)) {
//			result.put("overlap", true);
//		} else {
//			result.put("overlap", false);
//		}
		
		result.put("overlap", favoriteBO.favoriteOverLap(url));
		 
		return result;
		
	}
	
	

}

package com.taegyun.test.database;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taegyun.test.database.bo.StoreBO;
import com.taegyun.test.database.model.Store;

@Controller
public class StoreController {
	
	@Autowired
	private StoreBO storeBO;

	// store 안에 있는 모든 내용을 json으로 전달
	@ResponseBody
	@RequestMapping("/database/test01/1")
	public List<Store> test01() {
		List<Store> list = storeBO.getStoreList();
		
		return list;
	}
}

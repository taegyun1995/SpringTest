package com.taegyun.test.jstl.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taegyun.test.jstl.dao.StoreDAO2;
import com.taegyun.test.jstl.model.Store;

@Service
public class StoreBO2 {
	
	@Autowired
	private StoreDAO2 storeDAO2;
	
	public List<Store> getStore() {
		
		return storeDAO2.selectStore();
	}

}

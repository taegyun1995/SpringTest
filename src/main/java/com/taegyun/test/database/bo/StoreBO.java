package com.taegyun.test.database.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taegyun.test.database.dao.StoreDAO;
import com.taegyun.test.database.model.Store;

@Service
public class StoreBO {
	
	@Autowired
	private StoreDAO storeDAO;
	
	// store 데이터를 모두 가져오는 메서드
	public List<Store> getStoreList() {
		List<Store> list = storeDAO.selectStoreList();
		
		return list;
	}
}

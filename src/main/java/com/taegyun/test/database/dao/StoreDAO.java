package com.taegyun.test.database.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.taegyun.test.database.model.Store;

@Repository
public interface StoreDAO {
	
	// Model - Store(Mapper)에서 모든 데이터 조회
	public List<Store> selectStoreList();
}

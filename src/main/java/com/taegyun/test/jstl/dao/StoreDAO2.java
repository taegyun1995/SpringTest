package com.taegyun.test.jstl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.taegyun.test.jstl.model.Store;

@Repository
public interface StoreDAO2 {
	
	public List<Store> selectStore();

}

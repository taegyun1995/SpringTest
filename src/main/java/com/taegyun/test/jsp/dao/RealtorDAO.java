package com.taegyun.test.jsp.dao;

import org.springframework.stereotype.Repository;

import com.taegyun.test.jsp.model.Realtor;

@Repository
public interface RealtorDAO {
	
	public int insertRealtor(Realtor realtor);

}

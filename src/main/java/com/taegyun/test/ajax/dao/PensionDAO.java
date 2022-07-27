package com.taegyun.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.taegyun.test.ajax.model.Pension;

@Repository
public interface PensionDAO {
	
	public List<Pension> selectBooking();
	
	public int deleteBooking(@Param("id") int id);
	
	public int insertBooking(@Param("name") String name
							, @Param("date") String date
							, @Param("day") int day
							, @Param("headcount") int headcount
							, @Param("phoneNumber") String phoneNumber
							, @Param("state") String state);

}

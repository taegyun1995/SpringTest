package com.taegyun.test.jstl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.taegyun.test.jstl.model.Weatherhistory;

@Repository
public interface WeatherHistoryDAO {
	
	public List<Weatherhistory> selectWeather();

}

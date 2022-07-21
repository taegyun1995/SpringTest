package com.taegyun.test.jstl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.taegyun.test.jstl.model.Weatherhistory;

@Repository
public interface WeatherHistoryDAO {
	
	public List<Weatherhistory> selectWeather();
	
	public int insertWeather(
			@Param("date") String date
			, @Param("weather") String weather
			, @Param("microDust") String microDust
			, @Param("temperatures") double temperatures
			, @Param("precipitation") double precipitation
			, @Param("windSpeed") double windSpeed);

}

package com.taegyun.test.jstl.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taegyun.test.jstl.dao.WeatherHistoryDAO;
import com.taegyun.test.jstl.model.Weatherhistory;

@Service
public class WeatherhistoryBO {
	
	@Autowired
	private WeatherHistoryDAO weatherhistoryDAO;
	
	public List<Weatherhistory> searchWeather() {
		return weatherhistoryDAO.selectWeather();
	}
	
	public int inputWeather(String date
			, String weather
			, String microDust
			, double temperatures
			, double precipitation
			, double windSpeed) {
		return weatherhistoryDAO.insertWeather(date, weather, microDust, temperatures, precipitation, windSpeed);
	}

}

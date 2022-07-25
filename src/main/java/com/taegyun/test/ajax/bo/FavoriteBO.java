package com.taegyun.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taegyun.test.ajax.dao.FavoriteDAO;
import com.taegyun.test.ajax.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public List<Favorite> getFavoriteList() {
		
		return favoriteDAO.selectFavorite();
	}
	
	public int favoriteInsert(String name, String url) {
		
		return favoriteDAO.insertFavorite(name, url);
	}
	
	public boolean favoriteOverLap(String url) {
		
		return favoriteDAO.selectFavoriteOverLap(url) != 0;
	}

}

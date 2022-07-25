package com.taegyun.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.taegyun.test.ajax.model.Favorite;

@Repository
public interface FavoriteDAO {
	
	public List<Favorite> selectFavorite();
	
	public int insertFavorite(
			@Param("name") String name
			,@Param("url") String url);
	
	public int selectFavoriteOverLap(@Param("url") String url);

}

package com.taegyun.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taegyun.test.jsp.dao.SellerDAO;

@Service
public class SellerBO {

	@Autowired
	private SellerDAO sellerDAO;
	
	public int addSeller(String nickname, String profileImage, double temperature) {
		return sellerDAO.insertSeller(nickname, profileImage, temperature);
	}
}

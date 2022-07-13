package com.taegyun.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taegyun.test.jsp.dao.SellerDAO;
import com.taegyun.test.jsp.model.Seller;

@Service
public class SellerBO {

	@Autowired
	private SellerDAO sellerDAO;
	
	public int addSeller(String nickname, String profileImage, double temperature) {
		return sellerDAO.insertSeller(nickname, profileImage, temperature);
	}
	
//	public Seller searchSeller() {
//		return sellerDAO.selectSeller();
//	}
	
	public Seller searchSeller2(Integer id) {
		if(id == null) {
			return sellerDAO.selectSeller();
		} else {
			return sellerDAO.selectSeller2(id);
		}
	}
	
}

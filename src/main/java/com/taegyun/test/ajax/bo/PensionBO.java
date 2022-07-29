package com.taegyun.test.ajax.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taegyun.test.ajax.dao.PensionDAO;
import com.taegyun.test.ajax.model.Pension;

@Service
public class PensionBO {
	
	@Autowired
	private PensionDAO pensionDAO;
	
	public List<Pension> getBookingList() {
		
		return pensionDAO.selectBooking();
	}
	
	public int bookingDelete(int id) {
		
		return pensionDAO.deleteBooking(id);
	}
	
	public int bookingInsert(String name, Date date, int day, int headcount, String phoneNumber, String state) {
		
		return pensionDAO.insertBooking(name, date, day, headcount, phoneNumber, state);
	}
	
	public Pension bookingLookup(String name, String phoneNumber) {
		
		return pensionDAO.lookupBooking(name, phoneNumber);
	}

}

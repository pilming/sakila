package com.gd.sakila.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.PaymentMapper;
import com.gd.sakila.mapper.RentalMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class RentalService {
	@Autowired RentalMapper rentalMapper;
	@Autowired PaymentMapper paymentMapper;
	public int addRental(Map<String,Object> map) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶RentalService.addRental 매개변수 map : " + map);
		//매개변수로 맵을 넘길때는 parmMap이름으로 넘기기 위해 + rentalId를 얻어오기위해
		Map<String, Object> parmMap = map;
		parmMap.put("rentalId", 0);
		int addRentalRow = rentalMapper.insertRental(parmMap);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶RentalService.addRental addRentalRow : " + addRentalRow);
		int addPaymentRow = paymentMapper.insertPayment(parmMap);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶RentalService.addRental addPaymentRow : " + addPaymentRow);
		
		
		return addRentalRow;
	}
	
	public int modifyRental(int rentalId, int filmId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶RentalService.modifyRental 매개변수 rentalId : " + rentalId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶RentalService.modifyRental 매개변수 filmId : " + filmId);
		
		int modifyRentalRow = rentalMapper.updateReturnDate(rentalId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶RentalService.modifyRental modifyRentalRow : " + modifyRentalRow);
		
		Map<String, Object> parmMap = new HashMap<String, Object>();
		parmMap.put("rentalId", rentalId);
		parmMap.put("filmId", filmId);
		
		Map<String,Object> ReturnInfo = rentalMapper.selectReturnInfo(parmMap);
		
		int delayCount = ReturnInfo.get("")
		
		return 1;
	}
}

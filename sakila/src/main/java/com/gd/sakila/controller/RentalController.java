package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.RentalService;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class RentalController {
	@Autowired RentalService rentalService;
	@PostMapping("/addRental")
	public String addRental(@RequestParam(value="customerId") int customerId,
							@RequestParam(value="currentPage") int currentPage,
							@RequestParam(value="searchWord") String searchWord,
							@RequestParam(value="storeId") int storeId,
							@RequestParam(value="rentalFilmId") int rentalFilmId,
							@RequestParam(value="rentalInventoryId") int rentalInventoryId,
							HttpSession session) {
		Staff loginStaff = (Staff)session.getAttribute("loginStaff");

		int staffId = loginStaff.getStaffId();
		
		Map<String, Object> parmMap = new HashMap<String, Object>();
		parmMap.put("customerId", customerId);
		parmMap.put("rentalFilmId", rentalFilmId);
		parmMap.put("rentalInventoryId", rentalInventoryId);
		parmMap.put("staffId", staffId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶RentalController.addRental parmMap : " + parmMap);
		
		
		int addRow =  rentalService.addRental(parmMap);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶RentalController.addRental addRow : " + addRow);
		
		return "redirect:/admin/getCustomerOne?currentPage="+currentPage+"&storeId="+storeId+"&searchWord="+searchWord+"&customerId="+customerId;
	}
	
	@PostMapping("/addReturnDate")
	public String addReturnDate(@RequestParam(value="customerId") int customerId,
				@RequestParam(value="currentPage") int currentPage,
				@RequestParam(value="searchWord") String searchWord,
				@RequestParam(value="storeId") int storeId,
				@RequestParam(value="rentalId") int rentalId,
				@RequestParam(value="filmId") int filmId) {
		
		int addRow =  rentalService.modifyRental(rentalId, filmId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶RentalController.addReturnDate addRow : " + addRow);
		
		return "redirect:/admin/getCustomerOne?currentPage="+currentPage+"&storeId="+storeId+"&searchWord="+searchWord+"&customerId="+customerId;
	}
}

package com.gd.sakila.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.mapper.InventoryMapper;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RentalRestController {
	@Autowired FilmMapper filmMapper;
	@Autowired InventoryMapper inventoryMapper;
	@GetMapping("/filmTitle")
	public List<Map<String,Object>> getFilmTitle() {		
		return filmMapper.selectFilmName();
	}
	@GetMapping("/inventory")
	public List<Integer> getInventoryId(@RequestParam(value = "filmId") int filmId,
										HttpSession session) {
		Staff loginStaff = (Staff)session.getAttribute("loginStaff");
		int storeId = loginStaff.getStoreId();
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶RentalRestController.getInventoryId loginStaff : " + loginStaff);
		List<Map<String,Object>> inventoryListByFilmId = inventoryMapper.selectInventoryByFilmId(filmId);
		//대여가능한것만 보여줄수있도록
		List<Integer> returnInventoryList = new ArrayList<Integer>();

		for(Map<String,Object> i : inventoryListByFilmId) { 
			if((int)i.get("storeId")== storeId && i.get("rentable").equals("T") ) {
				returnInventoryList.add((int)i.get("inventoryId")); 
			} 
		}
 
		return returnInventoryList;
	}
}

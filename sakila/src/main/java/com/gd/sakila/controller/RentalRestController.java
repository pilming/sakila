package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.mapper.InventoryMapper;

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
}

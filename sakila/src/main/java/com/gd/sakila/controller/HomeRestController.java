package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.mapper.SalesMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeRestController {
	@Autowired SalesMapper salesMapper;
	
	@GetMapping("/salesByCategory")
	public  List<Map<String,Object>> getSalesByCategory() {
		return salesMapper.selectSalesByFilmCategory();
	}
	@GetMapping("/monthlyTotal")
	public  List<Map<String,Object>> getMonthlyTotal() {
		return salesMapper.selectMonthlyTotal();
	}
}

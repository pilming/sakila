package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.vo.Film;
import com.gd.sakila.vo.FilmView;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class FilmService {
	@Autowired FilmMapper filmMapper;
	
	public Map<String, Object> getFilmList(int currentPage, int rowPerPage, String searchWord) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶FilmService.getFilmList 매개변수 currentPage : " + currentPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶FilmService.getFilmList 매개변수 rowPerPage : " + rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶FilmService.getFilmList 매개변수 searchWord : " + searchWord);
		
		int filmTotal = filmMapper.selectFilmTotal(searchWord);
		int lastPage = (int)Math.ceil((double)filmTotal/ rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ FilmService.getFilmList filmTotal :" + filmTotal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ FilmService.getFilmList lastPage :" + lastPage);
		
		
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ FilmService.getFilmList page :" + page);
		
		
		List<FilmView> filmList = filmMapper.selectFilmList(page);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ FilmService.getFilmList filmList :" + filmList);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("lastPage", lastPage);
		returnMap.put("filmList", filmList);
		return returnMap;
	}
	
	public Map<String, Object> getFilmOne(int filmId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ FilmService.getFilmOne 매개변수  filmId:" + filmId);
		
		Map<String, Object> filmOne = filmMapper.selectFilmOne(filmId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ FilmService.getFilmOne filmOne :" + filmOne);
		
		Map<String, Object> store1Map = new HashMap<>();
		store1Map.put("filmId", filmId);
		store1Map.put("storeId", 1);
		
		int store1filmCount = 0;
		store1Map.put("filmCount", store1filmCount);
		List<Integer> store1Stock = filmMapper.selectFilmInStock(store1Map);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ FilmService.getFilmOne store1filmCount :" + store1Map.get("filmCount"));
		log.debug("★★★★★★★★★★★★★★★★★★★★ FilmService.getFilmOne store1Stock :" + store1Stock);
		
		Map<String, Object> store2Map = new HashMap<>();
		store2Map.put("filmId", filmId);
		store2Map.put("storeId", 2);
		
		int store2filmCount = 0;
		store2Map.put("filmCount", store2filmCount);
		List<Integer> store2Stock = filmMapper.selectFilmInStock(store2Map);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ FilmService.getFilmOne store2filmCount :" + store2Map.get("filmCount"));
		log.debug("★★★★★★★★★★★★★★★★★★★★ FilmService.getFilmOne store2Stock :" + store2Stock);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("store1Stock", store1Map.get("filmCount"));
		returnMap.put("store2Stock", store2Map.get("filmCount"));
		returnMap.put("filmOne", filmOne);
		return returnMap;
	}
	
}

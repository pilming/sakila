package com.gd.sakila.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.mapper.InventoryMapper;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	@Autowired FilmMapper filmMapper;
	
	public List<Map<String, Object>> getInventoryInfoList(){	

		List<Map<String, Object>> inventoryList = inventoryMapper.selectInventoryInfoList();

		return inventoryList;
	}
	/*
	public Map<String, Object> getInventoryInfoList(Map<String, Object> map){	
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryService.getInventoryInfoList 매개변수 currentPage : " + map.get("currentPage"));
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryService.getInventoryInfoList 매개변수 rowPerPage : " + map.get("rowPerPage"));
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryService.getInventoryInfoList 매개변수 searchWord : " + map.get("searchWord"));
		
		int currentPage = (int)map.get("currentPage");
		int rowPerPage = (int)map.get("rowPerPage");
		String searchWord = (String)map.get("searchWord");
		
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		
		int beginRow = ((currentPage-1)*page.getRowPerPage());
		
		int filmTotal = inventoryMapper.selectInventoryTotalCount(searchWord);
		int lastPage = (int)Math.ceil((double)filmTotal/ rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ InventoryService.getInventoryInfoList filmTotal :" + filmTotal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ InventoryService.getInventoryInfoList lastPage :" + lastPage);
		
		Map<String, Object> parmMap = new HashMap<>();
		parmMap.put("page", page);
		parmMap.put("searchWord", searchWord);
		
		List<Map<String, Object>> list = inventoryMapper.selectInventoryInfoList(parmMap);
		List<Integer> storeIdList = new ArrayList<>();
		List<Integer> filmIdList = new ArrayList<>();
		Map<String, Object> inMap = new HashMap<>();
		List<Integer> stockCnt = new ArrayList<>();
		List<Integer> notStockCnt = new ArrayList<>();
		int storeId=0;
		int filmId=0;
		
		for(Map<String, Object> data : list) {
			storeId = (int) data.get("storeId");
			storeIdList.add(storeId);
			filmId = (int) data.get("filmId");
			filmIdList.add(filmId);
			inMap.put("storeId", storeId);
			inMap.put("filmId", filmId);
			stockCnt.add(inventoryMapper.selectInventoryStockCnt(inMap));
			notStockCnt.add(inventoryMapper.selectInventoryNotStockCnt(inMap));
		}
		
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ InventoryService.getInventoryInfoList inMap:"+inMap);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ InventoryService.getInventoryInfoList stockCnt:"+stockCnt);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ InventoryService.getInventoryInfoList notStockCnt:"+notStockCnt);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("list", list);
		returnMap.put("filmTotal", filmTotal);
		returnMap.put("beginRow", beginRow);
		returnMap.put("lastPage", lastPage);
		returnMap.put("stockCnt", stockCnt);
		returnMap.put("rowPerPage", rowPerPage);
		returnMap.put("notStockCnt", notStockCnt);
		return returnMap;
	}
	*/
	public List<Map<String, Object>> getInventoryOne(int filmId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ InventoryService.getInventoryOne 매개변수 filmId:"+filmId);

		return inventoryMapper.selectInventoryByFilmId(filmId);
	}
	
	public int addInventory(Map<String, Object> map) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ InventoryService.addInventory 매개변수 map:"+map);

		return inventoryMapper.insertInventory(map);
	}
	public int removeInventory(int inventoryId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ InventoryService.removeInventory 매개변수 inventoryId:"+inventoryId);

		return inventoryMapper.removeInventory(inventoryId);
	}
	
}

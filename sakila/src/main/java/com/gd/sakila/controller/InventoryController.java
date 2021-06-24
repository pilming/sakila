package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class InventoryController {
	@Autowired InventoryService inventoryService;
	@GetMapping("/getInventoryList")
	public String getInventoryInfoList(Model model) {
		
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryInfoList();
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.getInventoryInfoList inventoryList : " + inventoryList.size());
		model.addAttribute("inventoryList", inventoryList);

		return "getInventoryList";
	}
	/*ui적용하면서 간소화
	@GetMapping("/getInventoryList")
	public String getInventoryInfoList(Model model,
										@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
										@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
										@RequestParam(value="searchWord", required = false ) String searchWord) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.getInventoryInfoList 매개변수 currentPage : " + currentPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.getInventoryInfoList 매개변수 rowPerPage : " + rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.getInventoryInfoList 매개변수 searchWord : " + searchWord);
		
		Map<String, Object> parmMap = new HashMap<String, Object>();
		parmMap.put("currentPage", currentPage);
		parmMap.put("rowPerPage", rowPerPage);
		parmMap.put("searchWord", searchWord);
		
		Map<String, Object> map = inventoryService.getInventoryInfoList(parmMap);
		model.addAttribute("rowPerPage", map.get("rowPerPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("stockCnt", map.get("stockCnt"));
		model.addAttribute("notStockCnt", map.get("notStockCnt"));
		
		return "getInventoryList";
	}
	*/
	@GetMapping("/getInventoryOne")
	public String getInventoryOne(Model model,
								@RequestParam(value="filmId", required = true) int filmId,
								@RequestParam(value="title", required = true) String title) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.getInventoryOne 매개변수 filmId : " + filmId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.getInventoryOne 매개변수 title : " + title);
		
		List<Map<String, Object>> inventoryInfoList = inventoryService.getInventoryOne(filmId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.getInventoryOne inventoryInfoList : " + inventoryInfoList);
		
		model.addAttribute("inventoryInfoList", inventoryInfoList);
		model.addAttribute("filmId", filmId);
		model.addAttribute("title", title);
		return "getInventoryOne";
	}
	
	@GetMapping("/addInventory")
	public String addInventory(Model model,
								@RequestParam(value="filmId", required = true) int filmId,
								@RequestParam(value="title", required = true) String title) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.addInventory 매개변수 filmId : " + filmId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.addInventory 매개변수 title : " + title);
	
		model.addAttribute("filmId", filmId);
		model.addAttribute("title", title);
		return "addInventory";
	}
	
	@PostMapping("/addInventory")
	public String addInventory(@RequestParam(value="filmId", required = true) int filmId,
								@RequestParam(value="title", required = true) String title,
								@RequestParam(value="storeId", required = true) int storeId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.addInventory 매개변수 filmId : " + filmId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.addInventory 매개변수 title : " + title);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.addInventory 매개변수 storeId : " + storeId);
		
		Map<String, Object> parmMap = new HashMap<String, Object>();
		parmMap.put("filmId", filmId);
		parmMap.put("storeId", storeId);
		
		int insertAction = inventoryService.addInventory(parmMap);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.addInventory  insertAction : " + insertAction);
	
		return "redirect:/admin/getInventoryOne?filmId="+filmId+"&title="+ title;
	}
	
	@GetMapping("/removeInventory")
	public String removeInventory (@RequestParam(value="filmId", required=true) int filmId,
								@RequestParam(value="inventoryId", required=true) int inventoryId,
								@RequestParam(value="title", required=true) String title) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.removeInventory  filmId : " + filmId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.removeInventory  inventoryId : " + inventoryId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.removeInventory  title : " + title);
		
		int removeAction=inventoryService.removeInventory(inventoryId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶InventoryController.removeInventory  removeAction : " + removeAction);

		return "redirect:/admin/getInventoryOne?filmId="+filmId+"&title="+title;
	}
	
}

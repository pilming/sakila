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

import com.gd.sakila.mapper.CityMapper;
import com.gd.sakila.service.CustomerService;
import com.gd.sakila.vo.City;
import com.gd.sakila.vo.CustomerForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class CustomerController {
	@Autowired CustomerService customerService;
	@Autowired CityMapper cityMapper;
	@GetMapping("/getCustomerList")
	public String getCustomerList(Model model,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
								@RequestParam(value="storeId", defaultValue = "0" ) int storeId,
								@RequestParam(value="searchWord", required = false ) String searchWord) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.getCustomerList 매개변수 currentPage : " + currentPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.getCustomerList 매개변수 rowPerPage : " + rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.getCustomerList 매개변수 storeId : " + storeId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.getCustomerList 매개변수 searchWord : " + searchWord);
		
		Map<String, Object> parmMap = new HashMap<String, Object>();
		parmMap.put("currentPage", currentPage);
		parmMap.put("rowPerPage", rowPerPage);
		parmMap.put("storeId", storeId);
		parmMap.put("searchWord", searchWord);
		
		
		Map<String, Object> CustomerList = customerService.getCustomerList(parmMap);
		
		model.addAttribute("lastPage", CustomerList.get("lastPage"));
		model.addAttribute("CustomerList", CustomerList.get("CustomerList"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("storeId", storeId);
		model.addAttribute("searchWord", searchWord);
		
		return "getCustomerList";
	}
	
	@GetMapping("/getCustomerOne")
	public String getCustomerList(Model model,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
								@RequestParam(value="storeId", defaultValue = "0" ) int storeId,
								@RequestParam(value="searchWord", required = false ) String searchWord,
								@RequestParam(value="customerId", required = true) int customerId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.getCustomerList 매개변수 currentPage : " + currentPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.getCustomerList 매개변수 rowPerPage : " + rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.getCustomerList 매개변수 storeId : " + storeId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.getCustomerList 매개변수 searchWord : " + searchWord);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.getCustomerList 매개변수 customerId : " + customerId);
		
		
		Map<String, Object> customerOneMap = customerService.getCustomerOne(customerId);
		
		model.addAttribute("customerOne", customerOneMap.get("customerOne"));
		model.addAttribute("customerOnePayment", customerOneMap.get("customerOnePayment"));
		model.addAttribute("customerOneRentalHistory", customerOneMap.get("customerOneRentalHistory"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("storeId", storeId);
		model.addAttribute("searchWord", searchWord);
		
		return "getCustomerOne";
	}
	
	@GetMapping("/addCustomer")
	public String addCustomer(Model model) {
		List<City> cityList = cityMapper.selectAllCity();
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.addCustomer cityList.size() : " + cityList.size());
		model.addAttribute("cityList",cityList);
		
		return "addCustomer";
	}
	
	@PostMapping("/addCustomer")
	public String addCustomer(CustomerForm customerForm) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.addCustomer 매개변수 customerForm : " + customerForm);
		
		int addRow = customerService.addCustomer(customerForm);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶CustomerController.addCustomer addRow : " + addRow);
		
		return "redirect:/admin/getCustomerList";
	}
	
	
}

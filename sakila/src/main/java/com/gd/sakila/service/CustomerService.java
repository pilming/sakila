package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.mapper.CustomerMapper;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	public void modifyCustomerActiveByscheduler() {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ CustomerService.modifyCustomerActiveByscheduler() 실행");
		int row = customerMapper.updateCustomerActiveByscheduler();
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 휴먼고객 처리 행수 :" +row);
	}
	public Map<String, Object> getCustomerList(Map<String, Object> map) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ CustomerService.getCustomerList 매개변수 map : "+ map);
		
		int currentPage = (int)map.get("currentPage");
		int rowPerPage = (int)map.get("rowPerPage");
		int storeId = (int)map.get("storeId");
		String searchWord = (String)map.get("searchWord");
		
		
		Page page = new Page();
		page.setBeginRow((currentPage - 1 )*rowPerPage);
		page.setRowPerPage(rowPerPage);
		
		Map<String, Object> parmMap = new HashMap<String, Object>();
		parmMap.put("page", page);
		parmMap.put("storeId", storeId);
		parmMap.put("searchWord", searchWord);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ CustomerService.getCustomerList parmMap.size : "+ parmMap.size());
		
		int customerTotal = customerMapper.selectCustomerTotal(parmMap);
		int lastPage = (int)Math.ceil((double)customerTotal/ rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ CustomerService.getCustomerList customerTotal : "+ customerTotal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ CustomerService.getCustomerList lastPage : "+ lastPage);
		
		List<Map<String, Object>> CustomerList = customerMapper.selectCustomerList(parmMap);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ CustomerService.getCustomerList CustomerList.size : "+ CustomerList.size());
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("lastPage", lastPage);
		returnMap.put("CustomerList", CustomerList);
		
		return returnMap;
	}
	
	public Map<String, Object> getCustomerOne(int customerId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ CustomerService.getCustomerOne 매개변수 customerId : "+ customerId);
		
		return customerMapper.selectCustomerOne(customerId);
	}
}

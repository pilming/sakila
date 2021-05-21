package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.StaffView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class StaffController {
	@Autowired StaffService staffService;
	
	@GetMapping("/getStaffList")
	public String getStaffViewList(Model model) {
		List<StaffView> staffViewList = staffService.getStaffViewList();
		log.debug("StaffController.getStaffViewList ▶▶▶▶▶▶ staffViewList :"+ staffViewList);
		model.addAttribute("staffViewList",staffViewList);
		return "getStaffList";
	}
	
	@GetMapping("/getStaffOne")
	public String getStaffViewList(Model model,
									@RequestParam(value = "id", required = true)int staffId) {
		Map<String, Object> staffMap = staffService.getStaffViewOne(staffId);
		log.debug("StaffController.getStaffViewList ▶▶▶▶▶▶ staffMap :"+ staffMap);
		model.addAttribute("staffMap",staffMap);
		return "getStaffOne";
	}
}

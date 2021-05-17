package com.gd.sakila.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	//Logger log  = LoggerFactory .getLogger(this.getClass()); 에노테이션으로 대체
	@GetMapping({"/", "/home", "/index"})
	public String home() {
		System.out.println("home controller");
		log.debug("test");
		return "home";
	}
}

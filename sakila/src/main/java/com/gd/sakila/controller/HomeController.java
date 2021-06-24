package com.gd.sakila.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired StaffService staffService;
	//Logger log  = LoggerFactory .getLogger(this.getClass()); 에노테이션으로 대체
	@GetMapping({"/", "/home"})
	public String home() {
		System.out.println("home controller");
		log.debug("test");
		return "home";
	}
	@GetMapping("/login1")
	public String home1() {
		System.out.println("home controller");
		log.debug("test");
		return "templogin";
	}
	@GetMapping("/index")
	public String home2() {
		System.out.println("home controller");
		log.debug("test");
		return "index";
	}
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";//aws테스트 적용
	}
	
	@PostMapping("/login")//aws테스트 적용
	public String login(HttpSession session, Staff staff) { //servlet 세션 직접 사용, 컨트롤러 매서드의 매개변수는 DI대상
		log.debug("HomeController ◆◆◆◆◆◆◆◆◆◆◆◆parm staff :" + staff);
		Staff loginStaff =  staffService.login(staff);
		log.debug("HomeController ◆◆◆◆◆◆◆◆◆◆◆◆return loginStaff :" + loginStaff);
		if(loginStaff != null) { //로그인 성공
			session.setAttribute("loginStaff", loginStaff);
			
		} 
		return "redirect:/";//aws테스트 적용
	}
}

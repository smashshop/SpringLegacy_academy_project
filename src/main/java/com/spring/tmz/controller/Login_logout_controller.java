package com.spring.tmz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Login_logout_controller {
	
	@GetMapping("/login")
	public String loginPageGet(String error, String logout, Model model) {
		
		if (error != null) {
			model.addAttribute("error", "로그인 오류. 계정이나 암호를 확인하세요.");
			return "/login";
		}
		else if (logout != null) {
			model.addAttribute("logout", "정상적으로 로그아웃 됨");
			return "/login";
		}
		else {
			model.addAttribute("normal", "정상적인 로그인 페이지 호출 처리");
			return "/login";
		}		
	}
	
	@GetMapping("/logout")
	public String logoutPageGet() {
		
		return "redirect:/main";
	}

}

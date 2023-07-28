package com.spring.tmz.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class Err_msg_controller {
	
	@GetMapping("/accessForbiddenError")
	public String callAccessForbiddenPage(Authentication authentication, String msg1, Model model) {
		//System.out.println("======= Forbidden 오류에 대한 메세지 전송 메소드 시작 =======");
		//log.info("엑세스 거부 시 전달된 Authentication 객체: " + authentication);
		model.addAttribute("msg", "접근이 금지되었습니다.");
		model.addAttribute("msg1", msg1);
		
		return "err_msg/access_forbidden_msg";
	}
}

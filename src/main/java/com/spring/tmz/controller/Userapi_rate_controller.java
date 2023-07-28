package com.spring.tmz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.tmz.domain.Userinfo_rateVO;
import com.spring.tmz.service.Mypage_service;

import lombok.Setter;

//@RequestMapping("/mypage/*")
@RestController
public class Userapi_rate_controller {

	@Setter(onMethod_ = @Autowired)
	private Mypage_service mypage_service;
	
//	public mypage_controller(Mypage_service mypage_service) {
//		this.mypage_service = mypage_service;
//	}
	
	//mypage userinfo rating 테이블전송
	@PostMapping(value="/party_rate", consumes = {"application/json; charset=UTF-8"})
	
	public boolean send_rate(@RequestBody Userinfo_rateVO userinfo_rate, RedirectAttributes redirectAttr) {
		
		System.out.println(userinfo_rate.getRate_num());
//		if(mypage_service.rate_party(userinfo_rate)) {
//			redirectAttr.addFlashAttribute("result", "ratedResult");
//		}
		
		return mypage_service.rate_party(userinfo_rate);
	}
}

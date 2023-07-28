package com.spring.tmz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.tmz.domain.UserinfoVO;
import com.spring.tmz.domain.Userinfo_rateVO;
import com.spring.tmz.mapper.Userinfo_mapper;
import com.spring.tmz.service.Mypage_service;
import com.spring.tmz.service.Userinfo_service;

import lombok.Setter;

//@RequestMapping("/mypage/*")
@RestController
public class Userapi_controller {

	@Setter(onMethod_ = @Autowired)
	private Mypage_service mypage_service;
	
	@Autowired @Qualifier("bCryptPasswordEncoder")
    private PasswordEncoder encoder;
	
	@Setter(onMethod_ = @Autowired)
	private Userinfo_service userinfo_service;
	
//	public mypage_controller(Mypage_service mypage_service) {
//		this.mypage_service = mypage_service;
//	}
	
	//mypage userinfo rating 테이블전송
	@PostMapping(value="/party_rate", produces = "application/json; charset=UTF-8")
	public boolean send_rate(@RequestBody Userinfo_rateVO userinfo_rate, RedirectAttributes redirectAttr) {
		
		System.out.println(userinfo_rate.getRate_num());
//		if(mypage_service.rate_party(userinfo_rate)) {
//			redirectAttr.addFlashAttribute("result", "ratedResult");
//		}
		
		return mypage_service.rate_party(userinfo_rate);
	}
	
	//mypage 의 userinfo 비밀번호 수정 & 수정 시 암호화
	@PreAuthorize("isAuthenticated() && principal.username == #user_id")
	@GetMapping(value="/mypw_modify/{user_pw}/{user_id}", produces= "application/json; charset=UTF-8")
	public ResponseEntity<Boolean> info_pw_mod(@PathVariable("user_pw") String user_pw, @PathVariable("user_id") String user_id) {

		UserinfoVO userinfo = mypage_service.get_mypage_info(user_id);
		
		userinfo.setUser_pw(encoder.encode(user_pw));
		
		if(mypage_service.modify_info_pw(userinfo)){
			System.out.println("success"+mypage_service.modify_info_pw(userinfo));
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		}else {
			System.out.println("error"+mypage_service.modify_info_pw(userinfo));
			return new ResponseEntity<Boolean>(false, HttpStatus.OK);
		}
	}
	
	
}

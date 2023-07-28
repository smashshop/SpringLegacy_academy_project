package com.spring.tmz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.PartyVO;
import com.spring.tmz.domain.UserinfoVO;
import com.spring.tmz.service.Member_detail_service;
import com.spring.tmz.service.Mypage_service;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class mypage_controller {
	
	@Setter(onMethod_ = @Autowired)
	private Member_detail_service member_service;
	
	@Setter(onMethod_ = @Autowired)
	private Mypage_service mypage_service;
	
	@Autowired @Qualifier("bCryptPasswordEncoder")
    private PasswordEncoder encoder;
	
	//mypage 의 userinfo 상세 조회, 수정페이지 조회.
	@PreAuthorize("isAuthenticated() && principal.username == #user_id")
	@GetMapping({"/myinfo_detail", "/myinfo_modify"})
	public void show_mypage_info(@RequestParam("user_id") String user_id, Model model) {

		model.addAttribute("myinfo", mypage_service.get_mypage_info(user_id));
		
	}
	
	//mypage 의 userinfo 수정
	@PreAuthorize("isAuthenticated() && principal.username == #userinfo.user_id")
	@PostMapping("/myinfo_modify")
	public String info_detail_mod(UserinfoVO userinfo, RedirectAttributes redirectAttr) {

		if(mypage_service.modify_info_detail(userinfo)) {
			redirectAttr.addFlashAttribute("result", "successModify");
		}
		
//		redirectAttr.addAttribute("user_name", userinfo.getUser_name());
//		redirectAttr.addAttribute("user_bitrh", userinfo.getUser_birth());
//		redirectAttr.addAttribute("user_tag", userinfo.getUser_tag());
		
		return "redirect:/mypage/myinfo_detail?user_id="+ userinfo.getUser_id();
	}
	
	//mypage 의 userinfo 비밀번호 수정 & 수정 시 암호화
//	@PreAuthorize("isAuthenticated() && principal.username == #userinfo.user_id")
//	@PostMapping("/mypw_modify")
//	public String info_pw_mod(UserinfoVO userinfo, RedirectAttributes redirectAttr) {
//
//		String user_pw = userinfo.getUser_pw().toString();
//		String new_pw = encoder.encode(user_pw);
//		
//		userinfo.setUser_pw(new_pw);
//		
//		if(mypage_service.modify_info_pw(userinfo)) {
//			redirectAttr.addFlashAttribute("result", "successModify");
//		}
//		//redirectAttr.addAttribute("user_pw", userinfo.getUser_pw());
//		
//		return "redirect:/mypage/myinfo_detail?user_id="+ userinfo.getUser_id();
//		}

	
	//mypage 모달에서 비번 재확인
	@PreAuthorize("isAuthenticated() && principal.username == #user_id")
	@GetMapping(value="/mypw_check/{user_id}/{check_pw}", 
				produces={"application/json;charset=utf-8", "text/plain; charset=UTF-8"})
	public ResponseEntity<Boolean> pw_check(@PathVariable("user_id")String user_id, @PathVariable("check_pw")String check_pw, UserinfoVO userinfo){
		
		userinfo = mypage_service.get_mypage_info(user_id);
		
		
		if(encoder.matches(check_pw, userinfo.getUser_pw())) {
			return new ResponseEntity<>(true, HttpStatus.OK);
		}else {
			return new ResponseEntity<>(false, HttpStatus.OK);
		}
	
	}
	
	////mypage 의 user 탈퇴 버튼 (user_delflag를 1로 수정)
	@PreAuthorize("isAuthenticated() && principal.username == #user_id")
	@PostMapping("/myid_remove")
	public String remove_my_id(@RequestParam("user_id")String user_id, RedirectAttributes redirectAttr, UserinfoVO userinfo) {
		
		if(mypage_service.remove_user_id(user_id)){
			redirectAttr.addFlashAttribute("result", "successModify");
		}
		return "redirect:/"; //나중에 메인으로 보내기
	}
	
	//mypage 본인이 쓴 동행글 리스트
	@PreAuthorize("isAuthenticated() && principal.username == #frnd_writer")
	@GetMapping("/mypage_frnd_list")
	public void mypage_frnd_list(@RequestParam("frnd_writer") String frnd_writer, Model model) {
		model.addAttribute("myfrnd_list", mypage_service.get_frnd_list(frnd_writer, 1));
		
		model.addAttribute("frnd_writer", frnd_writer); //나중에 로그인 구현하면 이거 지우기
		
	}
	
	//mypage 본인이 쓴 후기글 리스트
	@PreAuthorize("isAuthenticated() && principal.username == #rv_writer")
	@GetMapping("/mypage_rv_list")
	public void mypage_rv_list(@RequestParam("rv_writer") String rv_writer, Model model) {
		model.addAttribute("myrv_list", mypage_service.get_rv_list(rv_writer));
		
		model.addAttribute("rv_writer", rv_writer); //나중에 로그인 구현하면 이거 지우
	}
	
	//mypage 유저의 동행 리스트
	@PreAuthorize("isAuthenticated() && principal.username == #party_member")
	@GetMapping("/mypage_prty_list")
	public void mypage_prty_list(@RequestParam("party_member") String party_member, Integer page_num, Model model) {
		
		if(page_num == null || page_num < 0 ) {
			page_num = 1;
		}
		model.addAttribute("myprty_list", mypage_service.get_prty_list(party_member, page_num));
		
		//조인한 테이블도 가져오는 
		model.addAttribute("party_member", party_member); //나중에 로그인 구현하면 이거 지우
	}
	
	@ResponseBody
	@PostMapping(value="/more_party_list/{user_id}/{page_num}", produces = "application/json;charset=utf-8")
	public ResponseEntity<List<PartyVO>> more_party(@PathVariable String user_id, @PathVariable Integer page_num){
		
		return new ResponseEntity<List<PartyVO>>(mypage_service.get_prty_list(user_id, page_num), HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value="/more_frnd_list/{user_id}/{page_num}", produces = "application/json;charset=utf-8")
	public ResponseEntity<List<FriendVO>> more_frnd(@PathVariable String user_id, @PathVariable Integer page_num){
		
		return new ResponseEntity<List<FriendVO>>(mypage_service.get_frnd_list(user_id, page_num), HttpStatus.OK);
	}
	
}

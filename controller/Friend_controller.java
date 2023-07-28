package com.spring.tmz.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.tmz.domain.CountryVO;
import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.PagingDTO;
import com.spring.tmz.domain.Userinfo_rateVO;
import com.spring.tmz.service.Continent_service;
import com.spring.tmz.service.Country_service;
import com.spring.tmz.service.Friend_service;
import com.spring.tmz.service.Userinfo_service;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/friend")
@AllArgsConstructor
public class Friend_controller {
	
	private Friend_service friend_service;
	private Country_service country_service;
	private Continent_service continent_service;
	private Userinfo_service userinfo_service;
	
	//상세페이지 요청
	@GetMapping("/friend-detail")
	public String show_frnd_detail(Integer frnd_no, Model model) {
		model.addAttribute("frnd_info", friend_service.get_frnd(frnd_no));
		
		String user_id = friend_service.get_frnd(frnd_no).getFrnd_writer();
		model.addAttribute("user_info", userinfo_service.get_userinfo(user_id));
		return "friend/friend_detail";
	}
	
	//수정페이지 요청
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/friend-modify")
	public String show_frnd_modify(Integer frnd_no, Model model) {
		
		FriendVO friendVO = friend_service.get_frnd(frnd_no);
		
		//줄바꿈 표시를위해 변환된 <br>을 \n으로 변경
		friendVO.setFrnd_content(friendVO.getFrnd_content().replace("<br>", "\r\n"));
		model.addAttribute("frnd_info", friendVO);
		
		List<CountryVO> country_list = country_service.get_country_list(friendVO.getFrnd_continent());
		
		//나라 정보 리스트를 전송
		model.addAttribute("country_info", country_list);
		
		//대륙 정보 리스트를 전송
		model.addAttribute("continent_info", continent_service.get_continent_list());
		
		return "friend/friend_modify";
	}
	
	//게시물수정 요청
	@PreAuthorize("isAuthenticated() && principal.username == #friendVO.frnd_writer")
	@PostMapping("/friend-modify")
	public String update_frnd_modify(FriendVO friendVO, RedirectAttributes ra) {
		
		//줄바꿈 표시를위해 \n을 <br>로 변환
		friendVO.setFrnd_content(friendVO.getFrnd_content().replace("\r\n", "<br>"));
		if(friend_service.modify_frnd(friendVO)) {
			ra.addFlashAttribute("frnd_result", "modify-success");
		}
			
		return "redirect:/friend/friend-detail?frnd_no=" + friendVO.getFrnd_no();
	}
	
	//게시물삭제 요청
	@PreAuthorize("isAuthenticated() && principal.username == #friendVO.frnd_writer")
	@PostMapping("/friend-delete")
	public String update_frnd_delete(FriendVO friendVO, RedirectAttributes ra) {
		int frnd_no = friendVO.getFrnd_no();

		friend_service.modify_frnd_delflag(frnd_no, 1);
		
		return "redirect:/friend/friend-list";
	}
	
	@PostMapping(value = "/get-user-detail/{user_id}", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<List<Userinfo_rateVO>> get_user_detail(@PathVariable("user_id") String user_id){
		return new ResponseEntity<List<Userinfo_rateVO>> (friend_service.get_userinfo_rate(user_id), HttpStatus.OK);
	}
	
	//게시물 목록 조회
	@GetMapping("/friend-list")
	public String show_friend_list(PagingDTO pagingDTO, Model model) {
		System.out.println("컨트롤러 - 게시물 목록 조회.....");
		System.out.println("컨트롤 - 페이징 처리 데이터 조회: " + pagingDTO);
		model.addAttribute("frnd_list", friend_service.get_frnd_list(pagingDTO));
		model.addAttribute("frnd_page", pagingDTO);
		model.addAttribute("continent_info", continent_service.get_continent_list());		
		//model.addAttribute("country_info", country_service.get_country_list());

		return "friend/friend_list";
	}
	
	//목록 페이지 -페이징 처리
	@ResponseBody
	@PostMapping(value = "/friend-list/friend-page", consumes = "application/json; charset=UTF-8", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<FriendVO>> show_friend_list_ajax(@RequestBody PagingDTO pagingDTO) {
		System.out.println(pagingDTO);
		return new ResponseEntity<List<FriendVO>>(friend_service.get_frnd_list(pagingDTO), HttpStatus.OK);
	}
	
	//게시물 등록 - 페이지 호출
	@PreAuthorize("isAuthenticated()")	
	@GetMapping("/friend-register")
	public String show_register_friend_page(Model model) {
		model.addAttribute("continent_info", continent_service.get_continent_list());
		
		return "friend/friend_register";
	}
	
	
	//게시물 등록 - 처리
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/friend-register")
	public String register_friend(FriendVO friendVO, RedirectAttributes redirectAttr) {
		
		System.out.println("============= attach_Info =============");
		if (friendVO.getAttach_file_list() != null) {
			friendVO.getAttach_file_list()
					.forEach(attach_file -> System.out.println("첨부 파일 정보: " + attach_file.toString()));
		}
		System.out.println("==========================================");
		
		Integer frnd_no = friend_service.register_frnd(friendVO);
		
		redirectAttr.addFlashAttribute("result", frnd_no);
		
		return "redirect:/friend/friend-list";
	}
	
	// ajax 대륙 선택시 실행할 메소드
	@GetMapping(value = "get-country-list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<List<CountryVO>> get_country_list(String continent_name){
		return new ResponseEntity<List<CountryVO>>(country_service.get_country_list(continent_name), HttpStatus.OK);
	}
	
}

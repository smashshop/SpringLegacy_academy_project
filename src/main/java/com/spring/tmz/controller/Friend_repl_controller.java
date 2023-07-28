package com.spring.tmz.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.tmz.domain.Friend_replVO;
import com.spring.tmz.service.Friend_repl_service;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/friend-repl")
@AllArgsConstructor
public class Friend_repl_controller {
	
	Friend_repl_service friend_repl_service;
	
	// 신청 댓글 수락
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/frepl-confirm")
	public String modify_frepl_confirm(int frepl_no, char frepl_confirm, int frnd_no) {
		System.out.println(frepl_confirm);
		friend_repl_service.modify_repl_confirm(frepl_no, frepl_confirm, frnd_no);
		return "redirect:../friend/friend-detail?frnd_no=" + frnd_no;
	}
	
	// 신청 댓글 리스트 조회
	@GetMapping(value = "/friend-{frnd_no}/friend-get/{page_num}", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<List<Friend_replVO>> get_apply_list(@PathVariable Integer frnd_no, @PathVariable int page_num){
		List<Friend_replVO> repl_list =  friend_repl_service.get_repl_list(frnd_no, page_num);
		return new ResponseEntity<List<Friend_replVO>>(repl_list, HttpStatus.OK);
	}
	
	// 신청 댓글 입력
	@PostMapping(value = "/friend-new", consumes = "application/json;charset=UTF-8",
			produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> apply_party(@RequestBody Friend_replVO friend_replVO){
		//줄바꿈 표시를위해 \n을 <br>로 변환
		friend_replVO.setFrepl_content(friend_replVO.getFrepl_content().replace("\n", "<br>"));
		System.out.println(friend_replVO.getFrepl_content());
		return friend_repl_service.set_repl(friend_replVO) ? new ResponseEntity<String>("신청성공", HttpStatus.OK) :
														new ResponseEntity<String>("신청실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}

package com.spring.tmz.service;

import java.util.List;

import com.spring.tmz.domain.Friend_replVO;

public interface Friend_repl_service {
	
	// 특정 동행 게시글의 신청댓글 리스트
	public List<Friend_replVO> get_repl_list(int frnd_no, int page_num);
	
	// 특정 동행 게시글의 신청댓글 등록
	public boolean set_repl(Friend_replVO friend_replVO);
	
	// 동행글 작성자가 신청 수락
	public boolean modify_repl_confirm(int frepl_no, char frepl_confirm, int frnd_no);
		
}

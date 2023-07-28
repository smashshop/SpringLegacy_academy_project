package com.spring.tmz.service;

import org.springframework.transaction.annotation.Transactional;

import com.spring.tmz.domain.Review_replyVO;
import com.spring.tmz.domain.Review_reply_pagingDTO;
import com.spring.tmz.domain.Review_reply_paging_creatorDTO;

public interface Review_reply_service {
	
	//1. 특정 게시물에 대한 댓글 목록 조회(페이징-전체댓글 수 고려) 	
	public Review_reply_paging_creatorDTO get_reply_list_by_rv_no(Review_reply_pagingDTO review_reply_pagingDTO);
	
	//2. 특정 게시물의 댓글 총 개수확인
	public long get_reply_total_by_rv_no(Review_reply_pagingDTO review_reply_paging);
	
	//3. 특정 게시물에 대한 댓글 등록: rrepl_no 반환
	public long register_reply_for_review_board(Review_replyVO review_replyVO);
	
	// 4. 댓글의 답글 등록: rrepl_no 반환
	public long register_reply_for_reply(Review_replyVO review_replyVO);
	
	//5. 특정 댓글 조회
	public Review_replyVO get_reply(long rv_no, long rrepl_no);
	
	//6. 특정 댓글 수정: 수정된 행수인 1 반환
	public int modify_reply(Review_replyVO review_replyVO);
	
	//7. 특정 댓글 삭제: 삭제된 행수인 1 반환
	public int remove_reply(long rv_no, long rrepl_no);

}

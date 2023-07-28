package com.spring.tmz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.tmz.domain.ReviewVO;
import com.spring.tmz.domain.Review_likeVO;
import com.spring.tmz.domain.Review_pagingDTO;
import com.spring.tmz.domain.Review_regionVO;


public interface Review_mapper {

	//후기 게시글 조회 
//	public List<ReviewVO> select_review_list();
	
	public List<ReviewVO> select_review_list_main();
	
	//게시물 조회 - 목록(페이징 고려)
		public List<ReviewVO> select_review_list(Review_pagingDTO review_pagingDTO);
		
		//후기 게시물 등록
		public Integer insert_review_board(ReviewVO my_review); 
		
	   //특정 게시물 조회
		public ReviewVO search_review_board(Long rv_no);
		
		//특정 게시물 수정
		public int update_review_board(ReviewVO my_review);
		
		//특정 게시물 삭제 요청 - 해당 글의 bdelFlag을 1로 수정
		public int update_review_delflag(Long RV_NO);
		
		//특정 게시물 삭제 - 실제 삭제
		 public int delete_review_board(Long RV_NO);
		 
		 //게시물 삭제(관리자) – 사용자 삭제 요청된 게시물(bdelFlag = 1) 전체 삭제
		 public int delete_all_review_board_set_deleted();
		 
		//게시물 총 개수 조회(페이징)
	    public long select_review_row_amount_total(Review_pagingDTO review_pagingDTO);
	    
	    //특정 게시물 댓글/답글 수 변경: 삭제 시 -1, 추가 시 +1 
	    public void update_rv_reply_cnt(@Param("rv_no") Long rv_no, @Param("amount") int amount);
	    
	    //나라이름 가져오기
	    public List<Review_regionVO> select_review_country(@Param("continent_name") String continent_name);
	    
	    //대륙이름 가져오기
	    public List<Review_regionVO> select_review_continent();
	    
	    //좋아요 하트 눌렀을 때
	    public Integer insert_review_like(Review_likeVO review_likeVO);
	    
	    //좋아요 하트 취소했을 때
	    public Integer disable_rv_like_check(Review_likeVO review_likeVO);
	    
	    //특정 게시물의 좋아요 총 갯수 구하기
	    public int review_like_total(Review_likeVO review_likeVO);
	    
	    // 특정 게시물 의 좋아요 갯수 없데이트
	    public int update_rv_like_check(@Param("rv_like_cnt") int rv_like_cnt,@Param("rv_no") int rv_no);
	    
	    //좋아요 누른 멤버 구하기
	    public List<Review_likeVO> select_review_like_member(Review_likeVO review_likeVO);
    
    
    
    
}

package com.spring.tmz.service;

import java.util.List;

import com.spring.tmz.domain.ReviewVO;
import com.spring.tmz.domain.Review_attach_fileVO;
import com.spring.tmz.domain.Review_likeVO;
import com.spring.tmz.domain.Review_pagingDTO;
import com.spring.tmz.domain.Review_regionVO;



public interface Review_service { 
	
	public List<ReviewVO> get_review_board_list_main();
	
	//1.게시물 등록: selectKey이용
		 public long register_review_board(ReviewVO my_review);
		 
		 //2.특정 게시물 조회
		 public ReviewVO get_board_detail_modify(Long rv_no);
		 
		//3.특정 게시물 삭제 요청
		 public boolean set_review_board_deleted(long rv_no);
		 
		//4.특정 게시물 직접 삭제 서비스 
		 public boolean remove_review_board(long rv_no);
		 
		//5. 특정 게시물 수정 서비스
		 public boolean modify_review_board(ReviewVO my_review);
		 
		 //6. 게시물 전체 삭제
		 public int remove_all_review_deleted_board();
		 
		//7.게시물 목록 조회 서비스-페이징 고려
		 public List<ReviewVO> get_review_board_list(Review_pagingDTO review_pagingDTO);

		//8.게시물 총 개수 조회 서비스 - 페이징 시 필요
		 public long get_review_row_amount_total(Review_pagingDTO review_pagingDTO);
		 
		//9. 게시물의 첨부파일 조회
		 public List<Review_attach_fileVO> get_review_attach_files_by_rv_no(long rv_no);
		 

		//10. 특정 게시물의 첨부파일 삭제
		public int delete_review_attach_file(String ruuid);
		
		//11. 나라이름 가져오기
		public List<Review_regionVO> select_review_country(String continent_name);
		
		//12. 대륙이름 가져오기
		public List<Review_regionVO> select_review_continent();
		
		//13. 좋아요 하트 눌렀을 때
		public Integer insert_review_like(Review_likeVO review_likeVO);
		
		//14. 좋아요 하트 취소했을 때
		public Integer disable_rv_like_check(Review_likeVO review_likeVO);
		
		//15. 특정 게시물의 좋아요 총 개수 구하기
		public int review_like_total(Review_likeVO review_likeVO);
		
		//16. 특정 게시물 의 좋아요 갯수 없데이트 //오류가 생길 수 있음
	    public int update_rv_like_check(Review_likeVO review_likeVO);
	    
	    //17. 좋아요 누른 멤버 구하기
	    public List<Review_likeVO> select_review_like_member(Review_likeVO review_likeVO);
	
	
}

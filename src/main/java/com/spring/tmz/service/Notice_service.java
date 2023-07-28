package com.spring.tmz.service;

import java.util.List;

import com.spring.tmz.domain.NoticeVO;
import com.spring.tmz.domain.Notice_fileVO;
import com.spring.tmz.domain.Notice_likeVO;
import com.spring.tmz.domain.Notice_pagingDTO;
import com.spring.tmz.domain.Notice_regionVO;

public interface Notice_service {
	
	//공지사항 목록 조회(페이징 고려)
		public List<NoticeVO> get_notice_list (Notice_pagingDTO notice_pagingDTO);
		
		//공지사항 글 등록 selectkey 이용
		public long register_notice_board(NoticeVO noticeVO);

		
		//공지사항 특정 글 조회(조회수X)
		public NoticeVO get_notice_detail_modify(long ntc_no);
		
		
		//공지사항 게시물 삭제 요청
		public boolean set_notice_delted(long ntc_no);
		
		
		//공지사항 게시물 실제 삭제
		public boolean remove_notice(long ntc_no);
		
		
		//공지사항 게시물 전체 삭제(요청1인거)
		public int remove_all_notice();
		
		
		//공지사항 특정 글 수정
		public boolean update_notice(NoticeVO noticeVO);
		
		//공지사항 총 게시글 조회(페이징할때 필요)
		public long get_notice_total(Notice_pagingDTO notice_pagingDTO);
		

		////공지글 첨부파일 조회
		public List<Notice_fileVO> get_notice_file_ntcno(long ntc_no);
		
		
		//공지사항 특정 첨부파일 삭제
		public int delete_notice_file(String nuuid);

		
		//DB에서 나라이름 가져오기
		public List<Notice_regionVO> select_notice_country(String continent_name);
		
		//DB에서 대륙가져오기
		public List<Notice_regionVO>select_notice_continent();
		
		
		//공지사항 좋아요 눌렀을때
		public Integer insert_notice_like (Notice_likeVO notice_likeVO);
		
		//공지사항 좋아요 취소했을때
		public Integer disable_notice_like (Notice_likeVO notice_likeVO);
		
		//공지사항 좋아요 총 갯수 구하기
		public int notice_like_total(Notice_likeVO notice_likeVO);
		
		//공지사항 좋아요 갯수 업데이트 -  어디가에선 ntc_like_cnt를 구해야함 
		public int update_notice_like_check(Notice_likeVO notice_likeVO);
		
		//공지사항 좋아요 누른 사람 누구?
		public List<Notice_likeVO> select_notice_like_user(Notice_likeVO notice_likeVO);
	
	
	
	
	
}

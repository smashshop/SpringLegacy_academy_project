package com.spring.tmz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.tmz.domain.NoticeVO;
import com.spring.tmz.domain.Notice_likeVO;
import com.spring.tmz.domain.Notice_pagingDTO;
import com.spring.tmz.domain.Notice_regionVO;

public interface Notice_mapper {
	
	//공지사항 목록 표시(페이징 고려x)
//	public List<NoticeVO> select_notice_list ();
	
	//공지사항 목록 조회(페이징 고려)
	public List<NoticeVO> select_notice_list(Notice_pagingDTO notice_pagingDTO);
	
	//공지사항 글 작성
	public Integer insert_notice(NoticeVO noticeVO);
	
	//특정 공지사항 글 조회 
	public NoticeVO search_notice(long ntc_no);
	
	//공지사항 글 수정
	public int update_notice(NoticeVO noticeVO);
	
	//공지사항 글 삭제(요청)
	public int update_notice_delflag(long ntc_no);
	
	//공지사항 글 실제 삭제
	public int delete_notice (long ntc_no);
	
	//공지사항 글 실제 삭제(한번에)
	public int delete_all_notice();
	
	//공지글 총 개수 조회 (페이징 고려)
	public long select_notice_rowamoun_total(Notice_pagingDTO notice_pagingDTO);
	
	
	//DB에서 나라이름 가져오기
	public List<Notice_regionVO> select_notice_country(@Param("continent_name") String continent_name);
	
	//DB에서 대륙 가져오기
	public List<Notice_regionVO>select_notice_continent();
	
	
	//공지사항 좋아요 눌렀을때
	public Integer insert_notice_like (Notice_likeVO notice_likeVO);
	
	//공지사항 좋아요 취소했을때
	public Integer disable_notice_like (Notice_likeVO notice_likeVO);
	
	//공지사항 좋아요 총 갯수 구하기
	public int notice_like_total(Notice_likeVO notice_likeVO);
	
	//공지사항 좋아요 갯수 업데이트 -  어디가에선 ntc_like_cnt를 구해야함 
	public int update_notice_like_check(@Param("ntc_like_cnt") int ntc_like_cnt, @Param("ntc_no") int ntc_no);
	
	//공지사항 좋아요 누른 사람 누구?
	public List<Notice_likeVO>  select_notice_like_user(Notice_likeVO notice_likeVO);
}

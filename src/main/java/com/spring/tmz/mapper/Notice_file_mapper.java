package com.spring.tmz.mapper;

import java.util.List;

import com.spring.tmz.domain.Notice_fileVO;

public interface Notice_file_mapper {
	
	//공지사항 첨부파일 추가 
	public void insert_notice_file(Notice_fileVO notice_fileVO);
	
	//공지사항 모든 첨부파일 조회
	public List<Notice_fileVO> select_notice_file_no(long ntc_no);
	
	//특정 공지글의 첨부파일 삭제
	public int delete_notice_file(String nuuid);
	
	//특정 공지글의 모든 첨부파일 삭제
	public void delete_notice_allfile(long ntc_no);
	
	//하루 전의 공지글 첨부파일 정보 조회 
	public List<Notice_fileVO> select_notice_file_before_one ();
	
	
	
	
	
	
	
}

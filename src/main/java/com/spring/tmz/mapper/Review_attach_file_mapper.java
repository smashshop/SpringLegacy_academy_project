package com.spring.tmz.mapper;

import java.util.List;

import com.spring.tmz.domain.Review_attach_fileVO;

public interface Review_attach_file_mapper {
	
	//첨부파일 추가
	public void insert_review_attach_file(Review_attach_fileVO review_attach_fileVO);
	
	//특정 게시물의 모든 첨부파일 조회
	public List<Review_attach_fileVO> select_review_attach_files_by_rv_no(Long rv_no);
	
	//특정 첨부파일 삭제
	public int delete_review_attach_file(String ruuid);
	
	//특정 게시물의 모든 첨부파일 삭제
	public void delete_review_attach_files_by_rv_no(Long rv_no);
	
	//하루전의 첨부파일 정보 조회
	public List<Review_attach_fileVO> select_review_attach_files_before_one_day();
}

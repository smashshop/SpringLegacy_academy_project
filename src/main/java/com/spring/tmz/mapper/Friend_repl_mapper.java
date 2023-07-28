package com.spring.tmz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.tmz.domain.Friend_replVO;

public interface Friend_repl_mapper {
	
	public List<Friend_replVO> select_repl_list_nopaging(int frnd_no);
	
	// 특정 동행 게시글의 신청댓글 리스트
	public List<Friend_replVO> select_repl_list(@Param("frnd_no") int frnd_no,@Param("page_num") int page_num);
	
	// 특정 동행 게시글의 신청댓글 등록
	public boolean insert_repl(Friend_replVO friend_replVO);
	
	// 동행글 작성자가 신청 수락
	public boolean update_repl_confirm(@Param("frepl_no")int frepl_no, @Param("frepl_confirm")char frepl_confirm);
	
}

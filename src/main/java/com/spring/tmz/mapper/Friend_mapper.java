package com.spring.tmz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.tmz.domain.Confirm_partyVO;
import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.PagingDTO;
import com.spring.tmz.domain.Userinfo_rateVO;

public interface Friend_mapper {
	
	//동행 게시물(Friend) 목록 조회
	public List<FriendVO> select_frnd_list_nopaging();
	
	//게시물에서 유저의 평점정보 가져오기
	public List<Userinfo_rateVO> select_userinfo_rate(String user_id);
	
	//public List<FriendVO> select_frnd_list();
	public List<FriendVO> select_frnd_list(PagingDTO pagingDTO);
	
	//동행 게시물 등록
	public Integer insert_frnd(FriendVO friendVO);
	   
	//특정 게시물 조회
	public FriendVO select_frnd( Integer frnd_no);
	   
	//특정 게시물 삭제 요청 - 해당 글의 delFlag를 1로 수정(단순 값 변경)
	public boolean update_frnd_delflag(@Param("frnd_no") Integer frnd_no, @Param("frnd_delflag")int frnd_delflag);
	
	public boolean insert_confirm_party(Confirm_partyVO confirm_partyVO);
	   
//	//관리자: 삭제 요청된 게시물 일괄 삭제(delFlag 값이 1인 게시물들)
//	public int deleteAlldelFlag(); 
	   
//	//특정 게시물 삭제
//	public int delete_frnd(Integer frnd_no);
	   
	//특정 게시물 수정
	public int update_frnd(FriendVO friendVO);
	
	//동행 수락에 따른 frnd_now_mem 1씩 증가
	public boolean update_now_mem(@Param("frnd_now_mem") int frnd_now_mem, @Param("frnd_no") int frnd_no);

	public boolean update_frnd_status(FriendVO friendVO);
}

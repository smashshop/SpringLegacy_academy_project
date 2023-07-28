package com.spring.tmz.service;

import java.util.List;

import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.PartyVO;
import com.spring.tmz.domain.ReviewVO;
import com.spring.tmz.domain.UserinfoVO;
import com.spring.tmz.domain.Userinfo_rateVO;

public interface Mypage_service {
	
	//mypage 사용자 정보 디테일 보기
	public UserinfoVO get_mypage_info(String user_id);
	
	//mypage 사용자 정보 디테일 에서 수정 (수정 후 다시 디테일 페이지)
	public boolean modify_info_detail(UserinfoVO userinfo);
	
	//mypage 사용자 정보 디테일 에서 수정 (수정 후 다시 디테일 페이지)
	public boolean modify_info_pw(UserinfoVO userinfo);
	
	//마이페이지 회원탈퇴(delflag 삭제)
	public boolean remove_user_id(String user_id);
	
	//mypage frnd글 목록조회
	public List<FriendVO> get_frnd_list(String user_id, int page_num);
	public List<FriendVO> get_frnd_list_admin(String user_id);
	
	//mypage rv글 목록조회
	public List<ReviewVO> get_rv_list(String user_id);
	
	//mypage party 멤버 목록조회
	public List<PartyVO> get_prty_list(String user_id, int page_num);
	
	//mypage party 모달에서 마이페이지 평점주기
	public boolean rate_party(Userinfo_rateVO userinfo_rate);
	
	//
}

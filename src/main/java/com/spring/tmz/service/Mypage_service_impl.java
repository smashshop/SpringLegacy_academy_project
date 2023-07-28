package com.spring.tmz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.PartyVO;
import com.spring.tmz.domain.ReviewVO;
import com.spring.tmz.domain.UserinfoVO;
import com.spring.tmz.domain.Userinfo_rateVO;
import com.spring.tmz.mapper.Mypage_mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class Mypage_service_impl implements Mypage_service{
	
	private Mypage_mapper mypage_mapper;
	
	//mypage 사용자 정보 디테일 보기
	@Override
	public UserinfoVO get_mypage_info(String user_id) {
		return mypage_mapper.select_mypage_detail(user_id);
	}
	
	//mypage 사용자 정보 디테일 수정버튼 클릭해서 수정
	@Override
	public boolean modify_info_detail(UserinfoVO userinfo) {
		
		return mypage_mapper.update_mypage(userinfo) == 1;
	}
	//mypage 사용자 비번 수정버튼 클릭해서 수정
	@Override
	public boolean modify_info_pw(UserinfoVO userinfo) {
		
		return mypage_mapper.update_mypw(userinfo) == 1;
	}
	
	//마이페이지 회원탈퇴버튼으로 delflag 1로 변경
	@Override
	public boolean remove_user_id(String user_id) {
		
		return mypage_mapper.update_mydelflag(user_id) == 1;
	}
	
	//mypage 사용자가 쓴 동행글 보기
	@Override
	public List<FriendVO> get_frnd_list(String user_id, int page_num){
		return mypage_mapper.select_myfrnd_list(user_id, page_num);
	}
	
	@Override
	public List<FriendVO> get_frnd_list_admin(String user_id){
		return mypage_mapper.select_myfrnd_list_admin(user_id);
	}

	//mypage 사용자가 쓴 후기글 보기
	@Override
	public List<ReviewVO> get_rv_list(String user_id){
		return mypage_mapper.select_myrv_list(user_id);
	}
	
	//로그인 사용자의 지난 동행 리스트
	@Override
	public List<PartyVO> get_prty_list(String user_id, int page_num){
		return mypage_mapper.select_myprty_list(user_id, page_num);
	}
	
	//로그인 사용자의 지난 동행 평점 주기-모달로./1회 점수 주면 더이상 점수주기 불가능
    @Override
    public boolean rate_party(Userinfo_rateVO userinfo_rate) {
      
       int count = mypage_mapper.count_rate(userinfo_rate);
      
       if (count > 0) {
          return false;
       }
      
       return mypage_mapper.insert_rate(userinfo_rate) == 1;
   }


}

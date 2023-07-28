package com.spring.tmz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.PartyVO;
import com.spring.tmz.domain.ReviewVO;
import com.spring.tmz.domain.UserinfoVO;
import com.spring.tmz.domain.Userinfo_rateVO;

public interface Mypage_mapper {
	
	//마이페이지 디테일
	public UserinfoVO select_mypage_detail(String user_id);
	
	//마이페이지 수정
	public int update_mypage(UserinfoVO userinfo);
	
	//마이페이지 비밀번호 수정
	public int update_mypw(UserinfoVO userinfo);
	
	//마이페이지 회원탈퇴
	public int update_mydelflag(@Param("user_id") String user_id);
	
	//마이페이지 동행글 리스트 - 클릭하면 동행글 디테일로 보내도록
	public List<FriendVO> select_myfrnd_list(@Param("user_id") String user_id, @Param("page_num") int page_num);
	public List<FriendVO> select_myfrnd_list_admin(@Param("user_id") String user_id);
	
	//마이페이지 후기글 리스트 보기 - 클릭하면 후기글 디테일로
	public List<ReviewVO> select_myrv_list(String user_id);
	
	//마이페이지 내가 한 동행 보기
	public List<PartyVO> select_myprty_list(@Param("user_id") String user_id, @Param("page_num") int page_num);
	
	//모달에서 마이페이지 평점주기
	public int insert_rate(Userinfo_rateVO userinfo_rate);
	
    //마이페이지 평점 줬는지 안줬는지 카운트
    public Integer count_rate(Userinfo_rateVO userinfo_rate);

}

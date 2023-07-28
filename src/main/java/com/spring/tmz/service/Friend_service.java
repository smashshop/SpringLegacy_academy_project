package com.spring.tmz.service;

import java.util.List;

import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.Friend_fileVO;
import com.spring.tmz.domain.PagingDTO;
import com.spring.tmz.domain.Userinfo_rateVO;

public interface Friend_service {
	
	
	public List<FriendVO> get_frnd_list(PagingDTO pagingDTO);
	
	public List<Userinfo_rateVO> get_userinfo_rate(String user_id);
	
	public int register_frnd(FriendVO friendVO);
	
	public FriendVO get_frnd(Integer frnd_no);
	
	public boolean modify_frnd(FriendVO friendVO);
	
	public boolean modify_frnd_delflag(Integer frnd_no, int frnd_delflag);
	
	public boolean modify_frnd_status(FriendVO friendVO);
	
	public List<Friend_fileVO> get_frnd_file(int frnd_no);
	
}

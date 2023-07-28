package com.spring.tmz.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.Friend_replVO;
import com.spring.tmz.mapper.Friend_mapper;
import com.spring.tmz.mapper.Friend_repl_mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class Friend_repl_service_impl implements Friend_repl_service{

	Friend_repl_mapper friend_repl_mapper;
	Friend_mapper friend_mapper;
	
	@Override
	public List<Friend_replVO> get_repl_list(int frnd_no, int page_num) {
		return friend_repl_mapper.select_repl_list(frnd_no, page_num);
	}

	@Override
	public boolean set_repl(Friend_replVO friend_replVO) {
		return friend_repl_mapper.insert_repl(friend_replVO);
	}

	@Transactional
	@Override
	public boolean modify_repl_confirm(int frepl_no, char frepl_confirm, int frnd_no) {
		boolean result;
		result = friend_repl_mapper.update_repl_confirm(frepl_no, frepl_confirm);
		System.out.println(result);
		if(frepl_confirm == '1') {
			friend_mapper.update_now_mem(1, frnd_no);
		}else {
			friend_mapper.update_now_mem(-1, frnd_no);
		}
		
		FriendVO friendVO = friend_mapper.select_frnd(frnd_no);
		if(friendVO.getFrnd_now_mem() >= friendVO.getFrnd_member_cnt()) {
			friendVO.setFrnd_status(true);
			friend_mapper.update_frnd_status(friendVO);
		}else {
			friendVO.setFrnd_status(false);
			friend_mapper.update_frnd_status(friendVO);
		}
		
		return result;
	}
	
}

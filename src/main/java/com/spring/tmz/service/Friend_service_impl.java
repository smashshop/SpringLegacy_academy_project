package com.spring.tmz.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.Friend_fileVO;
import com.spring.tmz.domain.PagingDTO;
import com.spring.tmz.domain.Userinfo_rateVO;
import com.spring.tmz.mapper.Friend_file_mapper;
import com.spring.tmz.mapper.Friend_mapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
public class Friend_service_impl implements Friend_service{
	
	private Friend_mapper friend_mapper;
	private Friend_file_mapper friend_file_mapper;
	
	@Override
	public List<FriendVO> get_frnd_list(PagingDTO pagingDTO) {
		List<FriendVO> friend_list = null;

		System.out.println("===================" + pagingDTO );
		friend_list = friend_mapper.select_frnd_list(pagingDTO);
		
		return friend_list;
	}
	
	@Override
	public List<Userinfo_rateVO> get_userinfo_rate(String user_id){
		System.out.println(user_id);
		return friend_mapper.select_userinfo_rate(user_id);
	}
	
	@Transactional
	@Override
	public int register_frnd(FriendVO friendVO) {
		
		friend_mapper.insert_frnd(friendVO);
		System.out.println("Friend_service에서 등록된 게시글의 frnd_no: " + friendVO.getFrnd_no());
		
		if (friendVO.getAttach_file_list() == null || friendVO.getAttach_file_list().size() <= 0) {
			Friend_fileVO attach_files = new Friend_fileVO();
			attach_files.setFfilename("img12.jpg");
			attach_files.setFrnd_no(friendVO.getFrnd_no());
			attach_files.setFuploadpath("original");
			attach_files.setFuuid("a");
			friend_file_mapper.insert_attach_file(attach_files);
			return friendVO.getFrnd_no();
		}
		System.out.println( "friendVO.getAttach_file_list(): " + friendVO.getAttach_file_list());
		
		friendVO.getAttach_file_list().forEach(attach_file -> {
			attach_file.setFrnd_no(friendVO.getFrnd_no());
			friend_file_mapper.insert_attach_file(attach_file);
		});
		
		return friendVO.getFrnd_no();
	}

	@Override
	public FriendVO get_frnd(Integer frnd_no) {
		FriendVO friendVO = friend_mapper.select_frnd(frnd_no);
		System.out.println(friendVO.getFrnd_delflag());
		return friendVO;
	}

	@Override
	@Transactional
	public boolean modify_frnd(FriendVO friendVO) {
		friend_mapper.update_frnd(friendVO);
		int frnd_no = friendVO.getFrnd_no();
		FriendVO frnd = friend_mapper.select_frnd(frnd_no);
		if(frnd.getFrnd_member_cnt() == frnd.getFrnd_now_mem()) {
			frnd.setFrnd_status(true);
		}else {
			frnd.setFrnd_status(false);
		}
		
		if (friendVO.getAttach_file_list() == null || friendVO.getAttach_file_list().size() <= 0) {
			Friend_fileVO attach_files = new Friend_fileVO();
			attach_files.setFfilename("img12.jpg");
			attach_files.setFrnd_no(frnd_no);
			attach_files.setFuploadpath("original");
			attach_files.setFuuid("a");
			friend_file_mapper.update_attach_file(attach_files);;
		}
		System.out.println( "friendVO.getAttach_file_list(): " + friendVO.getAttach_file_list());
		
		friendVO.getAttach_file_list().forEach(attach_file -> {
			attach_file.setFrnd_no(frnd_no);
			friend_file_mapper.update_attach_file(attach_file);
		});
		
		return friend_mapper.update_frnd_status(frnd);
	}

	@Override
	public boolean modify_frnd_delflag(Integer frnd_no, int frnd_delflag) {
		return friend_mapper.update_frnd_delflag(frnd_no, frnd_delflag);
	}
	
	@Override
	public boolean modify_frnd_status(FriendVO friendVO) {
		return friend_mapper.update_frnd_status(friendVO);
	}
	
	@Override
	public List<Friend_fileVO> get_frnd_file(int frnd_no){
		return friend_file_mapper.select_attach_files(frnd_no);
	}
}

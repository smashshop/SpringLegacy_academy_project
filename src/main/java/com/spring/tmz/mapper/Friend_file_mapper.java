package com.spring.tmz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.tmz.domain.Friend_fileVO;

public interface Friend_file_mapper {
	
	public void insert_attach_file(Friend_fileVO attach_file);
	
	public List<Friend_fileVO> select_attach_files(Integer frnd_no);
	
	public void update_attach_file(Friend_fileVO attach_file);
	

}

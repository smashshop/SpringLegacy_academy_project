package com.spring.tmz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.tmz.common.security.Member;
import com.spring.tmz.domain.UserinfoVO;
import com.spring.tmz.mapper.Userinfo_mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class Member_detail_service implements UserDetailsService {
	
	@Setter(onMethod_ = { @Autowired })
	private Userinfo_mapper userinfo_mapper;
	
	@Override
	public UserDetails loadUserByUsername(String user_name) throws UsernameNotFoundException {
		
		log.info("Load User By UserName: " + user_name);
		
		UserinfoVO userinfoVO = userinfo_mapper.select_userinfo(user_name);
		log.warn("userinfo_mapper에 의해 반환된 UserinfoVO" + userinfoVO);
		
		return userinfoVO == null ? null : new Member(userinfoVO);
	}

}

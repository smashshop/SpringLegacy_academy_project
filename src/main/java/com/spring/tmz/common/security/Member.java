package com.spring.tmz.common.security;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.tmz.domain.UserinfoVO;

import lombok.Getter;

@Getter
public class Member extends User {	

	private static final long serialVersionUID = 1L;
	
	private UserinfoVO userinfoVO;
	
	public Member(UserinfoVO userinfoVO) {

		super(userinfoVO.getUser_id(),
			  userinfoVO.getUser_pw(),
			  userinfoVO.getAuthority_list()
			  			.stream()
			  			.map(auth -> new SimpleGrantedAuthority(auth.getRole_name()))
			  			.collect(Collectors.toList())
			 );
		
		System.out.println("Member 생성자에 전달된 UserinfoVO 정보: " + userinfoVO.toString());
		
		this.userinfoVO = userinfoVO;
		
	}

}

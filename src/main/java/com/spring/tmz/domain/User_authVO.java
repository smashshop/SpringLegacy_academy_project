package com.spring.tmz.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User_authVO {

	private String user_id;
	private String role_name;
	
}

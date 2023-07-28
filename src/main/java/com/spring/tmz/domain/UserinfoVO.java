package com.spring.tmz.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserinfoVO {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	@DateTimeFormat(pattern = "YYYY-MM-dd")
	private Date user_birth;
	private Date user_regdate;
	private String user_tag;
	private double user_rate;
	private Boolean user_delflag;
	private Boolean enabled;
	
	
	private String role_name;
	private int user_report;
	
	
	//평점관리

	private String rating_id;
	private String rated_id;
	private String rate_num;
	private String party_comment; 
	private String frnd_title;
	private String frnd_country;
	private Date frnd_startdate;
	private Date frnd_enddate;
	
	
	private List<AuthorityVO> authority_list;
}

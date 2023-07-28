package com.spring.tmz.domain;

import lombok.Data;

@Data
public class Userinfo_rateVO {

	private String rating_id;
	private String rated_id;
	private float rate_num;
	private Integer frnd_no;
	private String party_comment;
}

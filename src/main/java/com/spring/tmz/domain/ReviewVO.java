package com.spring.tmz.domain;

import java.sql.Timestamp;
import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewVO {
	
	private int rv_no;
	private String rv_title;
	private String rv_content;
	private Timestamp rv_regdate;
	private Timestamp rv_moddate;
	private String rv_writer;
	private int rv_replcnt;
	private int rv_delflag;
	
	private String rv_continent;
	private String rv_country;
	
	private int rv_like_cnt;
	
	private List<Review_attach_fileVO> attach_review_file_list ; 


}

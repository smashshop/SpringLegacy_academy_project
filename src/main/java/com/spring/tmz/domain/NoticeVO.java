package com.spring.tmz.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {

	
	private long ntc_no;
	private String ntc_title;
	private String ntc_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ntc_regdate;	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp ntc_moddate;	
//	private Timestamp ntc_regdate;	
//	private Timestamp ntc_moddate;	
	private String ntc_writer;
	private int ntc_delflag;
	
	private int ntc_like_check;
	private int count; //좋아요가 눌린 상태인지 아닌지
	
	private List<Notice_fileVO> notice_file_list ; 
	//SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 	//7/8일추가
	
	private String ntc_country;
	private String ntc_continent;
	
	private int ntc_like_cnt;
	
}

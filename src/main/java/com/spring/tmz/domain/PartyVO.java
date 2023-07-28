package com.spring.tmz.domain;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PartyVO {
	
	private Integer frnd_no;	
	private String party_member;
	private Character party_writer_replier;
	
	private String frnd_writer;
	@DateTimeFormat(pattern = "YYYY-MM-dd")
	private Date frnd_startdate;
	@DateTimeFormat(pattern = "YYYY-MM-dd")
	private Date frnd_enddate;
	private String continent;
	private String frnd_country;
	private String frnd_city;
	
	private Float rate_num;
	private String rated_id;
	
	private Integer page_num;
}

package com.spring.tmz.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class FriendVO {
	
	private Integer frnd_no;
	private String frnd_title;
	private String frnd_writer;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date frnd_startdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date frnd_enddate;
	private String continent;
	private String frnd_country;
	private String frnd_city;
	private String frnd_content;
	private Timestamp frnd_regdate;
	private Timestamp frnd_moddate;
	private Integer frnd_member_cnt;
	private Boolean frnd_delflag;
	private Boolean frnd_status;
	private Integer frnd_now_mem;
	private String frnd_tag;
	private String frnd_continent;
	
	private List<Friend_fileVO> attach_file_list;
}

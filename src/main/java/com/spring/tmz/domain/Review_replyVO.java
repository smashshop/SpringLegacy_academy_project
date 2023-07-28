package com.spring.tmz.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Review_replyVO {
	
	 private long rv_no;
	 private String rrepl_content;
	 private String rrepl_writer;
	 private Timestamp rrepl_regdate;
	 private Timestamp rrepl_moddate;
	 private long rrepl_no; //댓글 번호
	 private long rrepl_pno; //답글 번호
	 
	 private int rrepl_lvl; //계층 쿼리의 레벨값 저장 필드


}

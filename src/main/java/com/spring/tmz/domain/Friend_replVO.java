package com.spring.tmz.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Friend_replVO {
	
	private	int frnd_no;
	private String frepl_content;
	private String frepl_writer;
	private Timestamp frepl_regdate;
	private Timestamp frepl_moddate;
	private int frepl_no;
	private Boolean frepl_confirm;
	
	private boolean frnd_status;
	
}

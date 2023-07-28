package com.spring.tmz.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Confirm_partyVO {
	
	private int frnd_no;
	private String party_member;
	private boolean party_writer_replier;
	
}

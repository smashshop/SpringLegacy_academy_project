package com.spring.tmz.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class Review_reply_pagingDTO {

	private long rv_no;
	private Integer review_reply_page_num;
	private int review_reply_row_amount_per_page;
	public Review_reply_pagingDTO(long rv_no, Integer review_reply_page_num) {
		this.rv_no = rv_no;
		if(review_reply_page_num == null) {
			this.review_reply_page_num = 1;
		}else {
			this.review_reply_page_num = review_reply_page_num;
		}
		this.review_reply_row_amount_per_page=10;
	}
	
	
}

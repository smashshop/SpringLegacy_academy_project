package com.spring.tmz.domain;

import java.util.List;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Review_reply_paging_creatorDTO {
	private Review_reply_pagingDTO review_reply_pagingDTO; // 페이지번호와 행 개수 저장 객체
	private int reply_start_paging_num; // 화면에 표시되는 시작 페이징 번호
	private int reply_end_paging_num; // 화면에 표시되는 끝 페이징 번호
	private boolean reply_prev; // 이전 버튼 표시 여부 결정 변수(true: 표시됨, false: 표시 안됨)
	private boolean reply_next; // 다음 버튼 표시 여부 결정 변수(true: 표시됨, false: 표시 안됨)
	private long reply_total_by_rv_no;// 전체 행 개수
	private int reply_paging_num_cnt; // 화면 하단에 표시할 기본 페이지 번호 개수(10)
	private int reply_last_page_num; // 마지막 페이지 번호

	private List<Review_replyVO> reply_list;
	
	public Review_reply_paging_creatorDTO(long reply_total_by_rv_no,Review_reply_pagingDTO review_reply_pagingDTO,
			List<Review_replyVO> reply_list) {
		this.review_reply_pagingDTO = review_reply_pagingDTO;
		this.reply_total_by_rv_no = reply_total_by_rv_no;
		this.reply_list = reply_list;
		
		this.reply_paging_num_cnt = 10;

		// 계산된 끝-시작 페이징 번호:
		this.reply_end_paging_num = (int) (Math.ceil(review_reply_pagingDTO.getReview_reply_page_num()/ (this.reply_paging_num_cnt * 1.0)))
				* this.reply_paging_num_cnt;
		this.reply_start_paging_num = this.reply_end_paging_num - (this.reply_paging_num_cnt - 1);

		// 행 총수를 기준으로 한 실제 마지막 페이지 번호
		this.reply_last_page_num = (int) (Math.ceil((reply_total_by_rv_no * 1.0) / review_reply_pagingDTO.getReview_reply_row_amount_per_page()));

		// 계산된 끝 페이징 번호가 실제 마지막 페이지 번호보다 크면, endPagingNum 값을 lastPageNum 으로 대체
		if (reply_last_page_num < this.reply_end_paging_num) {
			this.reply_end_paging_num = reply_last_page_num;
		}

		this.reply_prev = this.reply_start_paging_num > 1;
		this.reply_next = this.reply_end_paging_num < reply_last_page_num;

		System.out.println("댓글-전달된 페이징 기본데이터-review_reply_pagingDTO: " + review_reply_pagingDTO.toString());
		System.out.println("댓글-끝 페이징번호: " + this.reply_end_paging_num);
		System.out.println("댓글-시작 페이징번호: " + this.reply_start_paging_num);
		System.out.println("댓글-이전버튼 표시 여부: " + this.reply_prev);
		System.out.println("댓글-다음버튼 표시 여부: " + this.reply_next);
		System.out.println("전달된 댓글 목록 데이터: " + this.reply_list);
		
	}
	
}

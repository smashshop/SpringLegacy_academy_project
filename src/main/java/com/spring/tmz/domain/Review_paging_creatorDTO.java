package com.spring.tmz.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Review_paging_creatorDTO {
	private Review_pagingDTO my_review_pagingDTO; // 페이지번호와 행 개수 저장 객체
	private int start_paging_num; // 화면에 표시되는 시작 페이징 번호
	private int end_paging_num; // 화면에 표시되는 끝 페이징 번호
	private boolean prev; // 이전 버튼 표시 여부 결정 변수(true: 표시됨, false: 표시 안됨)
	private boolean next; // 다음 버튼 표시 여부 결정 변수(true: 표시됨, false: 표시 안됨)
	private long row_amount_total; // 전체 행 개수
	private int paging_num_cnt; // 화면 하단에 표시할 기본 페이지 번호 개수(10)
	private int last_page_num; // 행 총수를 기준으로 한 실제 마지막 페이지 번호

	public Review_paging_creatorDTO(long row_amount_total, Review_pagingDTO my_review_pagingDTO) {
		this.my_review_pagingDTO = my_review_pagingDTO;
		this.row_amount_total = row_amount_total;
		this.paging_num_cnt = 10;

		// 계산된 끝-시작 페이징 번호:
		this.end_paging_num = (int) (Math.ceil(my_review_pagingDTO.getReview_page_num() / (this.paging_num_cnt * 1.0)))
				* this.paging_num_cnt;
		this.start_paging_num = this.end_paging_num - (this.paging_num_cnt - 1);

		// 행 총수를 기준으로 한 실제 마지막 페이지 번호 저장
		this.last_page_num = (int) (Math.ceil((row_amount_total * 1.0) / my_review_pagingDTO.getReview_page_row_amount_per_page()));

		// 계산된 끝 페이징 번호가 실제 마지막 페이지 번호보다 크면, endPagingNum 값을 lastPageNum 값으로 대체
		if (last_page_num < this.end_paging_num) {
			this.end_paging_num = last_page_num;
		}

		this.prev = this.start_paging_num > 1;
		this.next = this.end_paging_num < last_page_num;

		System.out.println("전달된 페이징 기본데이터-my_review_pagingDTO: " + my_review_pagingDTO.toString());
		System.out.println("끝 페이징번호: " + this.end_paging_num);
		System.out.println("시작 페이징번호: " + this.start_paging_num);
		System.out.println("이전버튼 표시 여부: " + this.prev);
		System.out.println("다음버튼 표시 여부: " + this.next);
		System.out.println("마지막 페이지 번호: " + this.last_page_num);
	}
}


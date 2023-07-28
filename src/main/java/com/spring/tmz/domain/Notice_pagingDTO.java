package com.spring.tmz.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class Notice_pagingDTO {

	private int notice_page_num; // 현재 공지사항 페이지 번호
	private int notice_amount_per_page; // 페이지당 출력할 레코드 개수
	private String notice_scope;
	private String notice_keyword;

	// 검색범위 값 처리를 위한 메소드: 화면에서 선택된 TCW 값을 ["T", "C", "W"] 배열로 반환
	// 이 메서드는 Mybatis 엔진에 의해서 자동으로 호출되어 사용됨(SQL 매퍼 파일의 SELECT문에서 설명함)
	public String[] getScopeArray() {
		return notice_scope == null ? new String[] {} : notice_scope.split("");
	}

	// 생성자를 통해 표시할 페이지번호와 페이지당 출력할 레코드 개수를 컨트롤러로 전달
	// 생성자1: list.jsp가 처음 호출 시에, 페이지번호와 행수를 각각 1과 10으로 전달
	public Notice_pagingDTO() {
		this.notice_page_num = 1;
		this.notice_amount_per_page = 10;
	}

	// 생성자2: 목록 화면에서 페이징번호 클릭 시, 페이지번호와 행수를 각각 사용자가 선택한 페이징번호와 10으로 전달
	public Notice_pagingDTO(int notice_page_num) {
		if (notice_page_num <= 0) {
			this.notice_page_num = 1;
		} else {
			this.notice_page_num = notice_page_num;
		}
		this.notice_amount_per_page = 10;
	}

	// 생성자3: 목록 화면에서 사용자가 표시할 행수를 선택하고 페이징 번호 클릭 시,
	// 페이지번호와 행수를 각각 사용자가 선택한 페이징번호와 표시행수로 전달
	public Notice_pagingDTO(int notice_page_num, int notice_amount_per_page) {
		if (notice_page_num <= 0) {
			this.notice_page_num = 1;
		} else {
			this.notice_page_num = notice_page_num;
		}

		if (notice_amount_per_page <= 0) {
			this.notice_amount_per_page = 10;
		} else {
			this.notice_amount_per_page = notice_amount_per_page;
		}
	}
}
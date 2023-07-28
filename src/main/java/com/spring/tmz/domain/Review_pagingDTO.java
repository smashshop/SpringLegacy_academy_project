package com.spring.tmz.domain;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@ToString
@EqualsAndHashCode
public class Review_pagingDTO{
 private int review_page_num; //현재 페이지 번호
 private int review_page_row_amount_per_page; //페이지당 출력할 레코드 개수
 private String review_scope;
 private String review_keyword;
 
//검색범위 값 처리를 위한 메소드: 화면에서 선택된 TCW 값을 ["T", "C", "W"] 배열로 반환
//이 메서드는 Mybatis 엔진에 의해서 자동으로 호출되어 사용됨(SQL 매퍼 파일의 SELECT문에서 설명함)
 public String[] getScopeArray() {
	 return review_scope == null? new String[] {} : review_scope.split("");
 }
 //생성자를 통해 표시할 페이지번호와 페이지당 출력할 레코드 개수를 컨트롤러로 전달
 //생성자1: list.jsp가 처음 호출 시에, 페이지번호와 행수를 각각 1과 10으로 전달
 public Review_pagingDTO() {
	 this.review_page_num = 1 ;
	 this.review_page_row_amount_per_page = 10 ;
 }
 //생성자2: 목록 화면에서 페이징번호 클릭 시, 페이지번호와 행수를 각각 사용자가 선택한 페이징번호와 10으로 전달
 public Review_pagingDTO(int page_num) {
 if(review_page_num <= 0) {
 this.review_page_num = 1 ;
 } else {
 this.review_page_num = page_num;
 }
 this.review_page_row_amount_per_page = 10 ;
 }
 //생성자3: 목록 화면에서 사용자가 표시할 행수를 선택하고 페이징 번호 클릭 시,
 //페이지번호와 행수를 각각 사용자가 선택한 페이징번호와 표시행수로 전달
 public Review_pagingDTO(int page_num, int row_amount_per_page) {
 if(page_num <= 0) {
 this.review_page_num = 1 ;
 } else {
 this.review_page_num = page_num;
 }
 
 if(row_amount_per_page <= 0) {
 this.review_page_row_amount_per_page = 10 ;
 } else {
 this.review_page_row_amount_per_page = row_amount_per_page;
 }
 }
}

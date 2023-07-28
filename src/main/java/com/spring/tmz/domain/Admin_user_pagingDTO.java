package com.spring.tmz.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class Admin_user_pagingDTO {
	
	private int pageNum;
	private int rowCntPerPage;//dto로 extend해도됨. dto를 따로만들어도됨.
	private String scope;
	private String keyword;
	
	private String userDelflag;
	private String enabled;
	private String user_id;
	private String frnd_startdate;
	private String frnd_enddate;
	private String searchFlag;
	
	//검색범위 값 처리를 위한 메소드: 화면에서 선택된 TCW 값을 ["T", "C", "W"] 배열로 반환
	//이 메서드는 Mybatis 엔진에 의해서 자동으로 호출되어 사용됨(SQL 매퍼 파일의 SELECT문에서 설명함)
	public String[] getScopeArray() {
		return scope == null ? new String[] {} : scope.split("");
	}
	
	public Admin_user_pagingDTO() {
		this.pageNum = 1;
		this.rowCntPerPage = 10;
	}
		
	public Admin_user_pagingDTO(int pageNum) {
		if (pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;    //필드 초기화
		}
		
		this.rowCntPerPage = 10;     //페이지 당 행 갯수
	}
	
	public Admin_user_pagingDTO(int pageNum, int rowCntPerPage) {
		if (pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
		
		if (rowCntPerPage <= 0) {
			this.rowCntPerPage = 10;
		} else {
			this.rowCntPerPage = rowCntPerPage;		//필드 초기화
		}
	}
	
	   public String addPagingParamsToURI() {
		      UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromPath("")
		                                               .queryParam("pageNum", this.pageNum)
		                                                .queryParam("rowCntPerPage", this.rowCntPerPage)
		                                               .queryParam("scope", this.scope)
		                                               .queryParam("keyword", this.keyword);
		      
		      String uriString = uriBuilder.toUriString();
		      System.out.println("생성된 uri : " + uriString);
		      return uriString;
			
			
			
		}
	
	
	
	
	
	
	
} // Class-End

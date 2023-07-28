package com.spring.tmz.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class  Admin_user_paging_creatorDTO {

	private Admin_user_pagingDTO user_pagingDTO; //페이지번호와 행 개수 저장 객체
	private int startPagingNum; //화면에 표시되는 시작 페이징 번수
	private int endPagingNum; //화면에 표시되는 끝 페이징 변수
	private boolean prev; //이전 버튼 표시 여부 결정 변수(true:표시됨, false:표시안됨)
	private boolean next; //다음 버튼 표시 여부 결정 변수(true:표시됨, false:표시안됨)
	private long boardTotCnt; //전체 행 개수, 전체 게시물 총수
	private int pagingNumCnt; // (기본 10개 )화면 하단에 표시할 기본 페이지 번호 개수(10)
	private int lastPageNum; //행 총수를 기준으로 한 실제 마지막 페이지 번호
	
	public Admin_user_paging_creatorDTO(long boardTotCnt, Admin_user_pagingDTO user_pagingDTO) {  //게시물 총 갯수
		this.user_pagingDTO = user_pagingDTO;
		this.boardTotCnt= boardTotCnt;
		this.pagingNumCnt=10;
	
	//끝 페이징번호 (int) ( Math.ceil( 선택된 페이지 번호 / ( (double) 페이징번호 개수 ) ) ) * 페이징 번호 개수
	//시작 페이징번호   끝 페이징 번호 – ( 페이징번호 개수 – 1 )
	//실제 마지막 페이징 번호 (int) ( Math.ceil( 전체 게시물 총수 / ( (double) 페이지당 표시되는 행수 ) ) )
	
	//계산된-시작 페이징 번호:
	this.endPagingNum= (int) (Math.ceil(user_pagingDTO.getPageNum()/(this.pagingNumCnt*1.0)))*this.pagingNumCnt;
	this.startPagingNum=this.endPagingNum-(this.pagingNumCnt-1);
	
	//계산된 - 끝 페이징 번호가 실제 마지막 페이지 번호 (총 페이지 저장)보다 크면, endPagingNum 값을 lastPageNum값으로 대체
	this.lastPageNum=(int) (Math.ceil( (this.boardTotCnt*1.0) / this.user_pagingDTO.getRowCntPerPage() ) );
	
	//계산된 - 끝 페이징 번호가 실제 마지막 페이지 번호 보다 크면, endPagingNum 값을 lastPageNum값으로 대체
	if (lastPageNum < this.endPagingNum) {
		this.endPagingNum=this.lastPageNum;
	}
	
	this.prev = this.startPagingNum > 1;	//1보다 크면 무조건 표시
	this.next = this.endPagingNum < lastPageNum ;
	
	System.out.println("전달된 페이징 기본데이터 -myPagingDTO"+ user_pagingDTO.toString());
	System.out.println("끝 페이징 번호"+this.endPagingNum);
	System.out.println("시작 페이징 번호"+this.startPagingNum);
	System.out.println("이전버튼 표시 여부"+this.prev);
	System.out.println("다음버튼 표시 여부"+this.next);
	System.out.println("마지막 페이지 여부"+this.lastPageNum);
	
	
	}
}

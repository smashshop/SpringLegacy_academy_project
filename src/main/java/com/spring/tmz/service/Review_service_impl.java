package com.spring.tmz.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.tmz.domain.ReviewVO;
import com.spring.tmz.domain.Review_attach_fileVO;
import com.spring.tmz.domain.Review_likeVO;
import com.spring.tmz.domain.Review_pagingDTO;
import com.spring.tmz.domain.Review_regionVO;
import com.spring.tmz.mapper.Review_attach_file_mapper;
import com.spring.tmz.mapper.Review_mapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class Review_service_impl implements Review_service {
	
	private Review_mapper review_mapper; 
	
	private Review_attach_file_mapper review_attach_file_mapper;
	
	@Override
	public List<ReviewVO> get_review_board_list_main(){
	 return review_mapper.select_review_list_main();
	}
	
	//1. 게시물 등록
	@Transactional
	@Override
	public long register_review_board(ReviewVO my_review) {
		log.info("review_mapper.register_review_board()에 전달된 my_review: " + my_review);
	      
		int rv_no = review_mapper.insert_review_board(my_review);
	      System.out.println("Review_service에서 등록된 게시물의 rv.no: " + rv_no);
	      
	      //첨부파일이 없는 경우, 메서드 종료
	       //추가
	       if (my_review.getAttach_review_file_list()== null || my_review.getAttach_review_file_list().size() <= 0) {
	             return my_review.getRv_no();
	       }
	       
	       //첨부파일이 있는 경우, myBoard의 bno 값을 첨부파일 정보 VO에 저장 후, tbl_myAttachFiles 테이블에 입력
	       //추가
	       my_review.getAttach_review_file_list().forEach(attach_file -> {
	    	   attach_file.setRv_no(my_review.getRv_no());
	    	   System.out.println(attach_file);
	    	   review_attach_file_mapper.insert_review_attach_file(attach_file);
	       });
	       
	      return my_review.getRv_no();
	}
	@Override
	//2. 특정 게시물 조회
	//게시물 조회: 게시물 목록 페이지 -> 게시물 조회 페이지 호출(by bno), 조회수 1 증가 없음
		public ReviewVO get_board_detail_modify(Long rv_no) {
			
			return review_mapper.search_review_board(rv_no);
		}
	//3. 특정 게시물 삭제 요청
		@Override
		public boolean set_review_board_deleted(long rv_no){
			return 	review_mapper.update_review_delflag(rv_no)==1;
		}
	//4.직접 삭제 서비스
		@Override
		@Transactional
		public boolean remove_review_board(long rv_no){
			log.info("Review_service.remove_review_board()에 전달된 rv_no: " + rv_no);
			 //데이터베이스 첨부파일 정보 삭제
			 //첨부파일이 없어도 SQL은 정상처리됨(0개 행이 삭제)
			 //테이블의 외래키(FK)에 ON DELETE CASCADE 옵션이 사용된 경우,
			 //첨부파일 정보 삭제는 데이터베이스에 의해 자동으로 처리되므로
			 //아래의 실행문은 필요없습니다.
			 //게시물정보 삭제가 정상처리되면, true 반환
			review_attach_file_mapper.delete_review_attach_files_by_rv_no(rv_no);
			 return review_mapper.delete_review_board(rv_no) == 1;
		}
		
		//5.특정 게시물 수정 서비스
		   @Override
		   @Transactional 
		   public boolean modify_review_board(ReviewVO my_review) {
		      log.info("Review_service.modify_review_board()에 전달된 ReviewVO: " + my_review);
		          long rv_no = my_review.getRv_no();
		          
		          //게시물 변경 시, 기존 첨부파일이 삭제와 새로운 첨부파일 추가를 모두 고려하여, 기존 DB의 정보를 모두 삭제 후,
		          //첨부파일 정보를 DB에 다시 추가하는 방식으로 처리합니다.
		          //기존 DB 첨부파일 정보 삭제
		          //myBoardAttachFileMapper.deleteAttachFilesByBno(bno);
		          //게시물 수정: tbl_myboard 테이블에 수정
		          review_attach_file_mapper.delete_review_attach_files_by_rv_no(rv_no);
		          boolean board_review_modify_result = review_mapper.update_review_board(my_review) == 1 ;
	        
//			          게시물 수정이 성공하고, 첨부파일이 있는 경우에만 다음작업 수행
//			          첨부파일 정보 저장: tbl_myAttachFiles 테이블에 저장
		          if (board_review_modify_result && my_review.getAttach_review_file_list() != null) {
		        	  my_review.getAttach_review_file_list().forEach(
		        			  attachFile -> {
		        				  attachFile.setRv_no(rv_no);
		        				  review_attach_file_mapper.insert_review_attach_file(attachFile);
		        			  }
		        			  );
		       }
		      return board_review_modify_result;
		   }
	   //6.게시물 전체 삭제
			@Override
			public int remove_all_review_deleted_board() {
				return review_mapper.delete_all_review_board_set_deleted() ;
			}
			
		//7.게시물 목록 조회 서비스1-페이징 고려
			@Override
			public List<ReviewVO> get_review_board_list(Review_pagingDTO review_pagingDTO){
				log.info("MyBoardService.getBoardList() 실행");
			 return review_mapper.select_review_list(review_pagingDTO);
			}
			
			//8. 게시물 총 개수 조회 서비스 - 페이징 시 필요
			@Override
			public long get_review_row_amount_total(Review_pagingDTO review_pagingDTO) {
			 log.info("Review_service.get_review_row_amount_total()에 전달된 Review_pagingDTO: " + review_pagingDTO);
			 return review_mapper.select_review_row_amount_total(review_pagingDTO);
			}
			//9. 게시물의 첨부파일 조회
			@Override
			public List<Review_attach_fileVO> get_review_attach_files_by_rv_no(long rv_no) {
				 log.info("Review_service.get_review_attach_files_by_bno()에 전달된 rv_no:" + rv_no);
				 return review_attach_file_mapper.select_review_attach_files_by_rv_no(rv_no);
			}
			//10. 특정 게시물의 첨부파일 삭제
			@Override
			public int delete_review_attach_file(String ruuid) {	 
				return review_attach_file_mapper.delete_review_attach_file(ruuid);
			}
			
			//11. 나라이름 가져오기
			@Override
			public List<Review_regionVO> select_review_country(String continent_name){
				return review_mapper.select_review_country(continent_name);
			}
			//12.대륙이름 가져오기
			@Override
			public List<Review_regionVO> select_review_continent(){
				return review_mapper.select_review_continent();
			}
			//13. 좋아요 하트 눌렀을 때
			//좋아요 하트 눌렀을 때
			@Transactional
			@Override
			 public Integer insert_review_like(Review_likeVO review_likeVO) {
				review_mapper.insert_review_like(review_likeVO);
				return review_likeVO.getRv_like_no(); 
			 }
			
			//14. 좋아요 하트 취소했을 때
			@Override
			public Integer disable_rv_like_check(Review_likeVO review_likeVO) {
				
				return review_mapper.disable_rv_like_check(review_likeVO);
			}
			//15. 특정 게시물의 좋아요 총 개수 구하기
			@Override
			public int review_like_total(Review_likeVO review_likeVO) {
				int result = review_mapper.review_like_total(review_likeVO);
				return result;
			}
			//16. 특정 게시물 의 좋아요 갯수 없데이트 //오류가 생길 수 있음
			@Override
		    public int update_rv_like_check(Review_likeVO review_likeVO) {
		    	int rv_like_cnt = review_mapper.review_like_total(review_likeVO);
		    	int update_result=review_mapper.update_rv_like_check(rv_like_cnt,review_likeVO.getRv_no());
		    	return update_result;
		    }
		    //17. 좋아요 누른 멤버 구하기
			@Override
		    public List<Review_likeVO> select_review_like_member(Review_likeVO review_likeVO){
		    	return review_mapper.select_review_like_member(review_likeVO);
		    }
}

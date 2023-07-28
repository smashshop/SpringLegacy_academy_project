package com.spring.tmz.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.tmz.domain.Review_likeVO;
import com.spring.tmz.domain.Review_replyVO;
import com.spring.tmz.domain.Review_reply_pagingDTO;
import com.spring.tmz.domain.Review_reply_paging_creatorDTO;
import com.spring.tmz.mapper.Review_mapper;
import com.spring.tmz.mapper.Review_reply_mapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class Review_reply_service_impl implements Review_reply_service {
	
	private Review_mapper review_mapper;
	private Review_reply_mapper review_reply_mapper;
	
	public Review_reply_service_impl(Review_mapper review_mapper, Review_reply_mapper review_reply_mapper) {
		this.review_mapper = review_mapper;
		this.review_reply_mapper = review_reply_mapper;
	}
	
	//1. 특정 게시물에 대한 댓글 목록 조회(페이징-전체댓글 수 고려) 
		@Override
		public Review_reply_paging_creatorDTO get_reply_list_by_rv_no(Review_reply_pagingDTO review_reply_pagingDTO) {
			log.info("댓글-서비스-게시물에 대한 댓글 목록 조회 - 전달된 Review_reply_pagingDTO: " + review_reply_pagingDTO);
			int reply_total_by_rv_no = review_reply_mapper.select_reply_total_by_rv_no(review_reply_pagingDTO);

			int page_num = review_reply_pagingDTO.getReview_reply_page_num();
			Review_reply_paging_creatorDTO review_reply_paging_creator = null;
			if (reply_total_by_rv_no == 0) {
				review_reply_pagingDTO.setReview_reply_page_num(1);
				log.info("댓글-서비스- 댓글이 없는 경우, reply_page_num은 1: 수정된 review_reply_pagingDTO: " + review_reply_pagingDTO);
				
				review_reply_paging_creator = new Review_reply_paging_creatorDTO(reply_total_by_rv_no,review_reply_pagingDTO,null);
			} else {
				if (page_num == -1) {
					page_num = (int) Math.ceil(reply_total_by_rv_no / (review_reply_pagingDTO.getReview_reply_row_amount_per_page()* 1.0));
					review_reply_pagingDTO.setReview_reply_page_num(page_num);
					log.info("댓글-서비스-댓글추가 후, 마지막 댓글 페이지로 이동(myReplyPaging): " + review_reply_pagingDTO);
				}

				review_reply_paging_creator = new Review_reply_paging_creatorDTO(reply_total_by_rv_no, review_reply_pagingDTO,
						review_reply_mapper.select_review_reply_list(review_reply_pagingDTO));
				log.info("댓글-서비스-게시물에 대한 댓글 목록 조회 - 생성된 myReplyPagingCreatorDTO: " + review_reply_paging_creator);
				log.info("댓글-서비스-게시물에 대한 댓글 목록 조회 - myReplyPagingCreator가 컨트롤러로 전달됨");
			}
			return review_reply_paging_creator;
		}
		//2. 특정 게시물의 댓글 총 개수확인
		@Override
		public long get_reply_total_by_rv_no(Review_reply_pagingDTO review_reply_paging) {
			return review_reply_mapper.select_reply_total_by_rv_no(review_reply_paging);
		}
		
		//3. 특정 게시물에 대한 댓글 등록: rrepl_no 반환
		@Transactional
		@Override
		public long register_reply_for_review_board(Review_replyVO review_replyVO) {
			log.info("댓글-서비스-게시물에 대한 댓글 등록 시 처음 전달된 review_replyVO: " + review_replyVO);
			//게시물 댓글 수 증가
			 review_mapper.update_rv_reply_cnt(review_replyVO.getRv_no(), 1);
			 // 게시물에 대한 댓글 등록 처리
			review_reply_mapper.insert_review_reply_for_board(review_replyVO);
			log.info("댓글-서비스 - 게시물에 대한 댓글 등록: 등록된 review_replyVO: " + review_replyVO);
			log.info("댓글-서비스 - 게시물에 대한 댓글 등록: 등록된 Rrepl_no(byGetter): " + review_replyVO.getRrepl_no());
			log.info("댓글-서비스 - 게시물에 대한 댓글 등록: 등록된 getRrepl_no가 컨트롤러로 전달됨 ");

			return review_replyVO.getRrepl_no();
		}
		// 4. 댓글의 답글 등록: rrepl_no 반환
		@Transactional 
		@Override
		public long register_reply_for_reply(Review_replyVO review_replyVO) {
			log.info("댓글-서비스-게시물에 대한 댓글 등록 시 review_replyVO: " + review_replyVO);
			
			//게시물 댓글 수 증가
			review_mapper.update_rv_reply_cnt(review_replyVO.getRv_no(), 1);
			
			// 댓글에 대한 답글 등록 DB 저장
			review_reply_mapper.insert_review_reply_for_reply(review_replyVO);

			log.info("댓글-서비스 - 댓글에 대한 답글 등록: 등록된 review_replyVO: " + review_replyVO);
			log.info("댓글-서비스 - 댓글에 대한 답글 등록: 등록된 getRrepl_no(ByGetter): " + review_replyVO.getRrepl_no());
			log.info("댓글-서비스 - 댓글에 대한 답글 등록: 등록된 getRrepl_no가 컨트롤러로 전달됨 ");

			return review_replyVO.getRrepl_no();
		}
		//5. 특정 댓글 조회
		@Override
		public Review_replyVO get_reply(long rv_no, long rrepl_no) {
			log.info("댓글-서비스-댓글-조회 시 전달된 rv_no: " + rv_no);
			log.info("댓글-서비스-댓글-조회 시 전달된 rrepl_no: " + rrepl_no);

			Review_replyVO return_reply = review_reply_mapper.selectMyReply(rv_no, rrepl_no);
			log.info("댓글-서비스-댓글-조회: 매퍼로부터 전달된 return_reply: " + return_reply);
			log.info("댓글-서비스-댓글-조회: return_reply가 컨트롤러로 전달됨");

			return return_reply;
		}
		//6. 특정 댓글 수정: 수정된 행수인 1 반환
		@Override
		public int modify_reply(Review_replyVO review_replyVO) {
			log.info("댓글-서비스-댓글-수정시 전달된 myReplyVO: " + review_replyVO);

			Integer mod_cnt = review_reply_mapper.update_review_reply(review_replyVO);
			log.info("댓글-서비스-수정된 댓글 개수: " + mod_cnt);

			return mod_cnt;
		}
		//7. 특정 댓글 삭제: 삭제된 행수인 1 반환
		@Transactional
		@Override
		public int remove_reply(long rv_no, long rrepl_no) {
			log.info("댓글-서비스-댓글-삭제시 전달된 rv_no: " + rv_no);
			log.info("댓글-서비스-댓글-삭제시 전달된 rrepl_no: " + rrepl_no);
			
			//댓글 삭제: 댓글 개수 감소
			review_mapper.update_rv_reply_cnt(rv_no, -1);
			Integer del_cnt = review_reply_mapper.delete_review_reply(rv_no, rrepl_no);
			log.info("댓글-서비스-삭제된 댓글 개수: " + del_cnt);

			return del_cnt;
		}
		
		
		
}

package com.spring.tmz.controller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.tmz.domain.Review_replyVO;
import com.spring.tmz.domain.Review_reply_pagingDTO;
import com.spring.tmz.domain.Review_reply_paging_creatorDTO;
import com.spring.tmz.mapper.Review_mapper;
import com.spring.tmz.service.Review_reply_service;

import lombok.extern.log4j.Log4j;

@RequestMapping(value = { "/review-replies" })
@RestController
@Log4j
public class Review_reply_controller {
	
	private Review_reply_service review_reply_service;


	public Review_reply_controller(Review_reply_service review_reply_service) {

		this.review_reply_service = review_reply_service;
	}
	//1. 게시물에 대한 댓글 목록 조회(페이징 - 전체댓글 수 고려)
	@GetMapping(value = "/review-pages/{rv_no}/{page}",
			produces = { "application/json; charset=UTF-8", "application/xml; charset=UTF-8" })
	public ResponseEntity<Review_reply_paging_creatorDTO> show_reply_list(@PathVariable("rv_no") Long rv_no,
			@PathVariable("page") Integer review_reply_page_num) {
		log.info("댓글-컨트롤러 - 댓글목록 표시-URI 추출 review_reply_page_num: " + review_reply_page_num);
		log.info("댓글-컨트롤러 - 댓글목록 표시-URI 추출 rv_no: " + rv_no);

		Review_reply_pagingDTO my_reply_paging = new Review_reply_pagingDTO(rv_no, review_reply_page_num);
		log.info("댓글-컨트롤러 - 댓글목록 표시 - 생성된 MyReplyPagingDTO: " + my_reply_paging);

		Review_reply_paging_creatorDTO reply_paging_creator = review_reply_service.get_reply_list_by_rv_no(my_reply_paging);

		ResponseEntity<Review_reply_paging_creatorDTO> response_entity = new ResponseEntity<>(reply_paging_creator,
				HttpStatus.OK);

		log.info("댓글-컨트롤러 - 댓글목록 표시 - 브라우저로 전달되는 ResponseEntity<>: " + response_entity);

		return response_entity;
	}
	
	//2. 게시물에 대한 댓글 등록
		@PreAuthorize("isAuthenticated()")
		@PostMapping(value = "/{rv_no}/new", consumes = { "application/json; charset=UTF-8" }, // 웹브라우저로부터 메소드가 전달받는 MIME 유형을																					// 지정
				produces = { "text/plain; charset=UTF-8" }) // { MediaType.TEXT_PLAIN_VALUE }
		public ResponseEntity<String> register_reply_for_board(@PathVariable("rv_no") Long rv_no, @RequestBody Review_replyVO review_reply) {
			log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-URI 추출 rv_no: " + rv_no);
			log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-review_reply.getRv_no: " + review_reply.getRv_no());
			log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-서비스로 전달되는 review_reply: " + review_reply);
			Long registerd_getRrepl_no = review_reply_service.register_reply_for_review_board(review_reply);
			log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-반환된 Rrepl_no(registerd_getRrepl_no): " + registerd_getRrepl_no);
			log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-review_reply.getRrepl_no: " + review_reply.getRrepl_no());
			return registerd_getRrepl_no != null ? new ResponseEntity<>("게시물의 댓글 등록 성공", HttpStatus.OK)
					: new ResponseEntity<>("게시물의 댓글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	//3.게시물에 대한 댓글의 답글 등록:
		@PreAuthorize("isAuthenticated()") 
		@PostMapping(value = "/{rv_no}/{rrepl_pno}/new", consumes = { "application/json; charset=UTF-8" }, produces = {
				"text/plain; charset=UTF-8" })
		public ResponseEntity<String> register_reply_for_reply(@PathVariable("rv_no") Long rv_no, @PathVariable("rrepl_pno") Long rrepl_pno,
				@RequestBody Review_replyVO my_reply) {
			log.info("댓글-컨트롤러 - 댓글에 대한 답글 등록-URI 추출 rv_no: " + rv_no);
			log.info("댓글-컨트롤러 - 댓글에 대한 답글 등록-my_reply.getRv_no(): " + my_reply.getRv_no());
			log.info("댓글-컨트롤러 - 댓글에 대한 답글 등록-URI 추출 rrepl_pno: " + rrepl_pno);
			log.info("댓글-컨트롤러 - 댓글에 대한 답글 등록-myReply.getRrno: " + my_reply.getRrepl_no());
			log.info("댓글-컨트롤러 - 댓글에 대한 답글 등록-전달된 my_reply: " + my_reply);
			Long registerd_rrepl_no = review_reply_service.register_reply_for_reply(my_reply);
			log.info("댓글-컨트롤러 - 댓글에 대한 답글 등록-반환된 rrepl_no(registerd_rrepl_no): " + registerd_rrepl_no);
			log.info("댓글-컨트롤러 - 댓글에 대한 답글 등록-my_reply.getRrepl_no: " + my_reply.getRrepl_no());
			return registerd_rrepl_no != null ? new ResponseEntity<>("댓글에 대한 답글 등록 성공", HttpStatus.OK)
					: new ResponseEntity<>("댓글에 대한 답글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		//4.게시물에 대한 특정 댓글/답글 조회
		@GetMapping(value = "/{rv_no}/{rrepl_no}", produces = { "application/json; charset=UTF-8",
				"application/xml; charset=UTF-8" })
		public ResponseEntity<Review_replyVO> show_reply(@PathVariable("rv_no") Long rv_no, @PathVariable("rrepl_no") Long rrepl_no) {
			log.info("댓글-컨트롤러 - 댓글 조회- URI 추출 rv_no: " + rv_no);
			log.info("댓글-컨트롤러 - 댓글 조회- URI 추출 rrepl_no: " + rrepl_no);

			Review_replyVO my_reply = review_reply_service.get_reply(rv_no, rrepl_no);
			log.info("댓글-컨트롤러 댓글 조회 - 브라우저로 전달되는 Review_replyVO: " + my_reply);

			return new ResponseEntity<>(my_reply, HttpStatus.OK);
		}
		//5. 게시물에 대한 특정 댓글/답글 수정
//		@PreAuthorize("isAuthenticated() && principal.username == #myReply.rwriter")
		@RequestMapping(value = "/{rv_no}/{rrepl_no}", method = { RequestMethod.PUT,
				RequestMethod.PATCH }, consumes = "application/json; charset=UTF-8", produces = "text/plain; charset=UTF-8")
		public ResponseEntity<String> modify_reply(@PathVariable("rv_no") Long rv_no, @PathVariable("rrepl_no") Long rrepl_no,
				@RequestBody Review_replyVO review_replyVO) {
			log.info("댓글-컨트롤러 - 댓글 조회-URI 추출 rv_no: " + rv_no);
			log.info("댓글-컨트롤러 - 댓글 조회-URI 추출 rrepl_no: " + rrepl_no);
			log.info("댓글-컨트롤러 - 게시물에 대한 댓글 수정-전달된 Review_replyVO: " + review_replyVO);
			review_replyVO.setRv_no(rv_no);
			review_replyVO.setRrepl_no(rrepl_no);
			int mod_cnt = review_reply_service.modify_reply(review_replyVO);
			log.info("댓글-컨트롤러 댓글 수정 - 수정된 댓글 수: " + mod_cnt);

			return mod_cnt == 1 ? new ResponseEntity<>("댓글 수정 성공", HttpStatus.OK)
					: new ResponseEntity<>("댓글 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		//6. 게시물에 대한 특정 댓글/답글 삭제
//		@PreAuthorize("isAuthenticated() && principal.username == #myReply.rwriter")
		@DeleteMapping(value = "/{rv_no}/{rrepl_no}", produces = { "text/plain; charset=UTF-8" })
		public ResponseEntity<String> remove_reply(@PathVariable("rv_no") Long rv_no, @PathVariable("rrepl_no") Long rrepl_no,
												 @RequestBody Review_replyVO my_reply) {
			log.info("댓글-컨트롤러 - 댓글 삭제-URI 추출 rv_no: " + rv_no);
			log.info("댓글-컨트롤러 - 댓글 삭제-URI 추출 rrepl_no: " + rrepl_no);

			int del_cnt = review_reply_service.remove_reply(rv_no, rrepl_no);
			log.info("댓글-컨트롤러 - 댓글 삭제-삭제된 댓글 수: " + del_cnt);

			return del_cnt == 1 ? new ResponseEntity<>("댓글 삭제 성공", HttpStatus.OK)
					: new ResponseEntity<>("댓글 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}

}

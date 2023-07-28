package com.spring.tmz.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.tmz.domain.ReviewVO;
import com.spring.tmz.domain.Review_attach_fileVO;
import com.spring.tmz.domain.Review_likeVO;
import com.spring.tmz.domain.Review_pagingDTO;
import com.spring.tmz.domain.Review_paging_creatorDTO;
import com.spring.tmz.domain.Review_regionVO;
import com.spring.tmz.service.Review_service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review")
public class Review_controller {
	
	@Setter(onMethod_ =@Autowired)
	private  Review_service review_service; 
	
	
	//게시물 목록 조회-페이징 고려
		@GetMapping("/review-list")
		public String show_review_board_list(Review_pagingDTO review_pagingDTO, Model model) {
			log.info("컨트롤러 - 게시물 목록 조회 시작.....");
			log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + review_pagingDTO);
			model.addAttribute("review_list", review_service.get_review_board_list(review_pagingDTO));
			log.info("컨트롤러 - 게시물 목록 조회 완료.....");
			long row_review_amount_total = review_service.get_review_row_amount_total(review_pagingDTO);
			log.info("컨트롤러에 전달된 게시물 총 개수: " + row_review_amount_total);
			Review_paging_creatorDTO review_paging_creatorDTO = new Review_paging_creatorDTO(row_review_amount_total, review_pagingDTO);
			log.info("컨트롤러에서 생성된 Review_paging_creatorDTO 객체 정보: " + review_paging_creatorDTO.toString());
		 model.addAttribute("review_paging_creatorDTO", review_paging_creatorDTO );
		 return "review/review_list";
		}
	
	//1. 등록 페이지 호출
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/review-register")
	public String show_review_register_page(Model model) {
		log.info("컨트롤러-후게시물 등록 페이지 호출");
		model.addAttribute("continent_list", review_service.select_review_continent());
		return "/review/review_register";
	}
	//2. 게시물 등록-처리
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/review-register")
	public String register_new_review_board(ReviewVO my_review, RedirectAttributes redirect_attr) {
		log.info("컨트롤러 - 게시물등록(전달된 VO): " + my_review.toString());
//		for(Review_attach_fileVO aa : my_review.getAttach_review_file_list()) {
//			System.out.println(aa);
//		}
		System.out.println("============= attach_review_info =============");
		 if (my_review.getAttach_review_file_list()!= null) {
			 my_review.getAttach_review_file_list()
			 		.forEach(attach_file -> System.out.println("첨부 파일 정보:" + attach_file.toString()));
		 }
		 System.out.println("===========================================");
		 
		 long rv_no = review_service.register_review_board(my_review);
		 log.info("등록된 개시물의 rv_no: " + rv_no );
		 redirect_attr.addFlashAttribute("result", rv_no);
		 
		 return "redirect:/review/review-list";
	}
	//3. 게시물 수정
	@PreAuthorize("isAuthenticated() && principal.username == #my_review.rv_writer")
		@PostMapping("/review-modify")
		public String modify_review_board(ReviewVO my_review,RedirectAttributes redirect_attr,
				                		  Review_pagingDTO review_pagingDTO) {
			log.info("컨트롤러-게시물 수정 전달된 my_review값:"+my_review);
			
			if(review_service.modify_review_board(my_review)) {
				redirect_attr.addFlashAttribute("result","success_modify");
			}
			redirect_attr.addAttribute("rv_no",my_review.getRv_no());
			redirect_attr.addAttribute("review_page_num",review_pagingDTO.getReview_page_num());
			redirect_attr.addAttribute("review_page_row_amount_per_page",review_pagingDTO.getReview_page_row_amount_per_page());
			redirect_attr.addAttribute("review_scope", review_pagingDTO.getReview_scope());
			redirect_attr.addAttribute("review_keyword", review_pagingDTO.getReview_keyword());
			return "redirect:/review/review-modify";
		}
	//4. 게시물 실제 삭제
		//특정 게시물 실제 삭제
		@PreAuthorize("isAuthenticated() && principal.username == #rv_writer")
		@PostMapping("/review-remove")
		public String remove_review_board(@RequestParam("rv_no") long rv_no,
								  @RequestParam("rv_writer") String rv_writer, 
								  RedirectAttributes redirect_attr,
								  Review_pagingDTO review_pagingDTO) {
			log.info("컨트롤러-게시물 삭제:삭제되는 글번호"+rv_no);
			log.info("Review_controller.remove_review_board에 전달된 Review_pagingDTO.java: "+ review_pagingDTO);
			
			//첨부파일 정보를 저장할 리스트 객체 생성
			 List<Review_attach_fileVO> attach_review_file_list = review_service.get_review_attach_files_by_rv_no(rv_no);
			
			if(review_service.remove_review_board(rv_no)) {
				remove_review_attach_files(attach_review_file_list); 
				redirect_attr.addFlashAttribute("result","success_remove");
			} else { 
				redirect_attr.addFlashAttribute("result", "fail_remove");
			 }
			redirect_attr.addAttribute("review_page_num", review_pagingDTO.getReview_page_num());
			redirect_attr.addAttribute("review_page_row_amount_per_page", review_pagingDTO.getReview_page_row_amount_per_page());
			redirect_attr.addAttribute("review_scope", review_pagingDTO.getReview_scope());
			redirect_attr.addAttribute("review_keyword", review_pagingDTO.getReview_keyword());
			return "redirect:/review/review-list";
		}
		

		//5. 게시물 삭제 요청(실제로는 삭제가 안됨)
		@PostMapping("/review-delete")
		@PreAuthorize("isAuthenticated() && principal.username == #rv_writer")
		public String set_review_board_deleted(@RequestParam("rv_no") long rv_no,
									  @RequestParam("rv_writer") String rv_writer,
										RedirectAttributes redirect_attr,
										Review_pagingDTO review_pagingDTO) {
			log.info("컨트롤러-게시물 삭제"+rv_no);
			
			if(review_service.set_review_board_deleted(rv_no)) {
				redirect_attr.addFlashAttribute("result","successRemove");
			}
			redirect_attr.addAttribute("review_page_num",review_pagingDTO.getReview_page_num());
			redirect_attr.addAttribute("review_page_row_amount_per_page",review_pagingDTO.getReview_page_row_amount_per_page());
			redirect_attr.addAttribute("review_scope", review_pagingDTO.getReview_scope());
			redirect_attr.addAttribute("review_keyword", review_pagingDTO.getReview_keyword());
			return "redirect:/review/review-list";
		}
		// 6.게시물 전체 삭제
		//게시물 삭제 - 삭제 요청된 모든 게시물 삭제
		   @PostMapping("/review-removeAll")
		   @PreAuthorize("isAuthenticated()")
		   public String remove_all_deleted_board(Model model,RedirectAttributes redirect_attr,
				   Review_pagingDTO review_pagingDTO) {
		      
		      model.addAttribute("removed_row_cnt",review_service.remove_all_review_deleted_board());
		      log.info("관리자에 의해 삭제된 총 행수: " + model.getAttribute("removed_row_cnt"));
		      redirect_attr.addFlashAttribute("result","successRemoveAll");
		      redirect_attr.addAttribute("review_page_num",review_pagingDTO.getReview_page_num());
		      redirect_attr.addAttribute("review_page_row_amount_per_page",review_pagingDTO.getReview_page_row_amount_per_page());
		      redirect_attr.addAttribute("review_scope", review_pagingDTO.getReview_scope());
		      redirect_attr.addAttribute("review_keyword", review_pagingDTO.getReview_keyword()); 
		      return "redirect:/review/review_list";
		   }
		 //특정 게시물 조회 페이지 호출: 목록페이지에서 호출
		   @GetMapping("/review-detail")
		   public String showBoardDetail(@RequestParam("rv_no") long rv_no, Model model,
		                        @ModelAttribute("review_pagingDTO") Review_pagingDTO review_pagingDTO) {
		    log.info("컨트롤러 - 게시물 조회 페이지 호출: "+ rv_no);
		    
		    model.addAttribute("review", review_service.get_board_detail_modify(rv_no));
		    log.info("컨트롤러 - 화면으로 전달할 model: "+ model);
		    return "review/review_detail";
		   }
		   
			//게시물 조회페이지 -> 수정페이지 호출(/modify)
		   @PreAuthorize("isAuthenticated()")
			@GetMapping("/review-modify")
			public String show_board_modify(@RequestParam("rv_no") long rv_no, Model model,
					Review_pagingDTO review_pagingDTO) {
		   log.info("컨트롤러-후게시물 등록 페이지 호출");
			model.addAttribute("continent_list", review_service.select_review_continent());
			 log.info("컨트롤러 - 게시물 수정 페이지 호출: "+ rv_no);
			 model.addAttribute("review", review_service.get_board_detail_modify(rv_no));
			 log.info("컨트롤러 - 화면으로 전달할 model: "+ model);
			 model.addAttribute("review_pagingDTO",review_pagingDTO);
			 return "/review/review_modify";
			}
			//게시물 수정 후 -> 조회페이지 호출 시(/detailmod) 
			@GetMapping("/review-detailmod")
			@PreAuthorize("isAuthenticated()")
			public String show_review_board_detailmod(@RequestParam("rv_no") long rv_no, Model model,
														Review_pagingDTO review_pagingDTO) {
			 log.info("컨트롤러 - 게시물 수정 페이지 호출: "+ rv_no);
			 model.addAttribute("review_board", review_service.get_board_detail_modify(rv_no));
			 model.addAttribute("review_pagingDTO",review_pagingDTO);
			 log.info("컨트롤러 - 화면으로 전달할 model: "+ model);
			 return "/myboard/review_detail" ;
			}
			//7.특정 게시물에 대한 첨부파일 전체 삭제
			private void remove_review_attach_files(List<Review_attach_fileVO> attach_review_file_list) {
				if (attach_review_file_list == null || attach_review_file_list.size() == 0) {
					return;
				}

				System.out.println("첨부파일 삭제 시작...................");
				System.out.println("삭제되는 첨부파일 목록: " + attach_review_file_list.toString());

				attach_review_file_list.forEach(attach_file -> {
					try {
						Path file = Paths.get(attach_file.getReview_repo_path() + "/" + // "C:\\upload\\" +
								attach_file.getRuploadpath() + "/" + attach_file.getRuuid() + "_" + attach_file.getRfilename());
						Files.deleteIfExists(file);

						if (Files.probeContentType(file).startsWith("image")) {
							Path thumb_nail = Paths.get(attach_file.getReview_repo_path() + "/" + // "C:\\upload\\" +
									attach_file.getRuploadpath() + "/s_" + attach_file.getRuuid()+ "_" + attach_file.getRfilename());
							Files.delete(thumb_nail);
						}
					} catch (Exception e) {
						System.out.println("파일삭제 오류 발생" + e.getMessage());
					} 
				});
			}
			//8.특정 게시물의 조회 페이지 호출 후, 특정 게시물의 첨부파일 정보를 JSON으로 전달 ###########################
			@GetMapping(value = "/get_files", produces = {"application/json;charset=UTF-8" })
			@ResponseBody
			public ResponseEntity<List<Review_attach_fileVO>> show_attach_files(long rv_no) {
				 log.info("컨트롤러: 조회할 첨부파일의 게시물번호(rv_no): " + rv_no);
				 
				 return new ResponseEntity<List<Review_attach_fileVO>>(review_service.get_review_attach_files_by_rv_no(rv_no), HttpStatus.OK);
			}
			//9.대륙넘버를 받은 후 그 정보를 나라이름으로 다시 전달
			@GetMapping(value = "/get-country-list", produces = {"application/json;charset=UTF-8" })
			@ResponseBody
			public ResponseEntity<List<Review_regionVO>> get_country_list(String continent_name) {
				 log.info("컨트롤러: 조회할 첨부파일의 대륙 이름(continent_name): " + continent_name);
				 List<Review_regionVO> country_list = review_service.select_review_country(continent_name);
				 return new ResponseEntity<List<Review_regionVO>>(country_list, HttpStatus.OK);
			}
			//10. 좋아요 누를 시 컨트롤러
			@GetMapping(value = "/heart_pressed", produces = {"application/json;charset=UTF-8" })
			@ResponseBody
			public ResponseEntity<Integer> insert_review_like( Review_likeVO review_likeVO) {
				 log.info("전달된 review_likeVO 객체의 정보: " + review_likeVO);
				 review_service.insert_review_like(review_likeVO);
				 return new ResponseEntity<Integer>(review_likeVO.getRv_like_no(), HttpStatus.OK);
			}
			//11. 좋아요 뗄 시 컨트롤러
			
			@GetMapping(value = "/heart_unpressed", produces = {"application/json;charset=UTF-8" })
			@ResponseBody
			public ResponseEntity<Integer> disable_rv_like_check(Review_likeVO review_likeVO) {
				 log.info("전달된 review_likeVO 객체의 정보: " + review_likeVO);
				 review_service.disable_rv_like_check(review_likeVO);
				 
				 int result = review_service.disable_rv_like_check(review_likeVO);
				 
				 System.out.println(result);
				 
				 return new ResponseEntity<Integer>(result, HttpStatus.OK);
			}
			//12. 현재 좋아요가 눌렸는지 체크
			@GetMapping(value = "/heart_check",produces = { "text/plain; charset=UTF-8" })
			@ResponseBody
			public ResponseEntity<String> select_review_like_member(Review_likeVO review_likeVO) {
				 log.info("전달된 review_likeVO 객체의 정보: " + review_likeVO);
				 String result = "존재안함";
				 List<Review_likeVO> search = review_service.select_review_like_member(review_likeVO);
				 for(Review_likeVO find : search) {
					 if(find.getUser_id().equals(review_likeVO.getUser_id())) {
						 result="존재함";
						 
					 }else {
						 result="존재안함";
					 }
				 }
				 System.out.println("result의 결과물"+result);
				 return new ResponseEntity<>(result, HttpStatus.OK);
			}
			//11. 좋아요 없데이트 및 총 개수 표시
			
			@GetMapping(value = "/heart_total_show", produces = {"application/json;charset=UTF-8" })
			@ResponseBody
			public ResponseEntity<Integer> heart_total_show(Review_likeVO review_likeVO) {
				 log.info("전달된 review_likeVO 객체의 정보: " + review_likeVO);
				 review_service.update_rv_like_check(review_likeVO);
				 
				 int result = review_service.review_like_total(review_likeVO);
				 
				 System.out.println(result);
				 
				 return new ResponseEntity<Integer>(result, HttpStatus.OK);
			}
}

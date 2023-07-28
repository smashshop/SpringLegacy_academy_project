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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.tmz.domain.NoticeVO;
import com.spring.tmz.domain.Notice_fileVO;
import com.spring.tmz.domain.Notice_likeVO;
import com.spring.tmz.domain.Notice_pagingDTO;
import com.spring.tmz.domain.Notice_paging_creatorDTO;
import com.spring.tmz.domain.Notice_regionVO;
import com.spring.tmz.service.Notice_service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/notice")
public class Notice_board_controller {
	
	@Setter(onMethod_ =@Autowired)
	private Notice_service notice_service;
	
	//1. 공지글 목록 조회 - 페이징 고려-ok
	@GetMapping("notice-list")
	public String show_notice_list(Notice_pagingDTO notice_pagingDTO, Model model) {
		log.info("컨트롤러- 공지글 목록 조회 시작!!!!");
		log.info("컨트롤러에 전달된 페이징처리 데이터: " +notice_pagingDTO);
		model.addAttribute("notice_list", notice_service.get_notice_list(notice_pagingDTO));
		log.info("컨트롤러- 공지글 목록 조회 완료");
		long row_amount_list_total = notice_service.get_notice_total(notice_pagingDTO);
		log.info("컨트롤러에 전달된 게시물 총 개수: " + row_amount_list_total);
		Notice_paging_creatorDTO notice_paing_creatorDTO = new Notice_paging_creatorDTO(row_amount_list_total, notice_pagingDTO);
		log.info("컨트롤러에서 생성된 MyBoardCreaingPagingDTO 객체 정보: " + notice_paing_creatorDTO.toString());
		model.addAttribute("paging_creator", notice_paing_creatorDTO );
		return "/notice/notice_list";
	}
	
	//2. 공지사항 글등록 페이지
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	@GetMapping("/notice-register")
	public String registerNotice(Model model) {
	    log.info("컨트롤러-공지사항 등록 페이지 호출");
	    model.addAttribute("countinent_list", notice_service.select_notice_continent());
	    return "/notice/notice_register";
	}
	
	//3. 공지사항 글 등록   
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	@PostMapping("/notice-register")
	public String register_new_notice(NoticeVO noticeVO,RedirectAttributes redirectAttr) {
		log.info("컨트롤러 - 게시물등록(전달된 VO): " + noticeVO.toString());
		       
		System.out.println("============= attachInfo =============");
		if (noticeVO.getNotice_file_list() != null) {
		    noticeVO.getNotice_file_list()
		            .forEach(attachFile -> System.out.println("첨부 파일 정보:" + attachFile.toString()));
	       }
		System.out.println("===========================================");
		       
		long ntc_no = notice_service.register_notice_board(noticeVO);
		log.info("등록된 공지글의 ntc_no : " + ntc_no );
		redirectAttr.addFlashAttribute("result", ntc_no);
		       
		return "redirect:/notice/notice-list";
	}
	
	
	//4. 공지사항 글 수정 
	 @PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')") //여기 바꿔줘야함!!!!! 6/27작성 && principal.username == #noticeVO.ntc_writer\
	 @PostMapping("/notice-modify")
	 public String modify_notice(NoticeVO noticeVO,RedirectAttributes redirect_attr,
			   					Notice_pagingDTO notice_pagingDTO) {
	      log.info("컨트롤러-공지글 수정 전달된 noticeVO값:"+noticeVO);
	      
	      if(notice_service.update_notice(noticeVO)) {
	         redirect_attr.addFlashAttribute("result","success_modify");
	      }
	      redirect_attr.addAttribute("ntc_no",noticeVO.getNtc_no());
	      redirect_attr.addAttribute("noti_page_num",notice_pagingDTO.getNotice_page_num());
	      redirect_attr.addAttribute("noti_row_amount_perpage",notice_pagingDTO.getNotice_amount_per_page());
	      redirect_attr.addAttribute("notice_scope", notice_pagingDTO.getNotice_scope());
	      redirect_attr.addAttribute("keyword", notice_pagingDTO.getNotice_keyword());
	      return "redirect:/notice/notice-detail";
	   }
	 
	 //5. 공지글 조회 -> 수정페이지 -chim
	 @PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	 @GetMapping("/notice-modify")
	 public String showNoticeModify(@RequestParam("ntc_no")long ntc_no, Model model,
			 					  Notice_pagingDTO notice_pagingDTO) {
	     log.info("컨트롤러-공지사항 등록 페이지 호출");
	     model.addAttribute("countinent_list", notice_service.select_notice_continent());
		 log.info("컨트롤러- 공지글 수정 페이지 호출 : " + ntc_no);
		 model.addAttribute("notice", notice_service.get_notice_detail_modify(ntc_no));
		 log.info("컨트롤러- 화면으로 전달할 공지 model: " + model);
		 model.addAttribute("notice_pagingDTO", notice_pagingDTO);
			return "/notice/notice_modify";
	 }
	 
	 
	 //6. 공지글 수정 -> 조회페이지로(아직 안쓰는 거)
	 @GetMapping("/notice-detailmod")
	 public String show_notice_detail_mod(@RequestParam("ntc_no")long ntc_no,
			 							Model model, Notice_pagingDTO notice_pagingDTO) {
		 log.info("컨트롤러 - 공지글 수정 페이지 호출 : " + ntc_no);
		 model.addAttribute("notice", notice_service.get_notice_detail_modify(ntc_no));
		 model.addAttribute("notice_pagingDTO", notice_pagingDTO);
		 return "/notice/notice_detail";
	 }
	 
	//7. 특정 게시물의 조회 페이지 호출 후, 특정 게시물의 첨부파일 정보를 JSON으로 전달 ###########################
	   @GetMapping(value = "/notice_get_files", produces = {"application/json;charset=UTF-8" })
	   @ResponseBody
	   public ResponseEntity<List<Notice_fileVO>> show_attach_files(long ntc_no) {
	       log.info("컨트롤러: 조회할 첨부파일의 게시물번호(ntc_no): " + ntc_no);
	       
	       return new ResponseEntity<List<Notice_fileVO>>(notice_service.get_notice_file_ntcno(ntc_no), HttpStatus.OK);
	   } 
	 
	   //8. 특정 공지글 조회 페이지 호출(리스트->공지글) -chim
	   @GetMapping("/notice-detail")
	   public String show_detail_notice(@RequestParam("ntc_no") long ntc_no, Model model,
			   							@ModelAttribute("notice_pagingDTO") Notice_pagingDTO notice_pagingDTO, Notice_likeVO notice_likeVO ) {
		   log.info("컨트롤러 - 공지사항 조회 페이지 호출 :" + ntc_no);
		   model.addAttribute("like_list", notice_service.select_notice_like_user(notice_likeVO));
		   model.addAttribute("cnt_like", notice_service.notice_like_total(notice_likeVO));
		   model.addAttribute("notice", notice_service.get_notice_detail_modify(ntc_no));
		   log.info("컨트롤러- 화면으로 전달할 notice model:" + model);
		   return "/notice/notice_detail";  
	   }
	   	 
	
	 //9. 공지글 삭제 요청   
	 @PostMapping("/notice-delete")
	 @PreAuthorize("isAuthenticated() && principal.username==#notice.ntc_writer")
	 public String set_notice_deleted(@RequestParam("ntc_no")long ntc_no, 
			 						  @RequestParam("ntc_writer") String ntc_writer,
			 													RedirectAttributes redirectAttr,
			 													Notice_pagingDTO notice_pagingDTO) {
		  log.info("컨트롤러- 공지글 삭제 요청:" + ntc_no);
		 
		  if(notice_service.set_notice_delted(ntc_no)) {
			 redirectAttr.addFlashAttribute("result", "success_notice_delete");
	      }
	      redirectAttr.addAttribute("noti_page_num",notice_pagingDTO.getNotice_page_num());
	      redirectAttr.addAttribute("noti_row_amount_perpage",notice_pagingDTO.getNotice_amount_per_page());
	      redirectAttr.addAttribute("notice_scope", notice_pagingDTO.getNotice_scope());
	      redirectAttr.addAttribute("keyword", notice_pagingDTO.getNotice_keyword());
	      return "redirect:/notice/notice-list";
	   }
	   
	   
	 //10. 공지사항 실제 삭제
	 @PreAuthorize("isAuthenticated()")
	 @PostMapping("/notice-remove")
	 public String remove_notice(@RequestParam("ntc_no") long ntc_no,
			   					 @RequestParam("ntc_writer") String ntc_writer, 
			   					 						  	RedirectAttributes redirect_attr,
			   					 						  	Notice_pagingDTO notice_pagingDTO) {
	      log.info("컨트롤러-공지글 실제 삭제:삭제되는 글번호"+ntc_no);
	      log.info("Notice_board_controller.removeBoard에 전달된 Notice_pagingDTO: "+ notice_pagingDTO);
	      
	      //첨부파일 정보를 저장할 리스트 객체 생성
	       List<Notice_fileVO> notice_FileList = notice_service.get_notice_file_ntcno(ntc_no);
	      
	      if(notice_service.remove_notice(ntc_no)) {
	    	 remove_notice_files(notice_FileList); 
	         redirect_attr.addFlashAttribute("result","success_notice_remove");
	      } else { 
	    	  redirect_attr.addFlashAttribute("result", "fail_remove");
	       }
	      redirect_attr.addAttribute("noti_page_num", notice_pagingDTO.getNotice_page_num());
	      redirect_attr.addAttribute("noti_row_amount_perpage", notice_pagingDTO.getNotice_amount_per_page());
	      redirect_attr.addAttribute("notice_scope", notice_pagingDTO.getNotice_scope());
	      redirect_attr.addAttribute("keyword", notice_pagingDTO.getNotice_keyword());
	      return "redirect:/notice/notice-list";
	   }



	//11. 공지사항 삭제 요청 전체 삭제
	   @PostMapping("/notice-allremove")
	   public String remove_all_deleted_notice(Model model,RedirectAttributes redirect_attr,
			   								Notice_pagingDTO notice_pagingDTO) {
	      
	      model.addAttribute("removedall_notice_cnt",notice_service.remove_all_notice());
	      log.info("관리자에 의해 삭제된 총 행수: " + model.getAttribute("removedall_notice_cnt"));
	      redirect_attr.addFlashAttribute("result","success_notice_remove_all");
	      redirect_attr.addAttribute("noti_page_num",notice_pagingDTO.getNotice_page_num());
	      redirect_attr.addAttribute("noti_row_amount_perpage",notice_pagingDTO.getNotice_amount_per_page());
	      redirect_attr.addAttribute("notice_scope", notice_pagingDTO.getNotice_scope());
	      redirect_attr.addAttribute("keyword", notice_pagingDTO.getNotice_keyword()); 
	      return "redirect:/notice/notice-list";
	   }
	   
	//12. 특정 공지글 첨부파일 서버에서 전체 삭제
	  private void remove_notice_files(List<Notice_fileVO> notice_filelist) {

		     if (notice_filelist == null || notice_filelist.size() == 0) {
		         return;
		      }

		      System.out.println("첨부파일 삭제 시작...................");
		      System.out.println("삭제되는 첨부파일 목록: " + notice_filelist.toString());

		      notice_filelist.forEach(attachFile -> {
		         try {
		            Path file = Paths.get(attachFile.getNotice_repo_path() + "/" + // "C:\\upload\\" +
		            					  attachFile.getNuploadpath() + "/" + attachFile.getNuuid() + "_" + attachFile.getNfilename());
		            Files.deleteIfExists(file);

		            if (Files.probeContentType(file).startsWith("image")) {
		               Path notice_thumb_nail = Paths.get(attachFile.getNotice_repo_path() + "/" + // "C:\\upload\\" +
		            		   							  attachFile.getNuploadpath() + "/s_" + 
		            		   							  attachFile.getNuuid() + "_" + 
		            		   							  attachFile.getNfilename());
		               							Files.delete(notice_thumb_nail);
		            }
		         } catch (Exception e) {
		            System.out.println("파일삭제 오류 발생" + e.getMessage());
		         } // end catch
		      });// End 익명블록, forEach
	   }// End Method
	  
	  
	//13. 대륙넘버를 받은 후 그 정보를 나라이름으로 다시 전달
    @GetMapping(value = "/get-country-list", produces = {"application/json;charset=UTF-8" })
    @ResponseBody
    public ResponseEntity<List<Notice_regionVO>> get_country_list(String continent_name) {
        log.info("컨트롤러: 조회할 첨부파일의 게시물번호(continent_no): " + continent_name);
        List<Notice_regionVO> country_list = notice_service.select_notice_country(continent_name);
        return new ResponseEntity<List<Notice_regionVO>>(country_list, HttpStatus.OK);
    }  
	  
	//14. 좋아요 누를 시 컨트롤러
      @GetMapping(value = "/heart_pressed", produces = {"application/json;charset=UTF-8" })
      @ResponseBody
      public ResponseEntity<Integer> insert_notice_like( Notice_likeVO notice_likeVO) {
          log.info("전달된 notice_likeVO 객체의 정보: " + notice_likeVO);
          notice_service.insert_notice_like(notice_likeVO);
          return new ResponseEntity<Integer>(notice_likeVO.getNtc_like_no(), HttpStatus.OK);
      }
	  
	  
    //15. 좋아요 뗄 시 컨트롤러
      
      @GetMapping(value = "/heart_unpressed", produces = {"application/json;charset=UTF-8" })
      @ResponseBody
      public ResponseEntity<Integer> disable_notice_like (Notice_likeVO notice_likeVO) {
          log.info("전달된 notice_likeVO 객체의 정보: " + notice_likeVO);
          notice_service.disable_notice_like(notice_likeVO);
          
          int result = notice_service.disable_notice_like(notice_likeVO);
          
          System.out.println(result);
          
          return new ResponseEntity<Integer>(result, HttpStatus.OK);
      }
	  
      
      
    //16. 현재 좋아요가 눌렸는지 체크
      @GetMapping(value = "/heart_check",produces = { "text/plain; charset=UTF-8" })
      @ResponseBody
      public ResponseEntity<String> select_notice_like_user(Notice_likeVO notice_likeVO) {
          log.info("전달된 notice_likeVO 객체의 정보: " + notice_likeVO);
          String result = "존재안함";
          List<Notice_likeVO> search = notice_service.select_notice_like_user(notice_likeVO);
          for(Notice_likeVO find : search) {
             if(find.getUser_id().equals(notice_likeVO.getUser_id())) {
                result="존재함";
                
             }else {
                result="존재안함";
             }
          }
          System.out.println("result의 결과물"+result);
          return new ResponseEntity<>(result, HttpStatus.OK);
      } 
      
      
      //17. 좋아요 몇명 눌렀는지
      @GetMapping(value = "/notice_heart_total_show", produces = {"application/json;charset=UTF-8"})
      @ResponseBody
      public ResponseEntity<Integer> notice_heart_total_show(Notice_likeVO notice_likeVO){
    	  log.info("컨트롤러에 전달된 notice_likeVO "+ notice_likeVO);
    	  int totallike = notice_service.notice_like_total(notice_likeVO);
    	  System.out.println(totallike);
    	  return new ResponseEntity<Integer>(totallike, HttpStatus.OK);		//totallike이거를 아작스로 보내겠다!!!
      }
      
      
}
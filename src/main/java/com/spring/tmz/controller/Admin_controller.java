package com.spring.tmz.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.tmz.domain.Admin_user_pagingDTO;
import com.spring.tmz.domain.Admin_user_paging_creatorDTO;
import com.spring.tmz.domain.Date_searchVO;
import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.StatisticsVO;
import com.spring.tmz.domain.User_authVO;
import com.spring.tmz.domain.UserinfoVO;
import com.spring.tmz.service.Mypage_service;
import com.spring.tmz.service.Userinfo_service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
//@AllArgsConstructor //오류 발생
public class Admin_controller {
	
	@Setter(onMethod_= @Autowired)
	private Userinfo_service userinfo_service;
	
	@Setter(onMethod_= @Autowired)
	private Mypage_service mypage_service;
	
	
	
    @PostMapping("/admin-role-update")
    public String modify_user_role(User_authVO user_authVO) {
    	userinfo_service.modify_user_auth(user_authVO);
    	return "redirect:admin-allmember";
    }
	
	
    @PostMapping("/admin-report-update")
    public String report_enabled_modify(UserinfoVO userinfoVO) {
    	userinfo_service.report_enabled_modify(userinfoVO);
    	return "redirect:admin-allmember";
    }
	
	@RequestMapping("/test")
	public String test_con() {
		return "test";
	}
	

	
	@RequestMapping("/main-templet")
	public String main_templet_con() {
		return "main_templet";
	}
	   
	@RequestMapping("/admin-templet")
	public String manager_con() {
		return "admin/admin_templet";
	}
	
	
	
	
	@PreAuthorize("isAuthenticated() && hasAnyRole('ROLE_SUPER','ROLE_ADMIN')")
	@RequestMapping("/admin-rate-manage")
	public String rate_manage_con(Admin_user_pagingDTO user_pagingDTO, Model model) {
	    //동행 순위
	      
		 log.info("컨트롤러 - 게시물 목록 조회 시작.....");
	      log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + user_pagingDTO);
	      model.addAttribute("userList", userinfo_service.selectUserList(user_pagingDTO));
	   
	      long userCnt = userinfo_service.getBoardTotCnt(user_pagingDTO);
	      log.info("컨트롤러에 전달된 게시물 총 개수: " + userCnt);
	      model.addAttribute("userCnt", userCnt);
	      int searchCnt=userinfo_service.searchUserCnt(user_pagingDTO);
	      model.addAttribute("searchCnt", searchCnt);
	      
	      Admin_user_paging_creatorDTO user_paging_creatorDTO = 
	    		  new Admin_user_paging_creatorDTO(searchCnt, user_pagingDTO);
	      
	      log.info("컨트롤러에 생성된 MyPagingCreatorDTO 객체 정보: " + user_paging_creatorDTO.toString());
	   
	      model.addAttribute("pagingCreator", user_paging_creatorDTO);
	      log.info("컨트롤러 - 게시물 목록 (페이징고려) 조회 완료");
	      System.out.println(userinfo_service.selectUserList(user_pagingDTO).toString());
	      
	      //동행 순위
	      model.addAttribute("select_friend_cnt", userinfo_service.select_friend_cnt());
	      
	      //평점 관리
	      model.addAttribute("select_rate_list", userinfo_service.select_rate_list());
	      
		
		return "admin/admin_rate_manage";
	}
	
	@RequestMapping("/admin-friend-request")
	public String friend_request_con() {
		

		return "admin/admin_friend_request";
	}
	

	
	@PreAuthorize("isAuthenticated() && hasAnyRole('ROLE_SUPER','ROLE_ADMIN')")
	@RequestMapping("/admin-member-statistics")
	public String admin_visit_statistics_con(Model model) {
		//주간통계
		model.addAttribute("WeekVisitCnt", userinfo_service.selectWeekVisitCnt());
		
		model.addAttribute("WeekVisitCnt2", userinfo_service.selectWeekVisitCnt2());
		
		model.addAttribute("WeekVisitCnt3", userinfo_service.selectWeekVisitCnt3());
		
		model.addAttribute("WeekVisitCnt4", userinfo_service.selectWeekVisitCnt4());
		
		//월간통계
		model.addAttribute("month_value", userinfo_service.select_month_visit_cnt1());
		
		//연간통계
		model.addAttribute("select_Year_Visit_Cnt1", userinfo_service.select_Year_Visit_Cnt1());
		
		model.addAttribute("select_Year_Visit_Cnt2", userinfo_service.select_Year_Visit_Cnt2());
		
		model.addAttribute("select_Year_Visit_Cnt3", userinfo_service.select_Year_Visit_Cnt3());
		
		model.addAttribute("select_Year_Visit_Cnt4", userinfo_service.select_Year_Visit_Cnt4());
		
		model.addAttribute("select_Year_Visit_Cnt5", userinfo_service.select_Year_Visit_Cnt5());
		
		model.addAttribute("select_day_visit_cnt", userinfo_service.select_day_visit_cnt());
		
	
		
		//model.addAttribute("day_value", userinfo_service.select_day_visit_cnt());
		
		return "admin/admin_member_statistics";
	}
	
	@PreAuthorize("isAuthenticated() && hasAnyRole('ROLE_SUPER','ROLE_ADMIN')")
	@RequestMapping("/admin-visit-statistics")
	public String admin_board_statistics_con(Admin_user_pagingDTO user_pagingDTO, Model model) {
		  log.info("컨트롤러 - 게시물 목록 조회 시작.....");
	      log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + user_pagingDTO);
	      model.addAttribute("userList", userinfo_service.selectUserList(user_pagingDTO));
	   
	      long userCnt = userinfo_service.getBoardTotCnt(user_pagingDTO);
	      log.info("컨트롤러에 전달된 게시물 총 개수: " + userCnt);
	      model.addAttribute("userCnt", userCnt);
	      int searchCnt=userinfo_service.searchUserCnt(user_pagingDTO);
	      model.addAttribute("searchCnt", searchCnt);
	      
	      Admin_user_paging_creatorDTO user_paging_creatorDTO = 
	    		  new Admin_user_paging_creatorDTO(searchCnt, user_pagingDTO);
	      
	      log.info("컨트롤러에 생성된 MyPagingCreatorDTO 객체 정보: " + user_paging_creatorDTO.toString());
	   
	      model.addAttribute("pagingCreator", user_paging_creatorDTO);
	      log.info("컨트롤러 - 게시물 목록 (페이징고려) 조회 완료");
	      System.out.println(userinfo_service.selectUserList(user_pagingDTO).toString());
	    
	      
	    
		return "admin/admin_visit_statistics";
	
	
	}
	
	@PreAuthorize("isAuthenticated() && hasAnyRole('ROLE_SUPER','ROLE_ADMIN')")
	@RequestMapping("/admin-friend-statistics")
	public String admin_friend_statistics_con(Admin_user_pagingDTO user_pagingDTO, Model model) {
		  log.info("컨트롤러 - 게시물 목록 조회 시작.....");
	      log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + user_pagingDTO);
	      model.addAttribute("userList", userinfo_service.selectUserList(user_pagingDTO));
	   
	      long userCnt = userinfo_service.getBoardTotCnt(user_pagingDTO);
	      log.info("컨트롤러에 전달된 게시물 총 개수: " + userCnt);
	      model.addAttribute("userCnt", userCnt);
	      int searchCnt=userinfo_service.searchUserCnt(user_pagingDTO);
	      model.addAttribute("searchCnt", searchCnt);
	      
	      Admin_user_paging_creatorDTO user_paging_creatorDTO = 
	    		  new Admin_user_paging_creatorDTO(searchCnt, user_pagingDTO);
	      
	      log.info("컨트롤러에 생성된 MyPagingCreatorDTO 객체 정보: " + user_paging_creatorDTO.toString());
	   
	      model.addAttribute("pagingCreator", user_paging_creatorDTO);
	      log.info("컨트롤러 - 게시물 목록 (페이징고려) 조회 완료");
	      System.out.println(userinfo_service.selectUserList(user_pagingDTO).toString());
	      
	      //동행 순위
	      
	      model.addAttribute("select_friend_cnt", userinfo_service.select_friend_cnt());
	      
	      
	      //대륙별 통계
	      
	      model.addAttribute("select_continent_east_asia", userinfo_service.select_continent_east_asia());
	      
	      model.addAttribute("select_continent_southeast_asia", userinfo_service.select_continent_southeast_asia());
	      
	      model.addAttribute("select_continent_southwest_asia", userinfo_service.select_continent_southwest_asia());
	      
	      model.addAttribute("select_continent_europe", userinfo_service.select_continent_europe());
	      
	      model.addAttribute("select_continent_america", userinfo_service.select_continent_america());
	      
	      model.addAttribute("select_continent_oceania", userinfo_service.select_continent_oceania());
	      
	      model.addAttribute("select_continent_africa", userinfo_service.select_continent_africa());
	      
	      
	      
		  return "admin/admin_friend_statistics";
	}
	
	
	@PreAuthorize("isAuthenticated() && hasAnyRole('ROLE_SUPER','ROLE_ADMIN')")
	@RequestMapping("/admin-friend-statistics2")
	public String admin_friend_statistics2_con(Admin_user_pagingDTO user_pagingDTO, Model model) {
		  log.info("컨트롤러 - 게시물 목록 조회 시작.....");
	      log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + user_pagingDTO);
	      model.addAttribute("userList", userinfo_service.selectUserList(user_pagingDTO));
	   
	      long userCnt = userinfo_service.getBoardTotCnt(user_pagingDTO);
	      log.info("컨트롤러에 전달된 게시물 총 개수: " + userCnt);
	      model.addAttribute("userCnt", userCnt);
	      int searchCnt=userinfo_service.searchUserCnt(user_pagingDTO);
	      model.addAttribute("searchCnt", searchCnt);
	      
	      Admin_user_paging_creatorDTO user_paging_creatorDTO = 
	    		  new Admin_user_paging_creatorDTO(searchCnt, user_pagingDTO);
	      
	      log.info("컨트롤러에 생성된 MyPagingCreatorDTO 객체 정보: " + user_paging_creatorDTO.toString());
	   
	      model.addAttribute("pagingCreator", user_paging_creatorDTO);
	      log.info("컨트롤러 - 게시물 목록 (페이징고려) 조회 완료");
	      System.out.println(userinfo_service.selectUserList(user_pagingDTO).toString());
	      
	      //동행 순위
	      
	      model.addAttribute("select_friend_cnt", userinfo_service.select_friend_cnt());
	      
	      
	      //대륙별 통계
	      
	      model.addAttribute("select_continent_east_asia2", userinfo_service.select_continent_east_asia2());
	      
	      model.addAttribute("select_continent_southeast_asia2", userinfo_service.select_continent_southeast_asia2());
	      
	      model.addAttribute("select_continent_southwest_asia2", userinfo_service.select_continent_southwest_asia2());
	      
	      model.addAttribute("select_continent_europe2", userinfo_service.select_continent_europe2());
	      
	      model.addAttribute("select_continent_america2", userinfo_service.select_continent_america2());
	      
	      model.addAttribute("select_continent_oceania2", userinfo_service.select_continent_oceania2());
	      
	      model.addAttribute("select_continent_africa2", userinfo_service.select_continent_africa2());
	      
	      
	      
		  return "admin/admin_friend_statistics2";
	}
	

	
	   @PreAuthorize("isAuthenticated() && hasAnyRole('ROLE_SUPER','ROLE_ADMIN')")
	   @RequestMapping("/admin-allmember")
	   public String allmember_con(String frnd_writer, Admin_user_pagingDTO user_pagingDTO, Model model) { //void라서 어느폴더에 allmember 있어도 상관없음.
	        log.info("컨트롤러 - 게시물 목록 조회 시작.....");
	         log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + user_pagingDTO);
	         user_pagingDTO.setSearchFlag("all");
		      //user_pagingDTO.setEnabled("1");
		      user_pagingDTO.setUserDelflag("0");
	         model.addAttribute("userList", userinfo_service.selectUserList(user_pagingDTO));
	      
	         long userCnt = userinfo_service.getBoardTotCnt(user_pagingDTO);
	         log.info("컨트롤러에 전달된 게시물 총 개수: " + userCnt);
	         model.addAttribute("userCnt", userCnt);
	         int searchCnt=userinfo_service.searchUserCnt(user_pagingDTO);
	         model.addAttribute("searchCnt", searchCnt);
	         
	         Admin_user_paging_creatorDTO user_paging_creatorDTO = 
	               new Admin_user_paging_creatorDTO(searchCnt, user_pagingDTO);
	         
	         log.info("컨트롤러에 생성된 MyPagingCreatorDTO 객체 정보: " + user_paging_creatorDTO.toString());
	      
	         model.addAttribute("pagingCreator", user_paging_creatorDTO);
	         log.info("컨트롤러 - 게시물 목록 (페이징고려) 조회 완료");
	         System.out.println(userinfo_service.selectUserList(user_pagingDTO).toString());
	         
	         //권한 정보
	         model.addAttribute("select_authority", userinfo_service.select_authority());
	         
	         model.addAttribute("select_user_authority", userinfo_service.select_user_authority(user_pagingDTO));
	         
	         return "admin/admin_allmember";
	   }


	   
	   @GetMapping(value="get-frnd-list", produces="application/json;charset=UTF-8")
	   @ResponseBody
	   public ResponseEntity<List<FriendVO>> get_frnd_list(String frnd_writer) {
	      return new ResponseEntity<List<FriendVO>>(mypage_service.get_frnd_list_admin(frnd_writer), HttpStatus.OK);
	   }
	   
	   
	
    @PreAuthorize("isAuthenticated() && hasAnyRole('ROLE_SUPER','ROLE_ADMIN')")
	@RequestMapping("/admin-newmember")
	public String newmember_con(Admin_user_pagingDTO user_pagingDTO, Model model, Date_searchVO date_searchVO) throws ParseException {
		  log.info("컨트롤러 - 게시물 목록 조회 시작.....");
	      log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + user_pagingDTO);
	      user_pagingDTO.setSearchFlag("all");
	      user_pagingDTO.setEnabled("1");
	      user_pagingDTO.setUserDelflag("0");
	      model.addAttribute("userList", userinfo_service.selectUserList(user_pagingDTO));
	   
	      long userCnt = userinfo_service.getBoardTotCnt(user_pagingDTO);
	      log.info("컨트롤러에 전달된 게시물 총 개수: " + userCnt);
	      model.addAttribute("userCnt", userCnt);
	      int searchCnt=userinfo_service.searchUserCnt(user_pagingDTO);
	      model.addAttribute("searchCnt", searchCnt);
	      
	      Admin_user_paging_creatorDTO user_paging_creatorDTO = 
	    		  new Admin_user_paging_creatorDTO(searchCnt, user_pagingDTO);
	      
	      log.info("컨트롤러에 생성된 MyPagingCreatorDTO 객체 정보: " + user_paging_creatorDTO.toString());
	   
	      model.addAttribute("pagingCreator", user_paging_creatorDTO);
	      log.info("컨트롤러 - 게시물 목록 (페이징고려) 조회 완료");
	      System.out.println(userinfo_service.selectUserList(user_pagingDTO).toString());
	      
	
	      
	      return "admin/admin_newmember";

	}
	
    @PreAuthorize("isAuthenticated() && hasAnyRole('ROLE_SUPER','ROLE_ADMIN')")
	@RequestMapping("/admin-deletemember")
	public String deletemember_con(Admin_user_pagingDTO user_pagingDTO, Model model) {
		  log.info("컨트롤러 - 게시물 목록 조회 시작.....");
	      log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + user_pagingDTO);
	      
	      user_pagingDTO.setSearchFlag("all");
	      //user_pagingDTO.setEnabled("0");
	      user_pagingDTO.setUserDelflag("1");
	      model.addAttribute("userList", userinfo_service.selectUserList(user_pagingDTO));
	   
	      long userCnt = userinfo_service.getBoardTotCnt(user_pagingDTO);
	      log.info("컨트롤러에 전달된 게시물 총 개수: " + userCnt);
	      model.addAttribute("userCnt", userCnt);
	      int searchCnt=userinfo_service.searchUserCnt(user_pagingDTO);
	      model.addAttribute("searchCnt", searchCnt);
	      
	      Admin_user_paging_creatorDTO user_paging_creatorDTO = 
	    		  new Admin_user_paging_creatorDTO(searchCnt, user_pagingDTO);
	      
	      log.info("컨트롤러에 생성된 MyPagingCreatorDTO 객체 정보: " + user_paging_creatorDTO.toString());
	   
	      model.addAttribute("pagingCreator", user_paging_creatorDTO);
	      log.info("컨트롤러 - 게시물 목록 (페이징고려) 조회 완료");
	      System.out.println(userinfo_service.selectUserList(user_pagingDTO).toString());
	      
	      
	      return "admin/admin_deletemember";

	}
	
    @PreAuthorize("isAuthenticated() && hasAnyRole('ROLE_SUPER','ROLE_ADMIN')")
	@RequestMapping("/admin-sleepmember")
	public String sleepmember_con(Admin_user_pagingDTO user_pagingDTO, Model model) {
		  log.info("컨트롤러 - 게시물 목록 조회 시작.....");
	      log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + user_pagingDTO);
	      model.addAttribute("userList", userinfo_service.selectUserList(user_pagingDTO));
	   
	      long userCnt = userinfo_service.getBoardTotCnt(user_pagingDTO);
	      log.info("컨트롤러에 전달된 게시물 총 개수: " + userCnt);
	      model.addAttribute("userCnt", userCnt);
	      int searchCnt=userinfo_service.searchUserCnt(user_pagingDTO);
	      model.addAttribute("searchCnt", searchCnt);
	      
	      Admin_user_paging_creatorDTO user_paging_creatorDTO = 
	    		  new Admin_user_paging_creatorDTO(searchCnt, user_pagingDTO);
	      
	      log.info("컨트롤러에 생성된 MyPagingCreatorDTO 객체 정보: " + user_paging_creatorDTO.toString());
	   
	      model.addAttribute("pagingCreator", user_paging_creatorDTO);
	      log.info("컨트롤러 - 게시물 목록 (페이징고려) 조회 완료");
	      System.out.println(userinfo_service.selectUserList(user_pagingDTO).toString());
	      
	      
	      return "admin/admin_sleepmember";

	}
	

	@ResponseBody
	@GetMapping("/selectContryStat")
	public Map<String,List<Map<String,String>>> selectContryStat(@RequestParam("status") String paramMap,Admin_user_pagingDTO user_pagingDTO, Model model) {
		System.out.println(paramMap.toString());
		Map<String,List<Map<String,String>>>  map=new HashMap<String,List<Map<String,String>>> ();
		List<Map<String,String>> eastSouthasisList= userinfo_service.selectContryStat("2",paramMap);
		List<Map<String,String>> eastAsiaList= userinfo_service.selectContryStat("3",paramMap);
		List<Map<String,String>> westSouthAsisList= userinfo_service.selectContryStat("4",paramMap);
		List<Map<String,String>> armeList= userinfo_service.selectContryStat("5",paramMap);
		List<Map<String,String>> arfList= userinfo_service.selectContryStat("6",paramMap);
		List<Map<String,String>> oseList= userinfo_service.selectContryStat("7",paramMap);
		List<Map<String,String>> europeList= userinfo_service.selectContryStat("8",paramMap);

		map.put("eastSouthasisList", eastSouthasisList);
		map.put("eastAsiaList", eastAsiaList);
		map.put("westSouthAsisList", westSouthAsisList);
		map.put("armeList", armeList);
		map.put("arfList", arfList);
		map.put("oseList", oseList);
		map.put("europeList", europeList);
		
 		return map;
	      

	}

	
    
    
    

}

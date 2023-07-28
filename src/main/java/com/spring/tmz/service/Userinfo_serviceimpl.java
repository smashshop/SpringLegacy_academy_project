package com.spring.tmz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.tmz.domain.Admin_user_pagingDTO;
import com.spring.tmz.domain.AuthorityVO;
import com.spring.tmz.domain.StatisticsVO;
import com.spring.tmz.domain.User_authVO;
import com.spring.tmz.domain.UserinfoVO;
import com.spring.tmz.mapper.Userinfo_mapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service 
@AllArgsConstructor   //이거 쓰거나 밑에 생성자 쓰거나 2중에 하나만 써야 오류가 안남
public class Userinfo_serviceimpl implements Userinfo_service {
	
	   private Userinfo_mapper userinfo_mapper;
	   //페이징 처리전
	   // 페이징 처리후
	   
	   public boolean modify_user_auth(User_authVO user_authVO) {
		   return userinfo_mapper.insert_role(user_authVO);
	   }
	   
	   @Override
	   public UserinfoVO get_userinfo(String user_id) {
		   return userinfo_mapper.select_userinfo_frnd(user_id);
	   }
	   
	   public boolean report_enabled_modify(UserinfoVO userinfoVO){
		   return userinfo_mapper.report_role(userinfoVO);
	   }
	   
	   @Override
	   public List<UserinfoVO> selectUserList(Admin_user_pagingDTO user_pagingDTO) {
		   System.out.println(user_pagingDTO);
//		   Map<String,String> map=new HashMap<String,String>();
//		   map.put("keyword", user_pagingDTO.getKeyword());
//		   map.put("scope", user_pagingDTO.getScope());
//		   map.put("pageNum", Integer.toString(user_pagingDTO.getPageNum()));
//		   map.put("rowCntPerPage", Integer.toString(user_pagingDTO.getRowCntPerPage()));
//	      List<Map<String,String>> list=commonDao.selectList("com.spring.tmz.mapper.Userinfo_mapper.selectUserList", map);
	      return userinfo_mapper.selectUserList(user_pagingDTO);
	   }
	   
	   @Override
	   public long getBoardTotCnt(Admin_user_pagingDTO user_pagingDTO) {
	      log.info("MyBoardService.getBoardTotCnt()에 전달된 MyPagingDTO: "+ user_pagingDTO);
	       return userinfo_mapper.selectBoardTotCnt(user_pagingDTO);
	      }
	   
	 //일간통계
		
	   public List<StatisticsVO> select_day_visit_cnt() {
		   return userinfo_mapper.select_day_visit_cnt();
		   
	   }
	   
	   //주간통계
	   
	   @Override
	   public long selectWeekVisitCnt() {
		   return userinfo_mapper.selectWeekVisitCnt();
		   
	   }
	   
	   @Override
	   public long selectWeekVisitCnt2() {
		   return userinfo_mapper.selectWeekVisitCnt2();
		   
	   }
	   
	   @Override
	   public long selectWeekVisitCnt3() {
		   return userinfo_mapper.selectWeekVisitCnt3();
		   
	   }
	   
	   @Override
	   public long selectWeekVisitCnt4() {
		   return userinfo_mapper.selectWeekVisitCnt4();
		   
	   }
	   
	//월간통계   
	@Override
	public StatisticsVO select_month_visit_cnt1() {
		
		return userinfo_mapper.select_month_visit_cnt1();
	}

	@Override
	public int searchUserCnt(Admin_user_pagingDTO user_pagingDTO) {
		return userinfo_mapper.searchUserCnt(user_pagingDTO);
	}


	
	//연간통계
	
	
	public int select_Year_Visit_Cnt1() {
		return userinfo_mapper.select_Year_Visit_Cnt1();	
	}
	
	public int select_Year_Visit_Cnt2(){
		return userinfo_mapper.select_Year_Visit_Cnt2();	
	}
	
	public int select_Year_Visit_Cnt3(){
		return userinfo_mapper.select_Year_Visit_Cnt3();	
	}
	
	public int select_Year_Visit_Cnt4(){
		return userinfo_mapper.select_Year_Visit_Cnt4();	
	}
	
	public int select_Year_Visit_Cnt5(){
		return userinfo_mapper.select_Year_Visit_Cnt5();	
	}
  
	   
	
	//권한설정
	public List<AuthorityVO> select_authority(){
		return userinfo_mapper.select_authority();
	}
	
	public List<StatisticsVO> select_user_authority(Admin_user_pagingDTO user_pagingDTO){
		return userinfo_mapper.select_user_authority(user_pagingDTO);
	}
	
	//동행 순위
	
	public List<StatisticsVO> select_friend_cnt(){
		return userinfo_mapper.select_friend_cnt();
	};
	
	//대륙별 통계
	
	public int select_continent_east_asia() {
		return userinfo_mapper.select_continent_east_asia();
	}
	
	public int select_continent_southeast_asia() {
		return userinfo_mapper.select_continent_southeast_asia();
	}
	
	public int select_continent_southwest_asia() {
		return userinfo_mapper.select_continent_southwest_asia();
	}
	
	public int select_continent_europe() {
		return userinfo_mapper.select_continent_europe();
	}
	
	public int select_continent_america() {
		return userinfo_mapper.select_continent_america();
	}
	
	public int select_continent_oceania() {
		return userinfo_mapper.select_continent_oceania();
	}
	
	public int select_continent_africa() {
		return userinfo_mapper.select_continent_africa();
	}
	
	
	
	//나라별 통계
	
	public int select_country_hongkong() {
		return userinfo_mapper.select_country_hongkong();
	}
	
	public int select_country_taiwan() {
		return userinfo_mapper.select_country_taiwan();
	}
	
	public int select_country_china() {
		return userinfo_mapper.select_country_china();
	}
	
	public int select_country_mongolia() {
		return userinfo_mapper.select_country_mongolia();
	}
	
	public int select_country_korea() {
		return userinfo_mapper.select_country_korea();
	}
	
	public int select_country_japan() {
		return userinfo_mapper.select_country_japan();
	}
	
	public int select_country_Singapore() {
		return userinfo_mapper.select_country_Singapore();
	}
	
	public int select_country_Vietnam() {
		return userinfo_mapper.select_country_Vietnam();
	}
	
	public int select_country_Thailand() {
		return userinfo_mapper.select_country_Thailand();
	}
	
	public int select_country_Indonesia() {
		return userinfo_mapper.select_country_Indonesia();
	}
	
	public int select_country_Malaysia() {
		return userinfo_mapper.select_country_Malaysia();
	}
	
	public int select_country_Philippine() {
		return userinfo_mapper.select_country_Philippine();
	}
	
	public int select_country_Laos() {
		return userinfo_mapper.select_country_Laos();
	}
	
	public int select_country_Cambodia() {
		return userinfo_mapper.select_country_Cambodia();
	}
	
	public int select_country_Myanmar() {
		return userinfo_mapper.select_country_Myanmar();
	}
	
	public int select_country_United_arab_emirates() {
		return userinfo_mapper.select_country_United_arab_emirates();
	}
	
	public int select_country_Oman() {
		return userinfo_mapper.select_country_Oman();
	}
	
	public int select_country_India() {
		return userinfo_mapper.select_country_India();
	}
	
	public int select_country_Nepal() {
		return userinfo_mapper.select_country_Nepal();
	}
	
	public int select_country_Israel() {
		return userinfo_mapper.select_country_Israel();
	}
	
	public int select_country_catarrh() {
		return userinfo_mapper.select_country_catarrh();
	}
	
	public int select_country_france() {
		return userinfo_mapper.select_country_france();
	}
	
	public int select_country_Italy() {
		return userinfo_mapper.select_country_Italy();
	}
	
	public int select_country_turkey() {
		return userinfo_mapper.select_country_turkey();
	}
	
	public int select_country_Spain() {
		return userinfo_mapper.select_country_Spain();
	}
	
	public int select_country_uk() {
		return userinfo_mapper.select_country_uk();
	}
	
	public int select_country_Austria() {
		return userinfo_mapper.select_country_Austria();
	}
	
	public int select_country_Netherlands() {
		return userinfo_mapper.select_country_Netherlands();
	}
	
	public int select_country_Germany() {
		return userinfo_mapper.select_country_Germany();
	}
	
	public int select_country_Swiss() {
		return userinfo_mapper.select_country_Swiss();
	}
	
	public int select_country_Portugal() {
		return userinfo_mapper.select_country_Portugal();
	}
	
	public int select_country_Poland() {
		return userinfo_mapper.select_country_Poland();
	}
	
	public int select_country_Iceland() {
		return userinfo_mapper.select_country_Iceland();
	}
	
	
	public int select_country_Finland() {
		return userinfo_mapper.select_country_Finland();
	}
	
	public int select_country_Sweden() {
		return userinfo_mapper.select_country_Sweden();
	}
	
	public int select_country_Norway() {
		return userinfo_mapper.select_country_Norway();
	}
	
	public int select_country_Denmark() {
		return userinfo_mapper.select_country_Denmark();
	}
	
	public int select_country_Greece() {
		return userinfo_mapper.select_country_Greece();
	}
	
	public int select_country_russia() {
		return userinfo_mapper.select_country_russia();
	}
	
	public int select_country_Ireland() {
		return userinfo_mapper.select_country_Ireland();
	}
	
	public int select_country_Hungary() {
		return userinfo_mapper.select_country_Hungary();
	}
	
	public int select_country_Belgium() {
		return userinfo_mapper.select_country_Belgium();
	}
	
	public int select_country_Czech_republic() {
		return userinfo_mapper.select_country_Czech_republic();
	}
	
	public int select_country_Slovenian() {
		return userinfo_mapper.select_country_Slovenian();
	}
	
	public int select_country_USA() {
		return userinfo_mapper.select_country_USA();
	}
	
	public int select_country_Canada() {
		return userinfo_mapper.select_country_Canada();
	}
	
	public int select_country_Mexico() {
		return userinfo_mapper.select_country_Mexico();
	}
	
	public int select_country_Peru() {
		return userinfo_mapper.select_country_Peru();
	}

	public int select_country_Bolivia() {
		return userinfo_mapper.select_country_Bolivia();
	}
	
	public int select_country_Chile() {
		return userinfo_mapper.select_country_Chile();
	}
	
	public int select_country_Argentina() {
		return userinfo_mapper.select_country_Argentina();
	}
	
	public int select_country_australia() {
		return userinfo_mapper.select_country_australia();
	}
	
	public int select_country_New_zealand() {
		return userinfo_mapper.select_country_New_zealand();
	}
	
	public int select_country_Egypt() {
		return userinfo_mapper.select_country_Egypt();
	}
	
	public int select_country_Republic_of_south_africa() {
		return userinfo_mapper.select_country_Republic_of_south_africa();
	}
	
	public int select_country_Tanzania() {
		return userinfo_mapper.select_country_Tanzania();
	}
	
	public int select_country_Ethiopia() {
		return userinfo_mapper.select_country_Ethiopia();
	}
	
	public int select_country_Kenya() {
		return userinfo_mapper.select_country_Kenya();
	}
	
	public int select_country_Namibia() {
		return userinfo_mapper.select_country_Namibia();
	}
	
	public int select_country_Morocco() {
		return userinfo_mapper.select_country_Morocco();
	}
	
	
	
	//대륙별 통계(모집 완료)
	
	public int select_continent_east_asia2() {
		return userinfo_mapper.select_continent_east_asia2();
	}
	
	public int select_continent_southeast_asia2() {
		return userinfo_mapper.select_continent_southeast_asia2();
	}
	
	public int select_continent_southwest_asia2() {
		return userinfo_mapper.select_continent_southwest_asia2();
	}
	
	public int select_continent_europe2() {
		return userinfo_mapper.select_continent_europe2();
	}
	
	public int select_continent_america2() {
		return userinfo_mapper.select_continent_america2();
	}
	
	public int select_continent_oceania2() {
		return userinfo_mapper.select_continent_oceania2();
	}
	
	public int select_continent_africa2() {
		return userinfo_mapper.select_continent_africa2();
	}
	
	
	
	//나라별 통계(모집 완료)
	
	public int select_country_hongkong2() {
		return userinfo_mapper.select_country_hongkong2();
	}
	
	public int select_country_taiwan2() {
		return userinfo_mapper.select_country_taiwan2();
	}
	
	public int select_country_china2() {
		return userinfo_mapper.select_country_china2();
	}
	
	public int select_country_mongolia2() {
		return userinfo_mapper.select_country_mongolia2();
	}
	
	public int select_country_korea2() {
		return userinfo_mapper.select_country_korea2();
	}
	
	public int select_country_japan2() {
		return userinfo_mapper.select_country_japan2();
	}
	
	public int select_country_Singapore2() {
		return userinfo_mapper.select_country_Singapore2();
	}
	
	public int select_country_Vietnam2() {
		return userinfo_mapper.select_country_Vietnam2();
	}
	
	public int select_country_Thailand2() {
		return userinfo_mapper.select_country_Thailand2();
	}
	
	public int select_country_Indonesia2() {
		return userinfo_mapper.select_country_Indonesia2();
	}
	
	public int select_country_Malaysia2() {
		return userinfo_mapper.select_country_Malaysia2();
	}
	
	public int select_country_Philippine2() {
		return userinfo_mapper.select_country_Philippine2();
	}
	
	public int select_country_Laos2() {
		return userinfo_mapper.select_country_Laos2();
	}
	
	public int select_country_Cambodia2() {
		return userinfo_mapper.select_country_Cambodia2();
	}
	
	public int select_country_Myanmar2() {
		return userinfo_mapper.select_country_Myanmar2();
	}
	
	public int select_country_United_arab_emirates2() {
		return userinfo_mapper.select_country_United_arab_emirates2();
	}
	
	public int select_country_Oman2() {
		return userinfo_mapper.select_country_Oman2();
	}
	
	public int select_country_India2() {
		return userinfo_mapper.select_country_India2();
	}
	
	public int select_country_Nepal2() {
		return userinfo_mapper.select_country_Nepal2();
	}
	
	public int select_country_Israel2() {
		return userinfo_mapper.select_country_Israel2();
	}
	
	public int select_country_catarrh2() {
		return userinfo_mapper.select_country_catarrh2();
	}
	
	public int select_country_france2() {
		return userinfo_mapper.select_country_france2();
	}
	
	public int select_country_Italy2() {
		return userinfo_mapper.select_country_Italy2();
	}
	
	public int select_country_turkey2() {
		return userinfo_mapper.select_country_turkey2();
	}
	
	public int select_country_Spain2() {
		return userinfo_mapper.select_country_Spain2();
	}
	
	public int select_country_uk2() {
		return userinfo_mapper.select_country_uk2();
	}
	
	public int select_country_Austria2() {
		return userinfo_mapper.select_country_Austria2();
	}
	
	public int select_country_Netherlands2() {
		return userinfo_mapper.select_country_Netherlands2();
	}
	
	public int select_country_Germany2() {
		return userinfo_mapper.select_country_Germany2();
	}
	
	public int select_country_Swiss2() {
		return userinfo_mapper.select_country_Swiss2();
	}
	
	public int select_country_Portugal2() {
		return userinfo_mapper.select_country_Portugal2();
	}
	
	public int select_country_Poland2() {
		return userinfo_mapper.select_country_Poland2();
	}
	
	public int select_country_Iceland2() {
		return userinfo_mapper.select_country_Iceland2();
	}
	
	
	public int select_country_Finland2() {
		return userinfo_mapper.select_country_Finland2();
	}
	
	public int select_country_Sweden2() {
		return userinfo_mapper.select_country_Sweden2();
	}
	
	public int select_country_Norway2() {
		return userinfo_mapper.select_country_Norway2();
	}
	
	public int select_country_Denmark2() {
		return userinfo_mapper.select_country_Denmark2();
	}
	
	public int select_country_Greece2() {
		return userinfo_mapper.select_country_Greece2();
	}
	
	public int select_country_russia2() {
		return userinfo_mapper.select_country_russia2();
	}
	
	public int select_country_Ireland2() {
		return userinfo_mapper.select_country_Ireland2();
	}
	
	public int select_country_Hungary2() {
		return userinfo_mapper.select_country_Hungary2();
	}
	
	public int select_country_Belgium2() {
		return userinfo_mapper.select_country_Belgium2();
	}
	
	public int select_country_Czech_republic2() {
		return userinfo_mapper.select_country_Czech_republic2();
	}
	
	public int select_country_Slovenian2() {
		return userinfo_mapper.select_country_Slovenian2();
	}
	
	public int select_country_USA2() {
		return userinfo_mapper.select_country_USA2();
	}
	
	public int select_country_Canada2() {
		return userinfo_mapper.select_country_Canada2();
	}
	
	public int select_country_Mexico2() {
		return userinfo_mapper.select_country_Mexico2();
	}
	
	public int select_country_Peru2() {
		return userinfo_mapper.select_country_Peru2();
	}

	public int select_country_Bolivia2() {
		return userinfo_mapper.select_country_Bolivia2();
	}
	
	public int select_country_Chile2() {
		return userinfo_mapper.select_country_Chile2();
	}
	
	public int select_country_Argentina2() {
		return userinfo_mapper.select_country_Argentina2();
	}
	
	public int select_country_australia2() {
		return userinfo_mapper.select_country_australia2();
	}
	
	public int select_country_New_zealand2() {
		return userinfo_mapper.select_country_New_zealand2();
	}
	
	public int select_country_Egypt2() {
		return userinfo_mapper.select_country_Egypt2();
	}
	
	public int select_country_Republic_of_south_africa2() {
		return userinfo_mapper.select_country_Republic_of_south_africa2();
	}
	
	public int select_country_Tanzania2() {
		return userinfo_mapper.select_country_Tanzania2();
	}
	
	public int select_country_Ethiopia2() {
		return userinfo_mapper.select_country_Ethiopia2();
	}
	
	public int select_country_Kenya2() {
		return userinfo_mapper.select_country_Kenya2();
	}
	
	public int select_country_Namibia2() {
		return userinfo_mapper.select_country_Namibia2();
	}
	
	public int select_country_Morocco2() {
		return userinfo_mapper.select_country_Morocco2();
	}
	   
	
	@Override
	public List<Map<String, String>> selectContryStat(String no, String string) {
		Map<String,String> map =new HashMap<String,String>();
		map.put("conno", no);
		map.put("yn", string);
		return userinfo_mapper.selectContryStat(map);
	}
	
	
	
	//평점 관리
	
	public List<UserinfoVO> select_rate_list() {
		return userinfo_mapper.select_rate_list();
	}
	
		//회원가입
		  @Override
		  public boolean register_userinfo(UserinfoVO userinfo) {
		  
			  System.out.println(userinfo.toString());
			  
			  return userinfo_mapper.insert_userinfo(userinfo);
		  }
			
		   //아이디 중복확인
		   @Override
		   public boolean idCheck(String user_id) {
				
			   return userinfo_mapper.select_userinfo_idChk(user_id) != null;
		   }
		   
		  //
		   @Override
		   public void join(UserinfoVO VO) {

		   }
		   
		   //회원 권한 등록
		   @Override
			  public Integer insert_user_authority(String user_id) {
			  
				  System.out.println(user_id.toString());
				  
				  return userinfo_mapper.insert_user_authority(user_id);
			  }
	   
	 //최예나/ 아이디 찾기
	   @Override
	   public String search_id(String user_name, String user_email){
		   return userinfo_mapper.select_user_id(user_name, user_email);
	   }
}
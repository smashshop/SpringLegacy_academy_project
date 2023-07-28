package com.spring.tmz.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.tmz.domain.Admin_user_pagingDTO;
import com.spring.tmz.domain.AuthorityVO;
import com.spring.tmz.domain.StatisticsVO;
import com.spring.tmz.domain.User_authVO;
import com.spring.tmz.domain.UserinfoVO;


public interface Userinfo_mapper {
	
	public boolean insert_role(User_authVO user_authVO);
	
	public boolean report_role(UserinfoVO userinfoVO);
	
	public List<UserinfoVO> select_userinfo_list(@Param("user_id")String user_id, @Param("user_pw")String user_pw);
	
	public UserinfoVO select_userinfo(String user_id);
	
	public UserinfoVO select_userinfo_frnd(String user_id);
	
	//public Integer update_user_pw(UserinfoVO userinfoVO);
	
	//public Integer insert_user_pw(UserinfoVO userinfoVO);
	
	//회원가입
    public boolean insert_userinfo(UserinfoVO userinfo); 
	
	//public int test_insert_userinfo(@Param("user_id") String user_id,@Param("user_pw") String user_pw); 
	
	public Integer insert_user_authority(AuthorityVO authorityVO);
	
	
	
	//양조훈
	// 게시물 목록 표시 :페이징 고려 
	public List<UserinfoVO> selectUserList(Admin_user_pagingDTO user_pagingDTO);
	
	//게시물 총 개수 조회(페이징) + 검색 고려. 맨 마지막 페이지 번호(총 페이지 번호 갯수)를 구하기 위해 필요함
	public long selectBoardTotCnt(Admin_user_pagingDTO user_pagingDTO);

	//일간통계
	
	public List<StatisticsVO> select_day_visit_cnt();
	
	//주간통계
	
	public long selectWeekVisitCnt();
	
	public long selectWeekVisitCnt2();
	
	public long selectWeekVisitCnt3();
	
	public long selectWeekVisitCnt4();
	
	
	
	//월간통계
	
		public StatisticsVO select_month_visit_cnt1();
		//public List<UserinfoVO> select_month_visit_cnt1();

		public int searchUserCnt(Admin_user_pagingDTO user_pagingDTO);
		//.end 양조훈
		
		//연간통계
		
		
		public int select_Year_Visit_Cnt1();
		
		public int select_Year_Visit_Cnt2();
		
		public int select_Year_Visit_Cnt3();
		
		public int select_Year_Visit_Cnt4();
		
		public int select_Year_Visit_Cnt5();
		
		
		
		//중복체크
		public UserinfoVO select_userinfo_idChk(String user_id);
		
		//회원 권한 등록
		public Integer insert_user_authority(String user_id);

		
		public Integer insert_userinfo2(UserinfoVO userinfoVO);

		
		
		
		//권한설정
		public List<AuthorityVO> select_authority();
		
		public List<StatisticsVO> select_user_authority(Admin_user_pagingDTO user_pagingDTO);
		
		
		//동행 순위
		
		public List<StatisticsVO> select_friend_cnt();
		
		
		//대륙별 통계(모집 중)
		
		public int select_continent_east_asia();
		
		public int select_continent_southeast_asia();
		
		public int select_continent_southwest_asia();
		
		public int select_continent_europe();
		
		public int select_continent_america();
		
		public int select_continent_oceania();
		
		public int select_continent_africa();
		
		
		//나라별 통계(모집 중)
		
		public int select_country_hongkong();
		
		public int select_country_taiwan();
		
		public int select_country_china();
		
		public int select_country_mongolia();
		
		public int select_country_korea();
		
		public int select_country_japan();   
		
		public int select_country_Singapore();
		
		public int select_country_Vietnam();
		
		public int select_country_Thailand();
		
		public int select_country_Indonesia();
		
		public int select_country_Malaysia();
		
		public int select_country_Philippine();
		
		public int select_country_Laos();
		
		public int select_country_Cambodia();
		
		public int select_country_Myanmar();
		
		public int select_country_United_arab_emirates();
		
		public int select_country_Oman();
		
		public int select_country_India();
		
		public int select_country_Nepal();
		
		public int select_country_Israel();
		
		public int select_country_catarrh();
		
		public int select_country_france();
		
		public int select_country_Italy();
		
		public int select_country_turkey();
		
		public int select_country_Spain();
		
		public int select_country_uk();
		
		public int select_country_Austria();
		
		public int select_country_Netherlands();
		
		public int select_country_Germany();
		
		public int select_country_Swiss();
		
		public int select_country_Portugal();
		
		public int select_country_Poland();
		
		public int select_country_Iceland();
		
		public int select_country_Finland();
		
		public int select_country_Sweden();
		
		public int select_country_Norway();  
		
		public int select_country_Denmark();
		
		public int select_country_Greece();
		
		public int select_country_russia();
		
		public int select_country_Ireland();
		
		public int select_country_Hungary();
		
		public int select_country_Belgium();
		
		public int select_country_Czech_republic(); 
		
		public int select_country_Slovenian();
		
		public int select_country_USA();
		
		public int select_country_Canada();
		
		public int select_country_Mexico();
		
		public int select_country_Peru();
		
		public int select_country_Bolivia();
		
		public int select_country_Chile();
		
		public int select_country_Argentina();
		
		public int select_country_australia();
		
		public int select_country_New_zealand();
		
		public int select_country_Egypt();
		
		public int select_country_Republic_of_south_africa();
		
		public int select_country_Tanzania();
		
		public int select_country_Ethiopia();
		
		public int select_country_Kenya();
		
		public int select_country_Namibia();
		
		public int select_country_Morocco();  
		
		
		
		
		//대륙별 통계(모집 완료)
		
			public int select_continent_east_asia2();
			
			public int select_continent_southeast_asia2();
			
			public int select_continent_southwest_asia2();
			
			public int select_continent_europe2();
			
			public int select_continent_america2();
			
			public int select_continent_oceania2();
			
			public int select_continent_africa2();
			
			
			//나라별 통계(모집 완료)
			
			public int select_country_hongkong2();
			
			public int select_country_taiwan2();
			
			public int select_country_china2();
			
			public int select_country_mongolia2();
			
			public int select_country_korea2();
			
			public int select_country_japan2();   
			
			public int select_country_Singapore2();
			
			public int select_country_Vietnam2();
			
			public int select_country_Thailand2();
			
			public int select_country_Indonesia2();
			
			public int select_country_Malaysia2();
			
			public int select_country_Philippine2();
			
			public int select_country_Laos2();
			
			public int select_country_Cambodia2();
			
			public int select_country_Myanmar2();
			
			public int select_country_United_arab_emirates2();
			
			public int select_country_Oman2();
			
			public int select_country_India2();
			
			public int select_country_Nepal2();
			
			public int select_country_Israel2();
			
			public int select_country_catarrh2();
			
			public int select_country_france2();
			
			public int select_country_Italy2();
			
			public int select_country_turkey2();
			
			public int select_country_Spain2();
			
			public int select_country_uk2();
			
			public int select_country_Austria2();
			
			public int select_country_Netherlands2();
			
			public int select_country_Germany2();
			
			public int select_country_Swiss2();
			
			public int select_country_Portugal2();
			
			public int select_country_Poland2();
			
			public int select_country_Iceland2();
			
			public int select_country_Finland2();
			
			public int select_country_Sweden2();
			
			public int select_country_Norway2();  
			
			public int select_country_Denmark2();
			
			public int select_country_Greece2();
			
			public int select_country_russia2();
			
			public int select_country_Ireland2();
			
			public int select_country_Hungary2();
			
			public int select_country_Belgium2();
			
			public int select_country_Czech_republic2(); 
			
			public int select_country_Slovenian2();
			
			public int select_country_USA2();
			
			public int select_country_Canada2();
			
			public int select_country_Mexico2();
			
			public int select_country_Peru2();
			
			public int select_country_Bolivia2();
			
			public int select_country_Chile2();
			
			public int select_country_Argentina2();
			
			public int select_country_australia2();
			
			public int select_country_New_zealand2();
			
			public int select_country_Egypt2();
			
			public int select_country_Republic_of_south_africa2();
			
			public int select_country_Tanzania2();
			
			public int select_country_Ethiopia2();
			
			public int select_country_Kenya2();
			
			public int select_country_Namibia2();
			
			public int select_country_Morocco2();  
		
		
			public List<Map<String,String>> selectContryStat(Map<String, String> map);
			
			
			//평점 관리
			
			public List<UserinfoVO> select_rate_list();
	
	//아이디 찾기/ 최예나
	public String select_user_id(@Param("user_name") String user_name, @Param("user_email") String user_email);
}

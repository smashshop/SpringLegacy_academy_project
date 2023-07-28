package com.spring.tmz.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.tmz.domain.NoticeVO;
import com.spring.tmz.domain.Notice_fileVO;
import com.spring.tmz.domain.Notice_likeVO;
import com.spring.tmz.domain.Notice_pagingDTO;
import com.spring.tmz.domain.Notice_regionVO;
import com.spring.tmz.mapper.Notice_file_mapper;
import com.spring.tmz.mapper.Notice_mapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class Notice_service_impl implements Notice_service{

	private Notice_mapper notice_mapper ;
	
	
	private Notice_file_mapper notice_file_mapper ;
	
	//공지사항 목록 조회(페이징 고려)
		@Override
		public List<NoticeVO> get_notice_list (Notice_pagingDTO notice_pagingDTO){
			log.info("Notice_service.getNoticeList() 실행");
			return notice_mapper.select_notice_list(notice_pagingDTO);
		}
		
		
		//공지사항 글 등록 selectkey 이용
		@Transactional
		@Override
		public long register_notice_board(NoticeVO noticeVO) {
			
			log.info("notice_mapper.insert_notice()에 전달된 noticeVO:" +noticeVO );
			int ntc_no = notice_mapper.insert_notice(noticeVO);
			
			System.out.println("notice_serviece 에서 등록된 공지글의 ntc_no: "+ntc_no );
			
			//첨부파일 
			if (noticeVO.getNotice_file_list() == null || noticeVO.getNotice_file_list().size() <= 0) {
				return noticeVO.getNtc_no();
			}

	//첨부파일이 있는 경우, myBoard의 bno 값을 첨부파일 정보 VO에 저장 후, tbl_myAttachFiles 테이블에 입력

				noticeVO.getNotice_file_list().forEach(attachFile -> {
				attachFile.setNtc_no(noticeVO.getNtc_no());
				System.out.println(attachFile);
				notice_file_mapper.insert_notice_file(attachFile);
			});
			
			return noticeVO.getNtc_no();
		}

		//공지사항 특정 글 조회(조회수X)
		@Override
		public NoticeVO get_notice_detail_modify(long ntc_no) {
			
			return notice_mapper.search_notice(ntc_no);
		}
		
		
		//공지사항 게시물 삭제 요청
		@Override
		public boolean set_notice_delted(long ntc_no) {
			return notice_mapper.update_notice_delflag(ntc_no)==1;
		}
		

		//공지사항 게시물 실제 삭제
		@Override
		public boolean remove_notice(long ntc_no) {
			log.info("Notice_service.remove_notice()에 전달된 ntc_no: "+ ntc_no);
			notice_file_mapper.delete_notice_allfile(ntc_no);
			return notice_mapper.delete_notice(ntc_no)==1;
		}
		
		
		//공지사항 게시물 전체 삭제(요청1인거)
		@Override
		public int remove_all_notice() {
			return notice_mapper.delete_all_notice();
		}
		
		
		//공지사항 특정 글 수정
		@Override
		public boolean update_notice(NoticeVO noticeVO) {
			
			log.info("Notice_service.update_notice()에 전달된 noticeVO : "+ noticeVO);
			
			long ntc_no = noticeVO.getNtc_no();
			
			notice_file_mapper.delete_notice_allfile(ntc_no);
			
			boolean notice_modify_result = (notice_mapper.update_notice(noticeVO) ==1);
			
			if(notice_modify_result = noticeVO.getNotice_file_list() != null) {
									  noticeVO.getNotice_file_list().forEach(attachFile -> {
										  									 attachFile.setNtc_no(ntc_no);
									
									notice_file_mapper.insert_notice_file(attachFile);
				});
			}
			
			return notice_modify_result ;
		}
		
		//공지사항 총 게시글 조회(페이징할때 필요)
		@Override
		public long get_notice_total(Notice_pagingDTO notice_pagingDTO) {
			log.info("Notice_service.get_notice_total()에 전달된 Notice_pagingDTO: "+notice_pagingDTO );
			return notice_mapper.select_notice_rowamoun_total(notice_pagingDTO);
		}

		
		//공지글 첨부파일 조회
		@Override
		public List<Notice_fileVO> get_notice_file_ntcno(long ntc_no){
			log.info("Notice_service.get_notice_file_ntcno()에 전달된 ntc_no:" + ntc_no);
		    return notice_file_mapper.select_notice_file_no(ntc_no);
		   }

		
		//특정 공지사항 첨부파일 DB 삭제
		@Override
		public int delete_notice_file(String nuuid) {
			return notice_file_mapper.delete_notice_file(nuuid);
		}
		
		
		
		//DB에서 대륙 가져오기
		@Override
		public List<Notice_regionVO>select_notice_continent(){
			return notice_mapper.select_notice_continent();
			
		}
		
		
		//DB에서 나라이름 가져오기
		@Override
		public List<Notice_regionVO> select_notice_country(String continent_name){
			log.info("Notice_service.select_notice_country: ");
			return notice_mapper.select_notice_country(continent_name);
		}
		
		

		//공지사항 좋아요 눌렀을때
		@Transactional
		@Override
		public Integer insert_notice_like (Notice_likeVO notice_likeVO) {
			log.info("Notice_service.select_notice_country 좋아요 클릭: "+ notice_likeVO);
			 notice_mapper.insert_notice_like(notice_likeVO);
			 return notice_likeVO.getNtc_like_no();		//결과로 숫자가 나옴
		}
		
		
		//공지사항 좋아요 취소했을때
		@Override
		public Integer disable_notice_like (Notice_likeVO notice_likeVO) {
			int result = notice_mapper.disable_notice_like(notice_likeVO);
			return result;
		}
		
		
		//공지사항 좋아요 총 갯수 구하기
		@Override
		public int notice_like_total(Notice_likeVO notice_likeVO) {
			int result = notice_mapper.notice_like_total(notice_likeVO);
			return result;
		}
		
		
		//공지사항 좋아요 갯수 업데이트 -  어디가에선 ntc_like_cnt를 구해야함 
		@Override
		public int update_notice_like_check(Notice_likeVO notice_likeVO) {
			int ntc_like_cnt = notice_mapper.notice_like_total(notice_likeVO);
			int update_result =  notice_mapper.update_notice_like_check(ntc_like_cnt, notice_likeVO.getNtc_no());
			return update_result ;
			
		}
		
		//공지사항 좋아요 누른 사람 누구?
		@Override
		public List<Notice_likeVO> select_notice_like_user(Notice_likeVO notice_likeVO){
			return notice_mapper.select_notice_like_user(notice_likeVO);
			
		}
	
	
	
	
	
	
}

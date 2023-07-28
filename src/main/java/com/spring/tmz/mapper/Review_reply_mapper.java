package com.spring.tmz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.tmz.domain.Review_replyVO;
import com.spring.tmz.domain.Review_reply_pagingDTO;

public interface Review_reply_mapper {

	//1.특정 게시물에 대한 댓글 등록
		public long insert_review_reply_for_board(Review_replyVO review_replyVO);
		
	//2. 특정 댓글에 대한 답글 등록
		public long insert_review_reply_for_reply(Review_replyVO review_replyVO);
		
	//3. 특정 게시글에 대한 댓글, 답글 조회
		public Review_replyVO selectMyReply(@Param("rv_no") Long rv_no, @Param("rrepl_no") Long rrepl_no);
		
	//4. 특정 게시물에 대한 특정 댓글/답글 수정
		public int update_review_reply(Review_replyVO review_replyVO);
	
	//5. 특정 게시물에 대한 특정 댓글/답글 삭제
		public int delete_review_reply(@Param("rv_no") Long rv_no, @Param("rrepl_no") Long rrepl_no);
	
	//6. 특정 게시물에 대한 댓글 목록 조회
		public List<Review_replyVO> select_review_reply_list(@Param("review_reply_pagingDTO")Review_reply_pagingDTO review_reply_pagingDTO);
	
	//7. 특정 게시물의 댓글 총 개수 확인
		public int select_reply_total_by_rv_no(@Param("review_reply_pagingDTO")Review_reply_pagingDTO review_reply_pagingDTO);
		// 특정 게시물에 대한 모든 댓글 삭제(관리자) -- myreply.bno 컬럼의 F.K 에 ON DELETE CASCADE 를 사용하는
		// 경우, 필요 없음
		// public int deleteAllReply(@Param("bno") Long bno);
}

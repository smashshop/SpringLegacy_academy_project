<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@ include file = "../../templet/review-header.jsp"%>  
<%@ include file = "../../templet/review-like.jsp"%>   
<%@ include file = "../../templet/review_button.jsp"%>

<header>
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
</header>

<div id="page-wrapper">
<div class="col-md-12 grid-margin stretch-card my-4">
   <div class="card pb-5">
      <!-- <div class="img_wrapper my-4" style="border-radius : 30px; width: 100%; height: 350px;">

      </div> -->

         <!--    <div class="d-flex flex-row justify-content-between">
               <h1 class="card-title mb-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 공지사항</h1>
            </div> -->
       
	
	<form role="form">
      <div class="row mx-5 mt-3"
         style="border: 1px solid gray; border-radius: 20px;">
         <div class="card-body col-12 px-5">

        <div class="col-lg-12">
        <input class="form-control" name="rv_title" readonly="readonly" style="position : relative; top : 20px; font-size: 30px; background-color:transparent; border: 0 solid;"   value='제목 <c:out value="${review.rv_title }" />'>
        </div>
        
        <!--좋아요 검사 하기전에 기본 변수 값 설정  -->
        <sec:authorize access="isAuthenticated()">
	 <sec:authentication property="principal" var="principal"/>  
	 	<c:set var="review_like" value="false"/>    
       <c:if test="${like_list.size() > 0}">
       <c:forEach begin="0" end="${like_list.size()-1}" var="i">
          <c:if test="${not review_like}">
             <c:if test="${principal.username eq like_list[i].user_id}">
                <c:set var="review_like" value="true"/>
             </c:if>
          </c:if>   
       </c:forEach>
       </c:if>
      	   
        
		<!--좋아요 버튼 안누른 사람일때  -->
		<c:if test="${not review_like}"> 
       <!-- 좋아요 버튼 -->
       <div class="col-lg-2" style="display: inline-block;">      
       <input type="checkbox" class="checkbox" id="checkbox" name="review_like1"/> <label for="checkbox"> <svg id="heart-svg"
                     viewBox="467 360 58 57" xmlns="http://www.w3.org/2000/svg">
        <g id="Group" fill="none" fill-rule="evenodd"
                        transform="translate(467 392)">
          <path
                        d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                        id="heart" fill="#AAB8C2" />
          <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5"
                        cy="29.5" r="1.5" />

          <g id="heartgroup7" opacity="0" transform="translate(7 6)">
            <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2" />
            <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2" />
          </g>

          <g id="heartgroup6" opacity="0" transform="translate(0 28)">
            <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2" />
            <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2" />
          </g>

          <g id="heartgroup3" opacity="0" transform="translate(52 28)">
            <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2" />
            <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2" />
          </g>

          <g id="heartgroup2" opacity="0" transform="translate(44 6)">
            <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2" />
            <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2" />
          </g>

          <g id="heartgroup5" opacity="0" transform="translate(14 50)">
            <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2" />
            <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2" />
          </g>

          <g id="heartgroup4" opacity="0" transform="translate(35 50)">
            <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2" />
            <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2" />
          </g>

          <g id="heartgroup1" opacity="0" transform="translate(24)">
            <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
            <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
          </g>
        </g>
      </svg>
   </label>
		</div>
		</c:if>
		
       
            
	            
	 <c:if test="${review_like}">
	 <div class="col-lg-2" style="display: inline-block;">      
	       <input type="checkbox" class="checkbox" id="checkbox" checked="checked" name="review_like2"/> <label for="checkbox"> <svg id="heart-svg"
	                     viewBox="467 360 58 57" xmlns="http://www.w3.org/2000/svg">
	        <g id="Group" fill="none" fill-rule="evenodd"
	            transform="translate(467 392)">
	          <path
	         d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
	         id="heart" fill="#AAB8C2" />
	          <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5"
	                        cy="29.5" r="1.5" />
	
	          <g id="heartgroup7" opacity="0" transform="translate(7 6)">
	            <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2" />
	            <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2" />
	          </g>
	
	          <g id="heartgroup6" opacity="0" transform="translate(0 28)">
	            <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2" />
	            <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2" />
	          </g>
	
	          <g id="heartgroup3" opacity="0" transform="translate(52 28)">
	            <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2" />
	            <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2" />
	          </g>
	
	          <g id="heartgroup2" opacity="0" transform="translate(44 6)">
	            <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2" />
	            <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2" />
	          </g>
	
	          <g id="heartgroup5" opacity="0" transform="translate(14 50)">
	            <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2" />
	            <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2" />
	          </g>
	
	          <g id="heartgroup4" opacity="0" transform="translate(35 50)">
	            <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2" />
	            <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2" />
	          </g>
	
	          <g id="heartgroup1" opacity="0" transform="translate(24)">
	            <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
	            <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
	          </g>
	        </g>
	      </svg>
	   </label>
			</div>
			</c:if>
			</sec:authorize>
		
		
		
        
          <div class="card-body col-12">
        
         
        <div style="width:100%;"><br>
        <!--좋아요 갯수 표시  -->
            <div id="like_status">
            현재 좋아요 개수 :<c:out value="${review_total.rv_like_cnt}"/>
            </div>
        <div style="width:300px; float:left;">방문한 장소:&nbsp;&nbsp;&nbsp;<c:out value="${review.rv_continent}"/>&nbsp;&nbsp; - &nbsp;&nbsp;<c:out value=" ${review.rv_country}"/></div>
        <div style="width:300px; text-align:right; float:right;"><fmt:formatDate pattern="yyyy-MM-dd" value="${review.rv_moddate}" /> &nbsp;&nbsp; 작성자 <c:out value="${review.rv_writer}"/></div>
           <br><hr style="background-color:#2A3038;height: 1px">
      </div>
     <button  class="btn btn-inverse-warning btn-fw float-right" type="button" id="sh-link">
         <i class="mdi mdi-clippy"></i>URL복사</button>
      </div>
        <%-- /.col-lg-12 --%>
  
		
               <div class="col-12">
                  <div class="preview-list">
                     <div class="form-group">
                     <h4 class="card-title mb-1"></h4><!-- <hr style="background-color:#2A3038;height: 1px "> -->
                           <textarea class="form-control" rows="5" name="rv_content" style="resize: none; font-size: 20px; background-color:transparent; border: 0 solid;" 
                           readonly="readonly" >후기 내용:&nbsp;&nbsp;<c:out value="${review.rv_content }"/></textarea><br><br>
                     </div>
                     
                   <!-- 첨부파일 표시 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

							
						<div class="panel-heading">파일첨부</div>
						<%--수정--%>
						<div class="panel-body">
							<div class="form-group file_upload_result">
								<%--첨부파일 목록 표시 div--%>
								<%--div 전체 내용 추가--%>
								<ul>
									<%-- 첨부파일 목록이 표시될 영역 --%>
								</ul>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="mt-5 mb-4 col-12">
         
            <div class="float-right mr-3">
            
            
        	  <sec:authorize access="isAuthenticated()" >
 				 <sec:authentication property="principal" var="principal"/> 
 					<c:if test="${principal.username eq review.rv_writer}"> 
        		
		               <button type="button" id="review_modify_button"
		                  class="custom-btn btn-7">
		                  <span><i class="mdi mdi-border-color"></i>수정</span>
		               </button>
               		</c:if>
               	</sec:authorize>
               
               <button type="button" id="review_list_button"
                  class="custom-btn btn-3">
                  <span><i class="mdi mdi-file-check btn-icon-prepend"></i>목록</span>
               </button>
                             
            </div>
         </div>
                     </div>
                  </div>
               </div>
             </div>
                </form>
                <div class="row mx-5 mt-3"  style="border: 1px solid gray; border-radius: 20px; text-align: left;">
				<div class="col-lg-12" style="text-align:left">
					<div class="panel panel-default">
						<div class="panel-heading">
							<p style="margin-bottom: 0px; font-size: 16px;">
							<br>
								<strong style="padding-top: 2px;text-align: left;"> <span>댓글&nbsp;<c:out
											value="${review.rv_replcnt}" />개
								</span> 
								<sec:authorize access="isAuthenticated()" >
								<span>&nbsp;</span>
									<button type="button" id="btn_chg_cmt_reg" class="btn btn-outline-info btn-sm">댓글 작성</button>
								</sec:authorize>	
									<button type="button" id="btn_reg_cmt" class="btn btn-outline-primary btn-sm" style="display: none">댓글 등록</button>
									<button type="button" id="btn_cancel_reg_cmt" class="btn btn-outline-warning btn-sm" style="display: none">취소</button>
								</strong>
							</p>
						</div>
						<%-- /.panel-heading --%>
						<!-- <div class="panel-body"> -->
							<%-- 댓글 입력창 div 시작 --%>
							<sec:authorize access="isAuthenticated()" ><!-- 추가: 댓글 입력창, 로그인 사용자일 때만 표시 -->
							<div class="form-group" style="margin-bottom: 5px;">
								<textarea class="form-control txt_box_cmt" name="rrepl_content"
									placeholder="댓글작성을 원하시면,&#10;댓글 작성 버튼을 클릭해주세요."
									readonly="readonly" style="color:white; text-align: left;"></textarea>
							</div><%-- 댓글 입력창 div 끝 --%>
							<hr style="margin-top: 10px; margin-bottom: 10px;">
							</sec:authorize>							
							<ul class="chat">
								<li class="left clearfix comment_li" data-rv_no="123456"
									data-rrepl_no="12">
									<div>
										<div style="text-align: left;">
											<span class="header info-rrepl_writer"> <strong
												class="primary-font">user00</strong> <span>&nbsp;</span> <small
												class="text-muted">2018-01-01 13:13</small>
											</span>
											<p>앞으로 사용할 댓글 표시 기본 템플릿입니다.</p>
										</div>
										<div class="btns_comment" style="margin-bottom: 10px; text-align: left;">
											<button type="button" style="display: in-block"
												class="btn btn-outline-success btn-fw "><span>답글 작성</span></button>
											<button type="button" style="display: none"
												class="btn btn-warning btn-xs btn_reg_reply">답글 등록</button>
											<hr class="txtBoxCmtHr"
												style="margin-top: 10px; margin-bottom: 10px">
											<textarea class="form-control txt_box_cmt_mod" name="rrepl_content"
												style="margin-bottom: 10px"
												placeholder="답글작성을 원하시면,&#10;답글 작성 버튼을 클릭해주세요."></textarea>
										</div>
									</div>
								</li>
							</ul>
							<%-- /.chat --%>
						 </div> 
						<%-- /.panel-body --%>
						<div class="panel-footer text-center" id="show_cmt_paging_nums">
							<%-- 댓글 목록의 페이징 번호 표시 영역 - JavaScript 로 내용이 생성되어 표시됩니다.--%>
						</div>
					</div>
					<%-- /.panel --%>
				</div>
				<%-- .col-lg-12 --%>
		 	</div> 
			<%-- .row : 댓글 화면 표시 끝 --%>
            </div>
         
      
         
      </div>
	<%-- 첨부파일 이미지 표시 Modal 시작 --%>
		<div class="modal fade" id="review_modal" tabindex="-1" role="dialog"
			aria-labelledby="yourModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">
					<%-- modal-header와 modal-footer DIV는 주석처리 또는 삭제합니다. --%>
					<%--
					 <div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					 <h4 class="modal-title" id="yourModalLabel">이미지 표시</h4>
					 </div> --%>
					<div class="modal-body">
						<%-- 이미지 표시 --%>
					</div>
					<%--
					 <div class="modal-footer">
					 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					 </div> --%>
				</div>
				<%-- /.modal-content --%>
			</div>
			<%-- /.modal-dialog --%>
		</div>
		<%-- /.modal --%>
			
			<form name="review_send" id="review_send">
				<input type="hidden" name="rv_no" id="rv_no" value='<c:out value="${review.rv_no }"/>'> 
				<input type="hidden" name="review_page_num" value='${review_pagingDTO.review_page_num}'> 
				<input type="hidden" name="review_page_row_amount_per_page" value='${review_pagingDTO.review_page_row_amount_per_page }'> 
				<input type='hidden' name='review_scope' value='${review_pagingDTO.review_scope}'>
				<input type='hidden' name='review_keyword' value='${review_pagingDTO.review_keyword}'>
			</form>
		 
			
			<%-- 댓글 페이징 데이터 저장 form --%>
		<form id="frm_cmt_paging_value">
			<input type='hidden' name='page_num' value='' /> 
			<input type='hidden' name='review_reply_row_amount_per_page' value='' />
		</form>
		</div>
<!-- URL복사 -->
	<script>
	
	$(document).on("click", "#sh-link", function(e) {
	    // 링크복사 시 화면 크기 고정
	    $('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no');
	    var html = "<input id='clip_review_target' type='text' value='' style='position:absolute;top:-9999em;'/>";
	    $(this).append(html);
	
	    var input_review_clip = document.getElementById("clip_review_target");    
	   //현재 url 가져오기
	   var _url = $(location).attr('href'); 
	    $("#clip_review_target").val(_url);
	
	    if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) {
	
	        var editable = input_review_clip.contentEditable;
	        var readOnly = input_review_clip.readOnly;
	
	        input_review_clip.contentEditable = true;
	        input_review_clip.readOnly = false;
	
	        var range = document.createRange();
	        range.selectNodeContents(input_review_clip);
	
	        var selection = window.getSelection();
	        selection.removeAllRanges();
	        selection.addRange(range);
	        input_review_clip.setSelectionRange(0, 999999);
	
	        input_review_clip.contentEditable = editable;
	        input_review_clip.readOnly = readOnly;
	    } else {
	       input_review_clip.select();
	    }
	    try {
	        var successful = document.execCommand('copy');
	        input_review_clip.blur();
	        if (successful) {
	            alert("URL이 복사 되었습니다. 원하시는 곳에 붙여넣기 해 주세요.");
	            // 링크복사 시 화면 크기 고정
	            $('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes');
	        } else {
	            alert('이 브라우저는 지원하지 않습니다.');
	        }
	    } catch (err) {
	        alert('이 브라우저는 지원하지 않습니다.');
	    }
	}); //클립보드 복사


</script>
<!--댓글처리 자바스크립트 시작  -->
	<script>
	
	
	var login_user = "";
	<sec:authorize access="isAuthenticated()">
	login_user = '<sec:authentication property="principal.username"/>';<%--로그인 사용자명 변수에 저장--%>
	</sec:authorize>
	<%-- HTML에서 일어나는 모든 Ajax 전송 요청에 대하여 csrf 토큰값이 요청 헤더에 설정됨 --%>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	console.log("csrfHeaderName: "+ csrfHeaderName);
	console.log("csrfTokenValue: "+ csrfTokenValue);
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	</script>
	<script type="text/javascript"
		src="${contextPath}/resources/js/mycomment.js"></script>

	<script>
	
	//게시물 번호 저장
			var rv_no_value = '<c:out value="${review.rv_no}"/>';
				
			//댓글 목록 표시 함수	
			var comment_UL = $(".chat");
			var frm_cmt_paging_value = $("#frm_cmt_paging_value");
				//댓글 목록표시 함수 선언: ajax 클로저 모듈 함수를 호출함
			function show_cmt_list(page){
				
					//댓글 목록 데이터를 요청하는 클로저 모듈 함수 호출
				 comment_clsr.get_cmt_list(
				 	{rv_no: rv_no_value, page: page || 1 },
				 	function(reply_paging_creator) { //ajax에서 실행할 callback 함수
				 		console.log("서버로부터 전달된 page_num(reply_paging_creator.review_reply_pagingDTO.review_reply_page_num): "
			 				+ reply_paging_creator.review_reply_pagingDTO.review_reply_page_num);
				 		frm_cmt_paging_value.find("input[name='page_num']")
								  .val(reply_paging_creator.review_reply_pagingDTO.review_reply_page_num);
				 
				 console.log("폼에 저장된 페이징번호 review_page_num(): "
							 + frm_cmt_paging_value.find("input[name='page_num']").val());
				 var str="";
				 
				 //댓글이 없으면, if 문의 블록이 실행되고, 함수 실행이 중지됨(return), 따라서, for문 실행 않됨
				 if( (! reply_paging_creator.reply_list) || (reply_paging_creator.reply_list.length == 0) ){
					 str += '<li class="left clearfix comment_li" '
						 + ' style="text-align: left; background-color: transparent; color:white;'
						 + ' height: 35px;margin-bottom: 0px;padding-bottom:0px;'
						 + ' padding-top:6px;border: 1px dotted;">'
						 + ' <strong>등록된 댓글이 없습니다.</strong></li>';
						 comment_UL.html(str);
					 return;
				 }
				 
				//답글 표시 for문(<ul></ul>내에 아래의 li 요소들이 for문에 의해서 생성되어 표시됨)
				for (var i = 0, len = reply_paging_creator.reply_list.length; i < len; i++) {
					 str +='<li style="list-style-type : none;text-align: left;"  class="left clearfix comment_li" data-rv_no="' + rv_no_value
						 + '" data-rrepl_no="'+reply_paging_creator.reply_list[i].rrepl_no+'">'
						 + ' <div>';
				//댓글에 대한 답글 들여쓰기
				 if(reply_paging_creator.reply_list[i].rrepl_lvl == 1){//댓글 들여쓰기 안함
					 str +=' <div>';
				 } else if (reply_paging_creator.reply_list[i].rrepl_lvl == 2){//답글 들여쓰기
					 str +=' <div style="padding-left:25px">';
				 } else if (reply_paging_creator.reply_list[i].rrepl_lvl == 3){//답글의 답글 들여쓰기
				 	str +=' <div style="padding-left:50px">';
				 } else if (reply_paging_creator.reply_list[i].rrepl_lvl == 4){//답글의 답글 들여쓰기
					 str +=' <div style="padding-left:75px">';
				 } else {//답글의 레벨이 5이상이면 동일한 들여쓰기
					 str +=' <div style="padding-left:100px">';
				 } 
					 str +=' <span class="header info-rrepl_writer">'
				 		+ ' <strong class="primary-font">';
				 if(reply_paging_creator.reply_list[i].rrepl_lvl > 1){//답글인 경우, 앞에 아이콘 표시
					 str +='<div><i class="mdi mdi-subdirectory-arrow-right"></i>&nbsp;';
				 }
					 str += reply_paging_creator.reply_list[i].rrepl_writer 
						 + ' </strong>'
						 + ' <span>&nbsp;</span>'
						 + ' <small class="text-muted">수정일:'
						 + comment_clsr.show_datetime(reply_paging_creator.reply_list[i].rrepl_moddate) //수정날짜가 정수값으로 표시됨
						 + ' </small>';
				 if(reply_paging_creator.reply_list[i].rrepl_lvl > 1){ //답글인 경우, 답글을 표시
				 	str +=' <small>&nbsp; 답글</small>';
				 }
				 	 str +=' </span>'
						 + ' <p data-rv_no=' + reply_paging_creator.reply_list[i].rv_no
						 + ' data-rrepl_no=' + reply_paging_creator.reply_list[i].rrepl_no
						 + ' data-rrepl_writer=' + reply_paging_creator.reply_list[i].rrepl_writer
						 + ' >' + reply_paging_creator.reply_list[i].rrepl_content + '</p>'
						 + ' </div>';
						 <%-- 추가: 답글추가 버튼, 로그인 사용자일 때만 표시 --%>
						 <sec:authorize access="isAuthenticated()" >
					 str +=' <div class="btns_reply" style="margin-bottom:10px">'
						 + ' <button type="button" style="display:in-block" '
						 + ' class="btn btn-outline-success btn-sm btn_chg_reg">'
						 + ' <span>답글 작성</span></button>'
						 + ' </div>';
						 </sec:authorize>
					 str +=' </div>'
						 + '</li>';
				}//for-End
					 //UL 태그 내에 HTML 내용 표시
				 	comment_UL.html(str); //html() 사용 시, 새로운 내용으로 교체.
				 	
				 	show_cmt_paging_nums(reply_paging_creator.review_reply_pagingDTO.review_reply_page_num,
				 			reply_paging_creator.reply_start_paging_num,
				 			reply_paging_creator.reply_end_paging_num,
				 			reply_paging_creator.reply_prev,
				 			reply_paging_creator.reply_next,
				 			reply_paging_creator.reply_last_page_num);

					 //commentUL.append(str); //append 사용 시, 기존 내용 밑에 새로운 내용 추가 (페이징 대신 사용).
				 }//.end callback 매개변수의 익명 함수
				 );//.end myCommentClsr.getCmtList
				}//.end showCmtList
		
				//댓글 목록에 표시할 페이징번호 생성 함수: replyPagingCreator로 부터 받아온 값들을 이용
				function show_cmt_paging_nums(review_reply_page_num, reply_start_paging_num, reply_end_paging_num, reply_prev, reply_next, reply_last_page_num ) {
				 	if(reply_end_paging_num >= reply_last_page_num){ 
				 		reply_end_paging_num = reply_last_page_num;
								 }
				 var str = "<ul class='pagination pagination-sm'>";
						 //맨 앞으로
						 if(reply_prev){
								 str +=" <li class='page-item'>"
								 + " <a class='page-link' href='"+1+"'>"
								 + " <span aria-hidden='true'>&laquo;</span>"
								 + " </a>"
								 + " </li>";
								 }
						 //이전 페이지
						 if(reply_prev){
								 str +=" <li class='page-item'>"
								 + " <a class='page-link' href='"+(reply_start_paging_num -1)+"'>이전</a>"
								 + " </li>";
						 }
				 //선택된 페이지 번호 Bootstrap의 색상표시
				 for(var i = reply_start_paging_num ; i <= reply_end_paging_num; i++){
				 //active는 Bootstrap 클래스 이름
				 var active = ( ( review_reply_page_num == i ) ? "active" : "" );
						 str +=" <li class='page-item "+active+"'>"
						 + " <a class='page-link' href='"+i+"'>"+i+"</a>"
						 + " </li>";
						 }
				 
				 if(reply_next){
						 str +=" <li class='page-item'>"
						 + " <a class='page-link' href='"+(reply_end_paging_num + 1)+"'>다음</a>"
						 + " </li>";
						 }
				 
				 //맨 마지막으로
				 if(reply_next){
						 str +=" <li class='page-item'>"
						 + " <a class='page-link' href='"+(reply_last_page_num)+"'>&raquo;</a>"
						 + " </li>";
						 }
				 str +="</ul>";
				 $("#show_cmt_paging_nums").html(str); //#showCmtPagingNums div에 표시
				}//showCmtPagingNums종료
				//선택된 페이징 번호의 게시물목록 가져오는 함수: 이벤트 전파 이용
				$("#show_cmt_paging_nums").on("click", "ul li a", function(e) {
					e.preventDefault();
					var target_pagenum = $(this).attr("href");
					console.log("target_pagenum: " + target_pagenum);
					show_cmt_list(target_pagenum);
				});
				<%--댓글 추가 요소 초기화 함수 --%>
				function chg_before_cmt_btn() {
					$("#btn_chg_cmt_reg").attr("style", "display:in-block");
					$("#btn_reg_cmt").attr("style", "display:none");
					$("#btn_cancel_reg_cmt").attr("style", "display:none");
					$(".txt_box_cmt").val("");
					$(".txt_box_cmt").attr("readonly", true);
				}
				<%--댓글 작성 버튼 클릭 - 댓글 등록 버튼으로 변경, 댓글 입력창 활성화--%>
				$("#btn_chg_cmt_reg").on("click", function() {
					chg_before_cmt_rep_btns();
					chg_before_cmt_btn();
					chg_before_reply_btn();
					$(this).attr("style", "display:none");
					$("#btn_reg_cmt").attr("style", "display:in-block;margin-right:2px; text-align: left;");
					$("#btn_cancel_reg_cmt").attr("style", "display:in-block");
					$(".txt_box_cmt").attr("readonly", false);
				});
			<%--댓글등록 취소 클릭 --%>
				$("#btn_cancel_reg_cmt").on("click", function() {
					if (!confirm("댓글 입력을 취소하시겠습니까?")) {
						return;
					}
					chg_before_cmt_btn();
				});
			<%--댓글등록 버튼 클릭 이벤트 처리 --%>
				$("#btn_reg_cmt").on("click", function() {
					//로그인 유무 검증
					 if(!login_user){
						 alert("로그인 후, 등록이 가능합니다.");
						 return ;
					 } 
					 console.log("댓글등록 시 login_user: "+ login_user);
					
					var txt_box_cmt = $(".txt_box_cmt").val();
					var comment = {
						rv_no : rv_no_value,
						rrepl_content : txt_box_cmt,
						rrepl_writer : login_user
					};
					console.log("댓글등록: 서버전송 객체내용: " + comment);
		
					comment_clsr.register_cmt(
							comment,
							function(serverResult){
								$(".txt_box_cmt").val("");
								chg_before_cmt_btn();

								alert("댓글 등록이 성공했습니다.");
								
								show_cmt_list(-1);					
							},//성공시 실행할 callback함수
							function(serverResult){
								alert(serverResult);
								
								showCmtList(1);
								
							}//실패시 실행할 error함수
						); //myCommentClsr.registerCmt-end
						});
					<%--답글 관련 화면 상태 초기화--%>
					function chg_before_reply_btn() {
						$(".btn_reg_reply").remove();
						$(".btn_cancel_reg_reply").remove();
						$(".txt_box_reply").remove();
						$(".btn_chg_reply_reg").attr("style", "display:in-block; text-align: left;");
					}
					<%--답글 작성 버튼 클릭 이벤트--%>
					<%--JSP 코드에 없는 생성된 요소, 이벤트 전파 사용 --%>
					$(".chat").on("click",".comment_li .btn_chg_reg",function() {
										$("p").attr("style", "display:in-block;");
										chg_before_cmt_btn();
										chg_before_reply_btn();
										chg_before_cmt_rep_btns();
										<%--로그인 하지 않은 경우--%>
										 if(!login_user){
										 alert("로그인 후, 수정이 가능합니다.");
										 return ;
										 } 
										 console.log("답글 등록 시 login_user: "+ login_user);
										 <%--작성자 변수에 저장--%>
										 var rrepl_writer = $(this).data("rrepl_writer");
										 console.log("rrepl_writer: " + rrepl_writer);
										 console.log("login_user: " + login_user);
										 <%--로그인 계정과 작성자가 다른 경우--%>
										 /* if(rrepl_writer != login_user){
										 alert("작성자만 수정 가능합니다");
										 return ;
										 } */
						var str_txt_box_reply = "<textarea class='form-control txt_box_reply' name='rrepl_content' style='margin-bottom:10px;text-align: left;'"
						 + " placeholder='답글작성을 원하시면, &#10;답글 작성 버튼을 클릭해주세요.'"
						 + "></textarea>"
						 + "<button type='button' class='btn btn-outline-warning btn-xs btn_reg_reply'>답글 등록</button>"
						 + "<button type='button' class='btn btn-outline-danger btn-xs btn_cancel_reg_reply'"
						 + " style='margin-left:4px;'>취소</button>";
						$(this).after(str_txt_box_reply);
						$(this).attr("style", "display:none"); //답글 작성 버튼 감춤
									})
				<%--답글등록 취소 클릭--%>
					$(".chat").on("click", ".comment_li .btn_cancel_reg_reply", function() {
						if (!confirm("답글 입력을 취소하시겠습니까?")) {
							return;
						}
						chg_before_reply_btn();
					});
				<%--답글 등록 버튼 클릭 이벤트 처리: 답글이 달린 댓글이 있는 페이지 표시--%>
					$(".chat").on("click",".comment_li .btn_reg_reply",function() {
						var login_user = "test8";
						var review_page_num = frm_cmt_paging_value.find(
								"input[name='review_page_num']").val();
						console.log("답글 추가가 발생된 댓글 페이지 번호: " + review_page_num);

						var txt_box_reply = $(this).prev().val();
						console.log("txt_box_reply: " + txt_box_reply);

						var rrepl_pno_val = $(this).closest("li").data("rrepl_no");
						console.log("rrepl_pno_val: " + rrepl_pno_val);

						var reply = {
							rv_no : rv_no_value,
							rrepl_content : txt_box_reply,
							rrepl_writer : login_user,
							rrepl_pno : rrepl_pno_val
						};

						console.log("답글등록: 서버전송 객체내용: " + reply);

						comment_clsr.register_review_reply(reply, function(serverResult) {
							alert("답글이 등록되었습니다");
							show_cmt_list(review_page_num);
				<%--댓글이 추가된 페이지 표시--%>
					});
							})
							
				<%--댓글/답글 수정-삭제-취소-입력창 삭제 함수--%>
					function chg_before_cmt_rep_btns(){
						 $("p").attr("style","display:in-block;");
						 //답글처리관련버튼
						 $(".btn_mod_cmt").remove();
						 $(".btn_del_cmt").remove();
						 $(".btn_cancel_cmt").remove();
						 $(".txt_box_mod").remove();
					}
				<%--댓글-답글 수정/삭제 화면 요소 표시: p 태그 클릭 이벤트 --%>
				$(".chat").on("click", ".comment_li p", function(){
					chg_before_cmt_btn();<%--댓글 등록 상태 초기화--%>
					chg_before_reply_btn()<%--다른 답글 등록 상태 초기화--%>
					 chg_before_cmt_rep_btns(); <%--다른 답글/댓글 수정 상태 초기화--%>
					 $(this).parents("li").find(".btn_chg_reply_reg").attr("style", "display:none");
					 var rrepl_content = $(this).text();
					 console.log("선택된 댓글내용: " + rrepl_content);
					 var str_txt_box_reply =
						 "<textarea class='form-control txt_box_mod' name='rrepl_content' style='margin-bottom:10px;'"
						 + " placeholder='답글작성을 원하시면,&#10;답글 작성 버튼을 클릭해주세요.'"
						 + "></textarea>"
						 + "<button type='button' class='btn btn-outline-warning btn-sm btn_mod_cmt'>수정</button> "
						 + "<button type='button' class='btn btn-outline-danger btn-sm btn_del_cmt'>삭제</button>"
						 + "<button type='button' class='btn btn-outline-info btn-sm btn_cancel_cmt' style='margin-left: 4px;'>취소</button>";
					 
				 $(this).after(str_txt_box_reply);
				 $(".txt_box_mod").val(rrepl_content);
				 $(this).attr("style", "display:none");
				});
				<%--댓글-답글 수정/삭제의 취소 버튼 클릭 이벤트 --%>
					$(".chat").on("click", ".comment_li .btn_cancel_cmt", function(){
						chg_before_cmt_btn();
						chg_before_reply_btn();
						 chg_before_cmt_rep_btns();
					});
				<%-- 댓글-답글 수정 처리: 수정 버튼 클릭 이벤트 --%>
				$(".chat").on("click", ".comment_li .btn_mod_cmt", function(){
				 	<%--작성자 변수에 저장--%>
						 var rrepl_writer_val = $(this).siblings("p").data("rrepl_writer");
						 var page_num = frm_cmt_paging_value.find("input[name='page_num']").val();
						 console.log("댓글/답글 수정이 페이지 번호: "+ page_num);
						 
						 var txt_box_comment = $(this).prev().val();
						 console.log("txt_box_comment: " + txt_box_comment);
						 
						 var rrepl_no_val = $(this).closest("li").data("rrepl_no");
						 console.log("rrepl_no_val: " + rrepl_no_val);
						 
						 var comment = { rv_no: rv_no_value,
						 rrepl_no: rrepl_no_val,
						 rrepl_content: txt_box_comment,
						 rrepl_writer: rrepl_writer_val };
						 
						 console.log("답글등록: 서버전송 객체내용: " + comment);
						 
						 comment_clsr.modify_cmt_reply(
						 comment,
						 function(serverResult){
						 	alert("수정되었습니다");
				 
						 	show_cmt_list(review_page_num); <%-- 답글이 추가된 페이지 표시 --%>
						 } 
						 );
						});
				<%--댓글-답글 삭제 처리: 삭제 버튼 클릭 이벤트 --%>
						$(".chat").on("click", ".comment_li .btn_del_cmt", function(){
							<%--로그인 하지 않은 경우--%>
							 if(!login_user){
							 alert("로그인 후, 삭제가 가능합니다.");
							 return ;
							 }
					 
					 <%--작성자 변수에 저장--%>
						 var rrepl_writer_val = $(this).siblings("p").data("rrepl_writer");
							 console.log("rrepl_writer_val: " + rrepl_writer_val);
							 console.log("login_user: " + login_user);
						 <%--로그인 계정과 작성자가 다른 경우--%>
						 if(rrepl_writer_val != login_user){
							 alert("작성자만 삭제 가능합니다");
							 return ;
						 }
						 var del_confirm = confirm('삭제하시겠습니까?');
							 if(!del_confirm){
								 alert('삭제가 취소되었습니다.');
								 return ;
						 }
						 var review_page_num = frm_cmt_paging_value.find("input[name='review_page_num']").val();
						 console.log("답글 삭제가 발생된 댓글 페이지 번호: "+ review_page_num);
						 var rrepl_no_val = $(this).closest("li").data("rrepl_no");
						 console.log("rrepl_no_val: " + rrepl_no_val);
						 var my_comment = { rv_no: rv_no_value,
						 rrepl_no: rrepl_no_val,
						 rrepl_writer: rrepl_writer_val };
						 console.log("답글삭제: 서버전송 객체내용: " + my_comment);
						 comment_clsr.remove_cmt_reply(
						 my_comment,
						 function(serverResult){<%--서버에서 댓글저장 성공 시, 브라우저에서 실행될 콜백함수--%> 
						 alert("삭제되었습니다.");
						 show_cmt_list(review_page_num); 
						 }
							 );
							});
	//첨부파일 li 클릭 이벤트 처리: 첨부파일 다운로드//원본 이미지 표시(새로 추가)
	$(".file_upload_result ul").on("click","li", function(e){
	    var objLi = $(this);
	    var downloaded_path_file_name = encodeURIComponent(objLi.data("review_repo_path") + "/" + objLi.data("ruploadpath") + "/" + 
	    objLi.data("ruuid")+"_" + objLi.data("rfilename"));
	       if(objLi.data("rfiletype") == "I"){
	       //이미지파일일 경우, 원본이미지를 다운로드 하여 결과표시 영역에 표시
	       $(".modal-body").html("<img src='${contextPath}/file_download_ajax?fileName=" +
   		   downloaded_path_file_name.replace(new RegExp(/\\/g),"/") + "'" + 
	       " width='100%' height='100%' >");
	 
	       $("#review_modal").modal("show");
	       } else { // else if(objLi.data("filetype") == "F") {
	       //이미지가 이닐 경우, 다운로드 수행
	       self.location ="${contextPath}/file_download_ajax?fileName=" + downloaded_path_file_name ;
	       } 
	      });
	//이미지 표시 모달 감추기
	   $(".modal").on("click", function(e){
	   $(".modal").modal("hide");
	   });
	//수정버튼이랑 목록버튼 클릭 이벤트 처리
    var review_send = $("#review_send");

    $("#review_list_button").on("click", function() { // 목록 버튼 클릭시
     	review_send.find("rv_no").remove();
     	/* review_send.find("review_scope").remove();
     	review_send.find("review_keyword").remove(); */
     	review_send.attr("method", "get");
    	review_send.attr("action", "${contextPath}/review/review-list");
    	review_send.submit();
    });

    $("#review_modify_button").on("click", function() {
    	review_send.attr("method", "get");
    	review_send.attr("action", "${contextPath}/review/review-modify");
    	review_send.submit();
    });
    <%-- 첨부파일 처리 JS --%>
	//업로드 후, 첨부파일 정보 표시 함수
	var rv_no_value = '<c:out value="${review.rv_no}"/>';
	function show_uploaded_files(upload_result) {
	 	console.log("show_uploaded_files 실행: 화면 표시 시작=======================================");
	 	//서버로부터 전달된 파일업로드 결과내용이 없으면, 함수 종료.
	 	if(!upload_result || upload_result.length == 0){
	 		return ;
	 		} 
		 var file_upload_result = $(".file_upload_result ul");
		 var str = "";
		 //전달받은 배열형식 데이터 각각에 대하여
	 	$(upload_result).each(function(i, obj) {
			 if (obj.rfiletype=="F") { //이미지가 아닌 경우, 아이콘 이미지 및 원본 파일이름 표시
				 var called_path_file_name = encodeURIComponent( obj.repoPath + "/" + obj.uploadPath + "/" + //주석처리
				  obj.uuid + "_" + obj.fileName ); //주석처리
				 //console.log("호출된 파일이름: " + calledPathFileName); //주석처리
				
				 //아래의 li 태그를 다음처럼 수정: data-* 속성들 추가
						 str += "<li data-review_repo_path='" + obj.review_repo_path + "'"
						 + " data-ruploadpath='" + obj.ruploadpath + "'"
						 + " data-ruuid='" + obj.ruuid + "'"
						 + " data-rfilename='" + obj.rfilename + "'"
						 + " data-rfiletype='" + obj.rfiletype + "' >"
						 //+ " <a href='${contextPath}/fileDownloadAjax?fileName=" + calledPathFileName + "'>" //주석처리
						 + " <img src='${contextPath}/resources/assets/images/file-icons/512/004-folder-1.png' alt='No Icon' "+ " style='height: 18px; width: 18px;'>"
						 + obj.rfilename
						 //+ " </a>" //주석처리
						 //+ " <span data-filename='" + calledPathFileName + "' data-filetype='F'>[삭제]</span>" //주석처리
						 + "</li>";
				 } else if (obj.rfiletype=="I") {//이미지파일인 경우 썸네일 및 원본 파일이름 표시
					 //전체 경로명이 포함된 썸네일 파일이름을 encodeURIComponent로 처리
					 var thumbnail_file_path = 
					 encodeURIComponent(obj.review_repo_path + "/" + obj.ruploadpath + "/s_" + obj.ruuid + "_" + obj.rfilename);
					 console.log("encodeURIComponent 처리 파일이름: " + thumbnail_file_path);
					 //원본이미지 파일이름(경로포함)
					 //var originPathImageFileName = obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid //주석처리
					 // + "_" + obj.fileName; //주석처리
					 //originPathImageFileName = originPathImageFileName.replace(new RegExp(/\\/g),"/"); //주석처리
					
					 //아래의 li 태그를 다음처럼 수정: data-* 속성들 추가
					 str += "<li  data-ruploadpath='" + obj.ruploadpath + "'"
					 + " data-review_repo_path='"+obj.review_repo_path+"'"
					 + " data-ruuid='" + obj.ruuid + "'"
					 + " data-rfilename='" + obj.rfilename + "'"
					 + " data-rfiletype='I' >" //수정: li 요소에 data-XXX 속성으로 필요한 값을 지정
					 + " <img src='${contextPath}/review_display_thumbnail_file?file_name=" + thumbnail_file_path + "'"
					 + " alt='No Icon' style='height: 50px; width: 50px;'>"
					 + obj.rfilename
					 + "</li>";
		 }
		 
	 });
	 //기존 페이지에 첨부파일 정보 표시를 HTML로 추가
 	 file_upload_result.html(str);
	} 

	//하트가 눌렸을 때 함수
	function review_heart_pressed() {
		var rv_no = rv_no_value;
	   $.ajax({
	      type : "get",
	      url  : '${contextPath}/review/heart_pressed',
	      data : {rv_no: rv_no,
	    	  user_id : login_user},
	      beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
	      dataType : "json",
	      success: function (result) {
	         if (result==0) {
	            alert("등록 실패 줸장");
	         }
	         else {
	        	 alert("좋아요 등록 성공");
	        	 like_update_and_show();
	            }
	         }
	   });   
	} 
	//하트 누른걸 취소했을 때
	function review_heart_unpressed() {
		var rv_no = rv_no_value;
	   $.ajax({
	      type : "get",
	      url  : '${contextPath}/review/heart_unpressed',
	      data : {rv_no: rv_no,
	    	  user_id : login_user},
	      beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
	      dataType : "json",
	      success: function (result) {
		      
	    	  
	    	  if (result==-1) {
		            alert("해제 실패 줸장");
		         }
		         else {
		        	 alert("좋아요 해제 성공");
		        	 like_update_and_show();
		            }
		         },
		    error: function(xhr){
		    	alert("error");
		    }

	      
	   });   
	} 
	//좋아요 하트 누르기 구현
  	$("#checkbox").on("click",function(){
  		
  		like_check();
  		
  		
  	}); 
  

  	
	// 현재 좋아요가 눌렸는지 체크하는 함수
  function like_check(){
		var rv_no = rv_no_value
	   $.ajax({
	      type : "get",
	      url  : "${contextPath}/review/heart_check",
	      data : {rv_no: rv_no,
	    	  user_id : login_user},
	      beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
	      dataType : "text",
	      success: function (result) {
	    	  if(result == "존재함"){
	    		  review_heart_unpressed();
	    	  }else if(result == "존재안함"){
	    		  review_heart_pressed();
	    	  }
	      },error: function(xhr){
		    	alert("error");
		    }
	   }); 
	} 
	//좋아요 갯수 업데이트 및 게시물의 좋아요 갯수 보여주기
	function like_update_and_show(){
		var rv_no = rv_no_value
		var like_status = $("#like_status");
		
		 $.ajax({
		      type : "get",
		      url  : "${contextPath}/review/heart_total_show",
		      data : {rv_no: rv_no,
		    	  user_id : login_user},
		      beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
		      dataType : "json",
		      success: function (result) {
		    	  		 alert("result"+result);
		     			 var final_result = result;
		    		  /* like_status.html('현재 좋아요 개수 :'+final_result+'&nbsp;&nbsp;');   */
		     			document.getElementById("like_status").innerHTML = '현재 좋아요 개수 :'+final_result+'&nbsp;&nbsp;';
		      },error: function(xhr){
			    	alert("error");
			    }
		   }); 
		
	}

  	
  	
	$(document).ready(function() {//페이지 로딩 시 함수 실행 전체 JavaScript 내용 중 제일 마지막에 위치해야 함
		//첨부파일 정보를 가져오는 Ajax.
		 $.ajax({ 
			 type: 'get',
			 url: '${contextPath}/review/get_files',
			 data: {rv_no: rv_no_value}, //는 상단에 정의(댓글구현 시 사용)된 것 사용
			 dataType: 'json',
			 success: function(file_list, status){
				 console.log("첨부파일 목록 수집: " + status);
				 show_uploaded_files(file_list);
			 }
		 }); //ajax end
		 show_cmt_list(1);
	});
	
	
	
  	
	
</script>





<%@ include file = "../../templet/footer.jsp"%>  
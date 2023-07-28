<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%@ include file = "../../templet/notice_header.jsp"%> 
<%@ include file = "../../templet/notice_page.jsp"%> 

<div class="col-md-12 grid-margin stretch-card">
 <!--  <div class="card"> -->
   <!--  <div class="card-body px-5"> -->
 <!--    </div> -->
 <!--  </div> -->
</div>

<div class="col-md-12 grid-margin stretch-card">
  <div class="card px-3">
    <label for="exampleTextarea1"></label>
    	<div class="card-body px-5 my2">

    		<form class="form-listline" id="notice_send"  name="notice_send" >
    		 <!-- 	<h3>공지사항 목록</h3> --> <br>

 					
				<div class="input-group">
                    <label class="sr-only">notice_send_values</label>
                      <select class="btn btn-outline-warning  dropdown-toggle mr-1" id="select_notice_row" name="notice_amount_per_page"> <!-- 표시 게시물 수 선택 -->
                         <option value="10" <c:out value="${paging_creator.notice_pagingDTO.notice_amount_per_page eq '10' ? 'selected' : ''}" /> >10개</option>
                         <option value="20" <c:out value="${paging_creator.notice_pagingDTO.notice_amount_per_page eq '20' ? 'selected' : ''}" /> >20개</option>
                         <option value="50" <c:out value="${paging_creator.notice_pagingDTO.notice_amount_per_page eq '50' ? 'selected' : ''}" /> >50개</option>
                         <option value="100" <c:out value="${paging_creator.notice_pagingDTO.notice_amount_per_page eq '100'? 'selected' : ''}" /> >100개</option>
                      </select>
					
					  <select class="btn btn-outline-warning  dropdown-toggle mr-1" id="select_notice_scope" name="notice_scope"><!-- 검색 범위 선택 -->
                         <option value="" <c:out value="${paging_creator.notice_pagingDTO.notice_scope == null ? 'selected':''}" />>검색범위</option>
                         <option value="T" <c:out value="${paging_creator.notice_pagingDTO.notice_scope eq 'T' ? 'selected' : ''}" />>제목</option>
                         <option value="C" <c:out value="${paging_creator.notice_pagingDTO.notice_scope eq 'C' ? 'selected' : ''}" />>내용</option>
                         <option value="TC" <c:out value="${paging_creator.notice_pagingDTO.notice_scope eq 'TC'? 'selected' : ''}" />>제목 + 내용</option>
                         <option value="V" <c:out value="${paging_creator.notice_pagingDTO.notice_scope eq 'V'? 'selected' : ''}" />>나라</option>
                      </select>
					 
					 
                      <input class="form-control mr-2" id="notice_input_keyword" name="notice_keyword" type="text" placeholder="검색어를 입력하세요"
                        	 value='<c:out value="${paging_creator.notice_pagingDTO.notice_keyword}" />' />

                      <button class="btn btn-outline-warning  mr-1" type="button" id="notice_search_go"> 검&nbsp;색</button>
                         
                                            
                  <!-- <div class="input-group"> --> <!-- 검색 초기화 버튼 -->
                      <button id="notice_reset" class="btn btn-outline-warning" type="reset">검색초기화</button>
                      </div>
                      <input type="hidden" name="notice_page_num" id="notice_page_num" value="${paging_creator.notice_pagingDTO.notice_page_num }" />
                      <input type="hidden" name="notice_amount_per_page" value="${paging_creator.notice_pagingDTO.notice_amount_per_page }" />
              		  <input type="hidden" name="last_page_num" value="${paging_creator.last_page_num }" /> 
            </form>  <%--/.form-group --%>
        </div> <br>  <%-- 맨위 버튼 그룹 --%>

    <table class="table table-hover">
      <thead>
      <tr class="notice_list_table">
      	<th style="text-align:center; color: white">글번호</th>
      	<th style="text-align:center; color: white">제&nbsp;&nbsp;&nbsp;목</th>
      	<th style="text-align:center; color: white">작성자</th>
      	<th style="text-align:center; color: white">작성일</th>
      	<th style="text-align:center; color: white">나라</th>
      	
      	
    <!--   	<th style="text-align:center; color: white">수정일</th> -->
      </tr>
      </thead>
      		<tbody>
              <c:forEach var="notice" items="${notice_list }">
            	<c:if test="${notice.ntc_delflag == 1}">
                       <tr style="background-color:Moccasin; text-align:center;">
                          <td style="text-align:center;"><c:out value="${notice.ntc_vo}" /></td>
                          <td colspan="5"><em>작성자에 의해 삭제된 글입니다.</em></td>
                       </tr>
                </c:if>
 				<c:if test="${notice.ntc_delflag == 0 }">
                       <tr class=notice_detail data-ntc_no='<c:out value="${notice.ntc_no}"/>'>
                           <td style="text-align: center; color: white"><c:out value="${notice.ntc_no}" /></td>
                           <td style="text-align: center; color: white">
                           <c:out value="${notice.ntc_title}" />
                           </td>
                           <td style="text-align: center; color: white"><c:out value="${notice.ntc_writer}" /></td>
                           <td style="text-align: center; color: white"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.ntc_regdate}" /></td>
                           <td style="text-align: center; color: white"><c:out value="${notice.ntc_country}" /></td>
                     <%--       <td style="text-align: center; color: white"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.ntc_moddate}" /></td> --%>
                        </tr>
                     </c:if>
              </c:forEach>
            </tbody>    
    </table>

<%-- Pagination 시작 --%>
 <div class='pull-right'>
    <ul class="pagination pagination-sm  justify-content-center">
       <%-- 페이징 버튼 클릭 시, jQuery로 페이지 번호를 전달하도록 a 태그에 전달된 paging_creator 객체의 필드 지정 --%>
       <c:if test="${paging_creator.notice_prev}">
          <li class="page-item"><a href="1" class="page-link">&laquo;</a>
             <%-- 맨 앞으로 페이지로 이동 --%></li>
       </c:if>
       <c:if test="${paging_creator.notice_prev}">
          <li class="page-item">
            <a href="${paging_creator.start_paging_num - 1}" class="page-link">이전</a> <%-- 이전 페이징 그룹 끝 페이지로 이동 --%></li>

       </c:if>
       <%-- 페이징 그룹의 페이징 숫자(10개 표시) --%>
       <c:forEach var="page_num" begin="${paging_creator.start_paging_num}"
          end="${paging_creator.end_paging_num}">
          <%-- 선택된 숫자의 경우, Bootstrap의 active 클래스 이름 추가 --%>
          <li class='page-item ${paging_creator.notice_pagingDTO.notice_page_num == page_num ? "active":"" }'>
             <a href="${page_num}" class="page-link">${page_num}</a>
          </li>
       </c:forEach>
       <c:if test="${paging_creator.notice_next}">
          <li class="page-item" class="page-link"><a href="${paging_creator.end_paging_num +1}">다음</a> <%-- 다음 페이징 그룹의 첫 페이지로 이동 --%></li>
       </c:if>
       <c:if test="${paging_creator.notice_next}">
          <li class="page-item" class="page-link"><a href="${paging_creator.last_page_num}">&raquo;</a> <%-- 맨 마지막으로 페이지로 이동 --%></li>
       </c:if>
    </ul>
 </div>
<%-- Pagination 끝 --%>
<!-- 로그인한 유저가 관리자일 경우, 새 공지 등록 버튼 활성화 -->
	<sec:authorize access="hasRole('ROLE_ADMIN')"> 
		<button id="new_notice_regi" type="button" 
				class="btn btn-outline-warning btn-fw  btn-icon-text mt-4 float-right">새 공지 등록</button>
	</sec:authorize><br>
    </div>
</div>
  
  
<script>

//공지사항 글 쓰기  ok(관리자 권한이 있는 사람만)
<sec:authorize access="hasRole('ROLE_ADMIN')">
$("#new_notice_regi").on("click", function(){
	self.location = "${contextPath}/notice/notice-register";
});
</sec:authorize>

<sec:authorize access="!hasRole('ROLE_ADMIN')">
$("#button_new_register").on("click", function() {
	alert("로그인 후, 이용 가능합니다.");
});
</sec:authorize>

</script>
  
  
<!-- 공지글 상세보기 ok-->  
<script type="text/javascript">

var notice_send = $("#notice_send");

      <%--tr 태그 클릭 시 form의 데이터를 전달하고 detail 화면 요청 --%>
      $(".notice_detail").on( "click", function(e) {
    	   e.preventDefault();
	      <%-- bno 값이 값이 설정된 hidden 유형의 input 요소를 form에 추가 --%>
	      <%-- tr 태그의 data-bno 속성의 값을 data() 함수로 값을 읽어와 value 속성에 지정 --%>
//	      alert($(this).data("ntc_no"));
	      notice_send.append("<input type='hidden' name='ntc_no' value='"+$(this).data("ntc_no")+"'/>");
	      notice_send.attr("action", "${contextPath}/notice/notice-detail");<%-- form에 action 속성 지정 --%>
	      notice_send.attr("method", "get");<%-- form에 method 속성 지정 --%>
	      notice_send.submit();<%-- form 전송 --%>
});
      
</script>
 
<!-- 공지사항 수정 -->  
<script>
 var result = '<c:out value="${result}"/>';
	function check_modify_operation(result) {
		if (result === '' || history.state) {
			return;
		} else if (result === 'successModify') {
			var notice_msg = "글이 수정되었습니다";
		}

		//alert(notice_msg);
//		alert(result);
		notice_msg = '';
	}
	
	
<%-- 페이징 화면 이동(페이징 버튼 클릭 이벤트 처리): 폼에 저장된 페이지번호를 클릭한 페이지번호로 변경한 후, 전송 --%>
$(".page-item a").on("click", function(e) {
	e.preventDefault();
<%--a 태그의 클릭 시 동작 막음 --%>   
   <%--폼에 저장된 현재 화면의 페이지번호를 클릭한 페이징 버튼의 페이지번호로 변경 --%>
   notice_send.find("input[name='notice_page_num']").val($(this).attr("href"));
//   alert(notice_send.find("input[name='notice_page_num']").val());
   notice_send.attr("action", "${contextPath}/notice/notice-list");
   notice_send.attr("method", "get");
   notice_send.submit();
  });
   $(document).ready(function() {
	   check_modify_operation(result);
});
</script>  
  
<script>

<%--검색 관련 요소의 이벤트 처리--%>
<%--표시행수 변경 이벤트 처리--%>
$("#select_notice_row").on("change", function(){
	notice_send.find("input[name='notice_page_num']").val(1);
	notice_send.attr("action", "${contextPath}/notice/notice-list");
	notice_send.attr("method", "get");
	notice_send.submit();
}); 


<%--검색버튼 클릭 이벤트 처리 --%>
$("#notice_search_go").on("click", function(e) {
 if (!$("#select_notice_scope").find("option:selected").val()) {
 	alert("검색범위를 선택하세요");
 	return false;
 }
 
 if (!((notice_send.find("input[name='notice_keyword']").val()) ||
 	   (notice_send.find("input[name='notice_keyword']").val() !="") )) {
 	alert("검색어를 입력하세요");
 	return false;
 }
 
 notice_send.find("input[name='notice_page_num']").val("1");
 notice_send.submit();
});


/* 초기화 버튼 */
$("#notice_reset").on("click", function(){
	   $("#select_notice_row").val(10);
	   $("#select_notice_scope").val("");
	   $("#notice_input_keyword").val("");
	   $("#notice_page_num").val(1);
	   $("#notice_amount_per_page").val("");
	   $("#last_page_num").val("");
	   
	   notice_send.submit();
	   
	});
	


</script>  


<%@ include file = "../../templet/footer.jsp"%>    
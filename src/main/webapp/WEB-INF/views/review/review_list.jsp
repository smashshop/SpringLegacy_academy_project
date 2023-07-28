<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>

<%@ include file = "../../templet/review-header.jsp"%>
  

<div class="col-md-12 grid-margin stretch-card">
 <%--   <div class="card">
   <div class="card-body px-5">
     <div class = "img_wrapper my-4" style = "width : 100%; height : 350px;">
        <img src = "${pageContext.request.contextPath }/resources/assets/images/review/img2.jpg" alt = "이미지 없음" class = "rounded" width = "100%" height = "100%"/>
       </div> 
    </div>
  </div>--%>
</div>
<!-- 페이지 맨 위 이미지 -->



<div class="col-md-12 grid-margin stretch-card">
  <div class="card px-3">
                <label for="exampleTextarea1"></label>
    <div class="card-body px-5 my2">

       <form class="form-listline" id="review_send" method="get" name="review_send" action="${contextPath}/review/review-list">
              <h3>후기 목록</h3> 
                    
             <!--  <nav class="navbar navbar-expand-sm navbar-white">  -->


               <!-- 표시할 게시물 수 선택 -->
                  <div class="input-group">
                    <label class="sr-only">review_send_values</label>
                      <select class="btn btn-outline-primary dropdown-toggle" id="select_review_row" name="review_page_row_amount_per_page"><!-- 표시 게시물 수 선택 -->
                         <option value="10" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_page_row_amount_per_page eq '10'
                                                    ? 'selected' : ''}" /> >10개</option>
                         <option value="20" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_page_row_amount_per_page eq '20'
                                                    ? 'selected' : ''}" /> >20개</option>
                         <option value="50" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_page_row_amount_per_page eq '50'
                                                    ? 'selected' : ''}" /> >50개</option>
                         <option value="100" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_page_row_amount_per_page eq '100'
                                                    ? 'selected' : ''}" /> >100개</option>
                      </select>
               
               <!-- 검색범위 설정 -->
                <select class="btn btn-outline-primary dropdown-toggle" id="select_review_scope" name="review_scope"><!-- 검색 범위 선택 -->
                         <option value="" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_scope == null
                                                    ? 'selected':''}" /> >검색범위</option>
                         <option value="T" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_scope eq 'T'
                                                    ? 'selected' : ''}" /> >제목</option>
                         <option value="C" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_scope eq 'C'
                                                    ? 'selected' : ''}" /> >내용</option>
                         <%-- <option value="W" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_scope eq 'W'
                                                    ? 'selected' : ''}" /> >작성자</option> --%>
                         <option value="TC" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_scope eq 'TC'
                                                   ? 'selected' : ''}" /> >제목 + 내용</option>
                         <option value="V" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_scope eq 'V'
                         							? 'selected' : ''}" /> >나라별</option>
                         <%-- <option value="TW" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_scope eq 'TW'
                                                    ? 'selected' : ''}" /> >제목 + 작성자</option> --%>
                         <%-- <option value="TCW" <c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_scope eq 'TCW'
                                                    ? 'selected' : ''}" /> >제목 + 내용 + 작성자</option> --%>
                      </select>
                  
                
               
          			<!-- 검색어 입력 -->
                         <input class="form-control" id="input_keyword" name="review_keyword" type="text" placeholder="검색어를 입력하세요"
                         value='<c:out value="${review_paging_creatorDTO.my_review_pagingDTO.review_keyword}" />' />
                       <!--   <span class="input-group-btn">  -->  <!-- 전송버튼 -->
                         <button class="btn btn-outline-primary dropdown-toggle" type="button" id="review_search_go">
                         검&nbsp;색 &nbsp;
                         </button>
                      <!--    </span> -->
                     <!-- </div> -->
                                            
                      <!-- <div class="input-group"> --><!-- 검색 초기화 버튼 -->
                         <button id="review_reset" class="btn btn-outline-primary" type="reset">검색초기화</button>
                     <!--  </div> -->
                     </div>

                      
                       <input type="hidden" name="review_page_num" id="review_page_num" value="${review_paging_creatorDTO.my_review_pagingDTO.review_page_num }" />
                       <input type="hidden" name="review_page_row_amount_per_page" value="${review_paging_creatorDTO.my_review_pagingDTO.review_page_row_amount_per_page }" />
                       <input type="hidden" name="last_page_num" value="${review_paging_creatorDTO.last_page_num }" /> 
                     
             <!--   </nav>  -->
   
              		</form>      
                       </div>
                       <%--/.form-group --%>
		
                    <br>

          




    <table class="table">
      <thead>
      <tr class="review_list_table">
         <th style="text-align:center; color:white">글번호</th>
         <th style="text-align:center;color:white">제&nbsp;&nbsp;&nbsp;목</th>
         <th style="text-align:center;color:white">작성자</th>
         <th style="text-align:center;color:white">작성일</th>
         <th style="text-align:center;color:white">수정일</th>
         <th style="text-align:center;color:white">방문한 나라</th>
      </tr>
      </thead>
      <tbody>
             <c:forEach var="review" items="${review_list }">
                <c:if test="${review.rv_delflag == 1}">
                       <tr style="background-color:Moccasin; text-align:center;">
                          <td><c:out value="${review.rv_no}" /></td>
                          <td colspan="5"><em>작성자에 의해 삭제된 글입니다.</em></td>
                       </tr>
                       </c:if>
               <c:if test="${review.rv_delflag == 0 }">
                       <tr style= text-align:center class="move_detail" 
											data-rv_no='<c:out value="${review.rv_no}"/>'>
											<td style="text-align: center;color:white"><c:out value="${review.rv_no}" /></td>
											<td style="text-align: center;color:white">
											<c:out value="${review.rv_title}" />
											</td>
											<td style="color:white;"><c:out value="${review.rv_writer}" /></td>
											<td style="color:white;"><fmt:formatDate pattern="yyyy/MM/dd"
													value="${review.rv_regdate}" /><br></td>
											<td style="color:white;"><fmt:formatDate pattern="yyyy/MM/dd"
													value="${review.rv_moddate}" /><br></td>
											<td style="color:white;"><c:out value="${review.rv_country}" /><br></td>
											
										</tr>
                     </c:if>
                 </c:forEach>
              </tbody>    
    </table>
            <%-- Pagination 시작 --%><%-- 
						<div class='pull-right'>
							<ul class="pagination pagination-sm">
								페이징 버튼 클릭 시, jQuery로 페이지 번호를 전달하도록 a 태그에 전달된 pagingCreator 객체의 필드 지정
								<c:if test="${review_paging_creatorDTO.prev}">
									<li class="paginate_button previous"><a href="1">&laquo;</a>
										맨 앞으로 페이지로 이동</li>
								</c:if>
								<c:if test="${review_paging_creatorDTO.prev}">
									<li class="paginate_button previous"><a
										href="${review_paging_creatorDTO.start_paging_num - 1}">이전</a> 이전 페이징 그룹 끝 페이지로 이동</li>
								</c:if>
								페이징 그룹의 페이징 숫자(10개 표시)
								<c:forEach var="page_num" begin="${review_paging_creatorDTO.start_paging_num}"
									end="${review_paging_creatorDTO.end_paging_num}">
									선택된 숫자의 경우, Bootstrap의 active 클래스 이름 추가
									<li
										class='paginate_button ${review_paging_creatorDTO.my_review_pagingDTO.review_page_num == page_num ? "active":"" }'>
										<a href="${page_num}">${page_num}</a>
									</li>
								</c:forEach>
								<c:if test="${review_paging_creatorDTO.next}">
									<li class="paginate_button next"><a
										href="${review_paging_creatorDTO.end_paging_num +1}">다음</a> 다음 페이징 그룹의 첫 페이지로 이동</li>
								</c:if>
								<c:if test="${review_paging_creatorDTO.next}">
									<li class="paginate_button next"><a
										href="${review_paging_creatorDTO.last_page_num}">&raquo;</a> 맨 마지막으로 페이지로 이동</li>
								</c:if>
							</ul>
						</div> --%>
						<%-- Pagination 끝 --%>       
						  <%-- Pagination 시작 --%>
						<div class='pull-right'>
							  <ul class="pagination pagination-sm  justify-content-center">
								<%-- 페이징 버튼 클릭 시, jQuery로 페이지 번호를 전달하도록 a 태그에 전달된 pagingCreator 객체의 필드 지정 --%>
								<c:if test="${review_paging_creatorDTO.prev}">
									<li class="page-item"><a href="1"  class="page-link">&laquo;</a>
										<%-- 맨 앞으로 페이지로 이동 --%></li>
								</c:if>
								<c:if test="${review_paging_creatorDTO.prev}">
									<li class="page-item"><a 
										href="${review_paging_creatorDTO.start_paging_num - 1}"  class="page-link">이전</a> <%-- 이전 페이징 그룹 끝 페이지로 이동 --%></li>
								</c:if>
								<%-- 페이징 그룹의 페이징 숫자(10개 표시) --%>
								<c:forEach var="page_num" begin="${review_paging_creatorDTO.start_paging_num}"
									end="${review_paging_creatorDTO.end_paging_num}">
									<%-- 선택된 숫자의 경우, Bootstrap의 active 클래스 이름 추가 --%>
									<li
										class='page-item ${review_paging_creatorDTO.my_review_pagingDTO.review_page_num == page_num ? "active":"" }'>
										<a href="${page_num}" class="page-link">${page_num}</a>
									</li>
								</c:forEach>
								<c:if test="${review_paging_creatorDTO.next}">
									<li class="page-item " class="page-link"><a  
										href="${review_paging_creatorDTO.end_paging_num +1}" >다음</a> <%-- 다음 페이징 그룹의 첫 페이지로 이동 --%></li>
								</c:if>
								<c:if test="${review_paging_creatorDTO.next}">
									<li class="page-item " class="page-link"><a  
										href="${review_paging_creatorDTO.last_page_num}" >&raquo;</a> <%-- 맨 마지막으로 페이지로 이동 --%></li>
								</c:if>
							</ul>
						</div>
						
						
						<%-- Pagination 끝 --%>     
                        

          <button type="button" class="btn btn-primary btn-icon-text mt-4 float-right" id=btn_move_register>
           <i class="mdi mdi-upload btn-icon-prepend"></i> 새 후기 등록
          </button>
        </div>
    </div>
  </div>
  <script>
        $("#btn_move_register").on("click", function(){
        	var login_user = "";
        	<sec:authorize access="isAuthenticated()">
        	login_user = '<sec:authentication property="principal.username"/>';
        	</sec:authorize> 
        	 <%--로그인 안 한 경우--%>
			  if(!login_user){
				 alert("로그인 후, 수정/삭제가 가능합니다.");
				 return ;
			 } 
        	 self.location = "${contextPath}/review/review-register";
        	});
   	</script>
  <script type="text/javascript">
			var review_send = $("#review_send");
		<%--tr 태그 클릭 시 form의 데이터를 전달하고 detail 화면 요청 --%>
		$(".move_detail").on( "click", function(e) {
		<%-- bno 값이 값이 설정된 hidden 유형의 input 요소를 form에 추가 --%>
		<%-- tr 태그의 data-bno 속성의 값을 data() 함수로 값을 읽어와 value 속성에 지정 --%>
			review_send.append("<input type='hidden' name='rv_no' value='" + $(this).data("rv_no") + "'/>");
			review_send.attr("action", "${contextPath}/review/review-detail");<%-- form에 action 속성 지정 --%>
			review_send.attr("method", "get");<%-- form에 method 속성 지정 --%>
			review_send.submit();<%-- form 전송 --%>
		});
		</script>
		<script>
		var result = '<c:out value="${result}"/>';
		function check_modify_operation(result) {
		 	if (result === ''|| history.state) {
		 	return;
		 	} else if (result === 'success_modify'){
			 var myMsg = "글이 수정되었습니다";
		 	}
			 //alert(myMsg);
			 alert(result);
			 myMsg='';
		}
		<%-- 페이징 화면 이동(페이징 버튼 클릭 이벤트 처리): 폼에 저장된 페이지번호를 클릭한 페이지번호로 변경한 후, 전송 --%>
		$(".page-item a").on("click",function(e) {
			e.preventDefault();
	<%--a 태그의 클릭 시 동작 막음 --%>	
	<%--폼에 저장된 현재 화면의 페이지번호를 클릭한 페이징 버튼의 페이지번호로 변경 --%>
		review_send.find("input[name='review_page_num']").val(
							$(this).attr("href"));
					alert(review_send.find("input[name='review_page_num']").val());
					review_send.attr("action", "${contextPath}/review/review-list");
					review_send.attr("method", "get");
					review_send.submit();
				});
		$(document).ready(function() {
			check_modify_operation(result);
		});
	</script>
  
<script>
	<%--검색 관련 요소의 이벤트 처리--%>
	<%--표시행수 변경 이벤트 처리--%>
	$("#select_review_row").on("change", function(){
		review_send.find("input[name='review_page_num']").val(1);
		review_send.attr("action", "${contextPath}/review/review-list");
		review_send.attr("method", "get");
		review_send.submit();
	});
	<%--검색버튼 클릭 이벤트 처리 --%>
	$("#review_search_go").on("click", function(e) {
	 if (!$("#select_review_scope").find("option:selected").val()) {
	 alert("검색범위를 선택하세요");
	 return false;
	 }
	 
	 //if (!frmSendValue.find("input[name='keyword']").val()) {
	 if (!((review_send.find("input[name='review_keyword']").val()) ||
	 (review_send.find("input[name='review_keyword']").val() !="") )) {
	 alert("검색어를 입력하세요");
	 return false;
	 }
	 
	 review_send.find("input[name='review_page_num']").val("1");
	 
	 review_send.submit();
	});
	/* 초기화 버튼 */
	$("#review_reset").on("click", function(){
	      $("#select_review_row").val(10);
	      $("#select_review_scope").val("");
	      $("#input_keyword").val("");
	      $("#review_page_num").val(1);
	      $("#review_page_row_amount_per_page").val("");
	      $("#last_page_num").val("");
	      
	      review_send.submit();
	   });
</script>  


<%@ include file = "../../templet/footer.jsp"%>    
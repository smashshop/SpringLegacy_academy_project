<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>

<!DOCTYPE html>

        <%@ include file="../../templet/header.jsp" %>
     
               <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
          
          
            			<form class="form-inline" id="frmSendValue" action="${contextPath}/admin/admin-sleepmember" method="get" name="frmSendValue">
                     <div class="form-group">
                        <label class="sr-only">frmSendValues</label>
                      <select class="form-control" id="selectRowCnt" name="rowCntPerPage"><!-- 표시 게시물 수 선택 -->
                         <option value="10" <c:out value="${pagingCreator.user_pagingDTO.rowCntPerPage eq '10'
                         									? 'selected' : ''}" /> >10개</option>
                         <option value="30" <c:out value="${pagingCreator.user_pagingDTO.rowCntPerPage eq '30'
                         									? 'selected' : ''}" /> >30개</option>
                         <option value="50" <c:out value="${pagingCreator.user_pagingDTO.rowCntPerPage eq '50'
                         									? 'selected' : ''}" /> >50개</option>
                         <option value="70" <c:out value="${pagingCreator.user_pagingDTO.rowCntPerPage eq '70'
                         									? 'selected' : ''}" /> >70개</option>
                         <option value="100" <c:out value="${pagingCreator.user_pagingDTO.rowCntPerPage eq '100'
                         									? 'selected' : ''}" /> >100개</option>
                      </select>
                      <select class="form-control" id="selectScope" name="enabled"><!-- 검색 범위 선택 -->
                         
                         <option value="0" <c:out value="${pagingCreator.user_pagingDTO.enabled eq '0'
                         									? 'selected' : ''}" /> >휴면</option>
                         
                      </select>
                      
                      <div class="input-group"><!-- 검색어 입력 -->
                   
                         <span class="input-group-btn"><!-- 전송버튼 -->
                         <button class="btn btn-outline-primary" type="submit" id="btnSearchGo">
                         검색 &nbsp;<i class="fa fa-search"></i>
                         </button>
                         </span>
                      </div>
                                            
                      <div class="input-group"><!-- 검색 초기화 버튼 -->
                         <button id="btnReset" class="btn btn-outline-warning" type="reset">검색초기화</button>
                      </div>
                       <input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.user_pagingDTO.pageNum }" />
                       <input type="hidden" name="rowCntPerPage" value="${pagingCreator.user_pagingDTO.rowCntPerPage }" />
                       <input type="hidden" name="lastPageNum" value="${pagingCreator.lastPageNum }" />
                       </div>
                       <%--/.form-group --%>
                    </form>
            
            <%--게시판 --%>
            <div class="row ">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">휴면회원 목록</h4>
                    <div class="table-responsive">
                    
                    <h6 class="card-title">총 회원수 : <c:out value="${userCnt}" /> 명 / 검색된 회원수 :  <c:out value="${searchCnt}" />명</h6>
                      <table class="table">
                        <thead>
                          <tr>
                            <th>
                              <div class="form-check form-check-muted m-0">
                                <label class="form-check-label">
                                  <input type="checkbox" class="form-check-input">
                                </label>
                              </div>
                            </th>
                         	<th> 아이디 </th>
                            <th> 이름 </th>
                        	<th> 이메일 </th>
                            <th> 등록일자 </th>
                            <th> 평점 </th>
                            <th> 계정사용 가능여부(휴면) </th>
                  
                          </tr>
                        </thead>
                       <tbody>                     
                                      
                   <c:forEach var="board" items="${userList }">
                     
                          <tr class="odd gradeX">
                            <td>
                              <div class="form-check form-check-muted m-0">
                                <label class="form-check-label">
                                  <input type="checkbox" class="form-check-input">
                                </label>
                              </div>
                            </td>
									<td><c:out value="${board.user_id }" /></td>
                           
                                      <td><c:out value="${board.user_name }" /></td>
                                      
                            		  <td><c:out value="${board.user_email }" /></td>
                                
                             
                                      
                                  
                                     <td><fmt:formatDate value="${board.user_regdate }" 
                                                pattern="yyyy-MM-dd" /></td>
                                      
                                      <td><c:out value="${board.user_rate }" /></td>
                                      
                                      <td><c:out value="${board.enabled }" /></td>
                              
                           </tr>
                              
                           </c:forEach>
                              
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <%--게시판 끝 --%>
          
           <%-- pagination --%>
           <form class="form-inline justify-content-center" id="frmSendValue" action="${contextPath}/admin/admin-sleepmember" method="get" name="frmSendValue">
                    <div class="float-left">
                         <ul class="pagination justify-content-center">
                         
                        <c:if test="${pagingCreator.prev }">
                         <li class="page-item ">
                           <a href="1" class = "page-link" aria-label="Previous">
                             <span aria-hidden="true">&laquo;</span>
                           </a>
                         </li>
                   </c:if>
                         <c:if test="${pagingCreator.prev }">
                         <li class="page-item">
                           <a href="${pagingCreator.startPagingNum - 10 }"  class = "page-link"  aria-label="Previous">
                             <span aria-hidden="true">이전</span>
                           </a>
                         </li>
                   </c:if>
                   
                   
                   <c:forEach var="pagingNum" begin="${pagingCreator.startPagingNum }" end="${pagingCreator.endPagingNum }">
                         <li class='page-item ${pagingCreator.user_pagingDTO.pageNum == pagingNum ? "active" : ""}'>
                         <a href="${pagingNum }"  class = "page-link" ><c:out value="${pagingNum }"/></a>
                         </li>                       
                   </c:forEach>
                   
                   
                   <c:if test="${pagingCreator.next }">
                         <li class="page-item">
                           <a href="${pagingCreator.endPagingNum + 1 }"  class = "page-link" aria-label="Next">
                             <span aria-hidden="true">다음</span>
                           </a>
                         </li>
                  </c:if>
                   <c:if test="${pagingCreator.next }">
                         <li class="page-item">
                           <a href="${pagingCreator.lastPageNum }" class = "page-link"  aria-label="Previous">
                             <span aria-hidden="true">&raquo;</span>
                           </a>
                         </li>
                   </c:if>
                     </ul>
               </div>
               <input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.user_pagingDTO.pageNum }" />
               <input type="hidden" name="rowCntPerPage" value="${pagingCreator.user_pagingDTO.rowCntPerPage }" />
               <input type="hidden" name="lastPageNum" value="${pagingCreator.lastPageNum }" />
               </form>
                    <%-- /.pagination --%>  
 
 <script>
 
 var frmSendValue = $("#frmSendValue");
 
//페이지 이동
 $(".page-item a").on("click", function(e){
    e.preventDefault();
    
    frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
    frmSendValue.attr("action", "${contextPath}/admin/admin-sleepmember");
    frmSendValue.attr("method", "get");
    frmSendValue.submit(); 
 });
 
 <%-- 검색버튼 클릭 이벤트 처리 --%>
 $("#btnSearchGo").on("click", function(){
 /*    if(!$("#selectScope").find("option:selected").val()){
       alert("검색범위를 선택해주세요.");
       return false;
    }
    
    if($("#inputKeyword").val() == null || $("#inputKeyword").val() == ""){
       alert("검색어를 입력해주세요.");
       return false;
    } */
    frmSendValue.find("input[name='pageNum']").val(1);
    frmSendValue.submit();   
 });


 //화면에 보이는 페이지 설정
 $("#selectRowCnt").on("change", function(){
    frmSendValue.find("input[name='pageNum']").val(1);
    frmSendValue.attr("action", "${contextPath}/admin/admin-sleepmember");
    frmSendValue.attr("method", "get");
    frmSendValue.submit();
 });


 $("#btnReset").on("click", function(){
 	   $("#selectRowCnt").val(10);
 	   $("#selectScope").val("");
 	   $("#inputKeyword").val("");
 	   $("#pageNum").val(1);
 	   $("#rowCntPerPage").val("");
 	   $("#lastPageNum").val("");
 	   
 	   frmSendValue.submit();
 	});
 
</script>
 
 
 
 
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
  
    <%@ include file="../../templet/footer.jsp" %>
 
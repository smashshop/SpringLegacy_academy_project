<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>

<!DOCTYPE html>

<%@ include file="../../templet/header.jsp" %>

<style>
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 100%;
    overflow-y: auto;
}
</style>

 
 <!--  <div class="card"> -->
   <!--  <div class="card-body px-5"> -->
     <div class = "img_wrapper my-4" style = "width : 100%; height : 350px;">
   	  <img src = "${pageContext.request.contextPath }/resources/assets/images/admin/admin.png" alt = "이미지 없음" class = "rounded" width = "100%" height = "100%"/>
   	 </div>
 <!--    </div> -->
 <!--  </div> -->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
          
          <h3 class="card-title">전체회원 목록 조회 (탈퇴 제외)</h3>
	<form class="form-inline" id="frmSendValue" action="${contextPath}/admin/admin-allmember" method="get" name="frmSendValue">
	<div class="form-group">
		<label class="sr-only">frmSendValues</label>
		<select class="btn btn-secondary btn-fw" id="selectRowCnt" name="rowCntPerPage"><!-- 표시 게시물 수 선택 -->
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
		</select>&nbsp;&nbsp;
		<!-- 검색 범위 선택 -->
		<select class="btn btn-secondary btn-fw" id="selectScope" name="scope">
		<option value="" <c:out value="${pagingCreator.user_pagingDTO.scope == null
									   ? 'selected':''}" /> >---검색범위---</option>
		<option value="I" <c:out value="${pagingCreator.user_pagingDTO.scope eq 'I'
									    ? 'selected' : ''}" /> >아이디</option>
		<option value="N" <c:out value="${pagingCreator.user_pagingDTO.scope eq 'N'
										? 'selected' : ''}" /> >이름</option>
		</select>&nbsp;&nbsp;
		
		<!-- 회원 구분 선택 -->
		<select class="btn btn-secondary btn-fw" id="select_report" name="enabled">
		<option value="" <c:out value="${pagingCreator.user_pagingDTO.enabled == null
									   ? 'selected':''}" /> >전체회원</option>
		<option value="0" <c:out value="${pagingCreator.user_pagingDTO.enabled eq '0'
									    ? 'selected' : ''}" /> >정지회원</option>
		</select>&nbsp;&nbsp;
		
		<!-- 검색어 입력 -->
		<input class="form-control" id="inputKeyword" name="keyword" type="text" 
		placeholder="검색어를 입력하세요" value='<c:out value="${pagingCreator.user_pagingDTO.keyword}" />' />&nbsp;&nbsp;
		<!-- 전송버튼 -->
		<span class="input-group-btn">
		<button class="btn btn-primary" type="submit" id="btnSearchGo">검색 &nbsp;
		<i class="fa fa-search"></i>
		</button>
		</span>
		<input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.user_pagingDTO.pageNum }" />
		<input type="hidden" name="rowCntPerPage" value="${pagingCreator.user_pagingDTO.rowCntPerPage }" />
		<input type="hidden" name="lastPageNum" value="${pagingCreator.lastPageNum }" />
	</div>
	<%--/.form-group --%>
	<sec:csrfInput/>
	</form><br>
	<h5 class="card-title" style="color:#438AF6;">총 회원수 : 
	<c:out value="${userCnt}" /> 명 / 검색된 회원수 :  <c:out value="${searchCnt}" />명</h5>
                                           
            
            <%--게시판 --%>
            <div class="row ">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                  
                      <table class="table">
                        <thead>
                          <tr>
                      
                            <th align="left"> 아이디 </th>
                            <th align="left"> 이름 </th>
                           <th align="left"> 이메일 </th>
                            <th align="left"> 가입일자 </th>
                            <th align="left"> 권한 </th>
                          </tr>
                        </thead>
                       <tbody>                     
                                      
               
                     <c:forEach var="board" items="${select_user_authority }">
               
                          <tr class="odd gradeX auth_modal" data-enabled = "${board.enabled }" data-user_id = "${board.user_id}" data-role_name = "${board.role_name}" data-user_report = "${board.user_report }">
                            
                 
                            
                            <td align="left"><c:out value="${board.user_id }" />        
										<c:if test="${board.enabled == false}">
									
									
										   <span style="color:#FE2E2E;">&nbsp;&nbsp;&nbsp;※정지된 회원입니다.</span>
										
										</c:if>
                           </td>
                 
                            <td align="left"><c:out value="${board.user_name }" /></td>
                            
                             <td align="left"><c:out value="${board.user_email }" /></td>
               
                              <td align="left"><fmt:formatDate value="${board.user_regdate }" 
                                                         pattern="yyyy-MM-dd" /></td>
                            
                           <td align="left"><c:out value="${board.role_name }" /></td>
                           
                              
                          </tr>
                              
                     </c:forEach>
                           
                           

                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div><%--게시판 끝 --%>
            
            
            <sec:authorize access="hasRole('ROLE_SUPER')"> 
            
            <%-- Modal --%>
            <div class="modal" tabindex="-1" data-backdrop="static">
               <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
                  <div class="modal-content" style = "background-color : #191C24;">
               
                     <div class="modal-header">
                        <h5 class="modal-title">
                           <i class="mdi mdi-account-card-details"></i>&nbsp; 회원 권한 수정
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                     </div>
                     
                     <div class="modal-body" id="modal_body_1" style="height: 120px;">
                        <div class = "container-fluid">
                        
                           <div class="row">
                           
                              <div class="d-block col-4">
                                 <span class="text-muted mr-3">
                                       <i class="mdi mdi-account-box-outline fa-lg"></i>&nbsp; 아이디
                                 </span>                              
                                 
                                 <span class = "user_id_box mb-3" style="font-size: 15px"></span>
                              </div>
                              
                              <div class="d-block col-4" >
                                 <span class="text-muted" style="float:left;">
                                    <i class="mdi mdi-account-key fa-lg"></i>&nbsp; 변경할 권한
                                 </span>
                                 
                                 <div class="d-block col-5" style="float:left;">
                                    <span>
                                       <select name="auth_list"  class="form-control role_select" style="width: 140px; height: 30px" id="exampleFormControlSelect2">                                  
                                          <option style="color:#ffffff" value="ROLE_ADMIN" <c:out value="${authority.role_name eq 'ROLE_ADMIN'
                                                          ? 'selected' : ''}" /> >'ROLE_ADMIN'</option>
                                          <option style="color:#ffffff" value="ROLE_USER" <c:out value="${authority.role_name eq 'ROLE_USER'
                                                          ? 'selected' : ''}" /> >'ROLE_USER'</option>
                                              
                                           <option style="color:#ffffff" value="ROLE_SUPER" <c:out value="${authority.role_name eq 'ROLE_USER'
                                                          ? 'selected' : ''}" /> >'ROLE_SUPER'</option>                                  
                                       </select>
                                    </span>
                                 </div>
                                                       
                              </div>
                              
                              <div class="d-block col-4">
                                 <span class="text-muted mr-3" style="color:white">
                                       <i class="mdi mdi-account-search fa-lg"></i>&nbsp; 현재 권한
                                    </span>
                                 <span class = "role_name_box" style="font-size: 15px"></span>
                              </div>
                              
                           </div>
                                 
                        </div>                  
                     </div><%--modal-body-1 end --%>
                      
                     <div class="modal-header" id="modal_header_2">
                     <h5 class="modal-title">
                        <i class="mdi mdi-account-card-details"></i>&nbsp; 작성한 동행글 목록
                       </h5>
                     </div>
                     
                     <div class="modal-body" id="modal_body_2">
                        <div class = "container-fluid">
                           <div class="row">
                                    <div class="table-responsive">
                                       <table class="table table-bordered">
                                          <thead>
                                          <tr>
                                             <th> 게시글 번호 </th>
                                          <th> 제목 </th>
                                          <th> 여행지 </th>
                                          <th> 여행일정 </th>  
                                      </tr>
                                      </thead>
                                     
                                     <tbody id="show_frnd_list">
                                         
                                     </tbody>
                                   
                                   
                                   </table>                           
                           
                           </div>
                        </div>
                     </div>                                    
                  </div>
                  
                  <div class="modal-footer">
                 <div class="enabled_box">
                  
                 </div>
                     <button type="button" id = "admin_apply_button" class="btn btn-primary">확인</button>
                  </div>
                  
               	 </div>
              </div>
            </div>
            
            </sec:authorize>
          
           <%-- pagination --%>
           <form class="form-inline justify-content-center" id="frmSendValue" action="${contextPath}/admin/admin-allmember" method="get" name="frmSendValue">
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
               <sec:csrfInput/>
               </form>
                    <%-- /.pagination --%>  
 
<script>


var frmSendValue = $("#frmSendValue");
var csrfHeaderName = "${_csrf.headerName}"; 
var csrfTokenValue = "${_csrf.token}";


//var auth_modal_value = $(".auth_modal").data("enabled");

 
//페이지 이동
$(".page-item a").on("click", function(e){
	
    e.preventDefault();
    
    frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
    frmSendValue.attr("action", "${contextPath}/admin/admin-allmember");
    frmSendValue.attr("method", "get");
    frmSendValue.submit(); 
});
 
<%-- 검색버튼 클릭 이벤트 처리 --%>
$("#btnSearchGo").on("click", function(){
    if(!$("#selectScope").find("option:selected").val()){
       alert("검색범위를 선택해주세요.");
       return false;
    }
    
    if($("#inputKeyword").val() == null || $("#inputKeyword").val() == ""){
       alert("검색어를 입력해주세요.");
       return false;
    }
    frmSendValue.find("input[name='pageNum']").val(1);
    frmSendValue.submit();   
});


//화면에 보이는 페이지 설정
$("#selectRowCnt").on("change", function(){
    frmSendValue.find("input[name='pageNum']").val(1);
    frmSendValue.attr("action", "${contextPath}/admin/admin-allmember");
    frmSendValue.attr("method", "get");
    frmSendValue.submit();
});

$("#select_report").on("change", function(){
    
    frmSendValue.attr("action", "${contextPath}/admin/admin-allmember");
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
 
var user_id = '';
var role_name = '';
 
 
var show_frnd_list = $("#show_frnd_list");
 
//Modal창 띄우는 함수
$(".auth_modal").on("click", function () {
	
    var str = "";
    var testValue1 = $(this).data("enabled");
    var testValue2 = $(this).data("user_report")
    var testBtn = "<button type='button' id = 'admin_report_button' class='btn btn-danger'>신고계정 정지</button>";

 
    user_id = $(this).data("user_id");
    $(".user_id_box").html($(this).data("user_id"));
    $(".role_name_box").html($(this).data("role_name"));
    
    
    
    
    
    $(".modal").modal("show");
    
    $.ajax({
       type : "get",
       url : "${contextPath}/admin/get-frnd-list",
       data : {frnd_writer : user_id},
       contentType : "text/plain; charset=utf-8",
       dataType : "json",
       beforeSend: function(xhr) {
           xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
          },
       success : function(result, status, xhr) {
          if (result.length == 0) {
        	  
              str += '<tr style="text-align: center;">'
                  + '<td colspan="5">작성한 동행글이 없습니다.</td>'
                  + '</tr>';

          }
          
          $(result).each(function(i, mem) {
                   
                if ("${board.user_id}" == "${user_id}") {
                   
                   var date1 = new Date(mem.frnd_startdate);
                   var date2 = new Date(mem.frnd_enddate);
                  
                   var year = date1.getFullYear();
                   var month = ('0' + (date1.getMonth() + 1) ).slice(-2);
                   var day = ('0' + date1.getDate() ).slice(-2);
                  
                   var startdate = year + "-" + month + "-" + day;
                  
                   year = date2.getFullYear();
                   month = ('0' + (date2.getMonth() + 1) ).slice(-2);
                   day = ('0' + date2.getDate() ).slice(-2);
                  
                   var enddate = year + "-" + month + "-" + day;
                
                   str += '<tr>'                          
                       +  '   <td class="move_frnd_detail" data-frnd_no="'+ mem.frnd_no + '">' 
                       +        mem.frnd_no + '</td>'
                       +  '   <td class="move_frnd_detail" data-frnd_no="'+ mem.frnd_no + '">' 
                       +        mem.frnd_title + '</td>'
                       +  '   <td class="move_frnd_detail" data-frnd_no="' + mem.frnd_no + '">'
                       +          mem.frnd_country + ',&nbsp;' + mem.frnd_city + '</td>'
                       +  '   <td class="move_frnd_detail" data-frnd_no="' + mem.frnd_no + '">'
                       +          startdate + '&nbsp;~&nbsp;' + enddate   
                       +  '   </td>'
                       +  '</tr>';
                       
                       
               
                       
                    
                }
                 
             
          });
          
          show_frnd_list.html(str);
             
       },
       error : function(er) {
          alert("er");
       }
       
    });
    
});


$(".enabled_box").on("click","button" ,function () {
	
	
    
    frmSendValue.append("<input type = 'hidden' name = 'user_id' value = '" + user_id + "'>");
    frmSendValue.attr("method", "post");
    frmSendValue.attr("action", "${contextPath}/admin/admin-report-update");
    frmSendValue.submit();
    $(".modal").modal("hide");
});

$("#admin_apply_button").on("click", function () {
    role_name = $(".role_select").find("option:selected").val();
    frmSendValue.append("<input type = 'hidden' name = 'user_id' value = '" + user_id + "'>");
    frmSendValue.append("<input type = 'hidden' name = 'role_name' value = '" + role_name + "'>");
    frmSendValue.attr("method", "post");
    frmSendValue.attr("action", "${contextPath}/admin/admin-role-update");
    frmSendValue.submit();
    $(".modal").modal("hide");
});


$(document).ready(function () {
       $('head').append('<style type="text/css">.modal #modal_body_2 {max-height: ' + ($('body').height() * .8) + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
});
 
</script>
  
<%@ include file="../../templet/footer.jsp" %>
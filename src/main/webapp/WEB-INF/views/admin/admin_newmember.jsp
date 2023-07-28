<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>

<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<%@ include file="../../templet/header.jsp" %>

     <div class = "img_wrapper my-4" style = "width : 100%; height : 350px;">
   	  <img src = "${pageContext.request.contextPath }/resources/assets/images/admin/admin.png" alt = "이미지 없음" class = "rounded" width = "100%" height = "100%"/>
   	 </div>


	<!-- partial -->
	<div class="main-panel">
	<div class="content-wrapper">
	<form class="form-inline" id="frmSendValue" action="${contextPath}/admin/admin-newmember" 
	      method="get" name="frmSendValue">
	    <h3 style="display : block; width : 100%;">신규회원 목록 조회</h3>
	<div class="form-group">
		<label class="sr-only">frmSendValues</label>
		<span class="btn_pack type10 "><button type="button"  onclick="fnDateSearch('today')" 
			  name="search" class="btn btn-outline-secondary"> 오늘</button></span>&nbsp;&nbsp;
		<span class="btn_pack type10"><button type="button" onclick="fnDateSearch('yester')" 
			  name="search" class="btn btn-outline-secondary">어제</button></span>&nbsp;&nbsp;
		<span class="btn_pack type10"><button type="button" onclick="fnDateSearch('week')" 
			  name="search" class="btn btn-outline-secondary">일주일</button></span>&nbsp;&nbsp;
		<span class="btn_pack type10"><button type="button" onclick="fnDateSearch('1month')" 
			  name="search" class="btn btn-outline-secondary">1개월</button></span>&nbsp;&nbsp;
		<span class="btn_pack type10"><button type="button" onclick="fnDateSearch('3month')" 
		  	name="search" class="btn btn-outline-secondary">3개월</button></span>&nbsp;&nbsp;
		<span class="btn_pack type10"><button type="button" onclick="fnDateSearch('6month')" 
			  name="search" class="btn btn-outline-secondary">6개월</button></span>&nbsp;&nbsp;
		<span class="btn_pack type10"><button type="button" onclick="fnDateSearch('year')" 
			  name="search" class="btn btn-outline-secondary">1년</button></span>&nbsp;&nbsp;
	
	<!-- 표시 게시물 수 선택 -->	
	<select class="btn btn-secondary btn-fw" id="selectRowCnt" name="rowCntPerPage">
		
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
		<input type="date" max = "2099-12-31" name="frnd_startdate" class="form-control mr-2" 
			   id="startDate" style="width: 150px;" value="${pagingCreator.user_pagingDTO.frnd_startdate }">
		<input type="date" max = "2099-12-31" name="frnd_enddate" class="form-control" 
			   id="endDate" style="width: 150px;" value="${pagingCreator.user_pagingDTO.frnd_enddate }">
		<!-- 전송버튼 -->
		<span class="input-group-btn">&nbsp;&nbsp;
		<button class="btn btn-primary" type="submit" id="btnSearchGo">검색 
		<i class="fa fa-search"></i></button></span>
		<input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.user_pagingDTO.pageNum }" />
		<input type="hidden" name="rowCntPerPage" value="${pagingCreator.user_pagingDTO.rowCntPerPage }" />
		<input type="hidden" name="lastPageNum" value="${pagingCreator.lastPageNum }" />
	</div>
	<%--/.form-group --%>
	</form><br>
	<h5 class="card-title" style="color:#438AF6;">총 회원수 : 
	<c:out value="${userCnt}" /> 명 / 검색된 회원수 :  
	<c:out value="${searchCnt}" /> 명</h5>

	<%--게시판 --%>
	<div class="row ">
	<div class="col-12 grid-margin">
	<div class="card">
	<div class="card-body">
		<h4 class="card-title">신규회원 목록</h4>
	<div class="table-responsive">
	<table class="table">
		<thead>
		<tr>

		<th> 아이디 </th>
		<th> 이름 </th>
		<th> 이메일 </th>
		<th> 가입일자 </th>
		</tr>
		</thead>
	<tbody id="listBody">                     
	<c:forEach var="board" items="${userList }">
		<tr class="odd gradeX">

		<td><c:out value="${board.user_id }" /></td>
		<td><c:out value="${board.user_name }" /></td>
		<td><c:out value="${board.user_email }" /></td>
		<td><fmt:formatDate value="${board.user_regdate }" pattern="yyyy-MM-dd" /></td>
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
	<form class="form-inline justify-content-center" id="frmSendValue" action="${contextPath}/admin/admin-newmember" method="get" name="frmSendValue">
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

function dateAdd(src, field, amount){

	if(isNaN(amount)){

	return null;
}

var d = (src.getDate ? src : toDate(src, '-'));

	amount = new Number(amount);

	switch(field.toLowerCase()){

	case 'y': {

	d.setFullYear(d.getFullYear() + amount);

	break;
}

	case 'm': {

	d.setMonth(d.getMonth() + amount);

	break;
}

	case 'd': {

	d.setDate(d.getDate() + amount);

	break;
}

	default: {

	return null;
	
	}
}

var month = parseInt(d.getMonth()) + 1;

var day = parseInt(d.getDate());

	return d.getFullYear() + '-' + (month < 10 ? '0' + month : month) + '-' + 
	       (day < 10 ? '0' + day : day);
};

function formatDate(d, f) {

	if (!this.valueOf()) return ' ';
	
	return f.replace(/(yyyy|mm|dd|hh|nn|ss|a\/p)/gi, function($1){
	
	switch ($1.toLowerCase()){

	case 'yyyy': return d.getFullYear();

	case 'mm':   return (d.getMonth() + 1 < 10 ? '0' : '') + (d.getMonth() + 1);

	case 'dd':   return (d.getDate() < 10 ? '0' : '') + d.getDate();

	case 'hh':   return (d.getHours() < 10 ? '0' : '') + d.getHours();

	case 'nn':   return (d.geMinutes() < 10 ? '0' : '') + d.geMinutes();

	case 'ss':   return (d.getSeconds() < 10 ? '0' : '') + d.getSeconds();

	}
});
};

function toDate(dateStr, delm) {

	var year;

	var month;

	var day;
	
	if(delm){

	var d = dateStr.split(delm);

	year = d[0];

	month = d[1] - 1;

	day = d[2];

	}else{

	year = dateStr.substr(0, 4);

	month = dateStr.substr(4, 2) - 1;

	day = dateStr.substr(6, 2);

}

	return new Date(year, month, day);

}; 

//페이지 이동
$(".page-item a").on("click", function(e){
	e.preventDefault();
    
    frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
    frmSendValue.attr("action", "${contextPath}/admin/admin-newmember");
    frmSendValue.attr("method", "get");
    frmSendValue.submit(); 
 });
 
<%-- 검색버튼 클릭 이벤트 처리 --%>
$("#btnSearchGo").on("click", function(){
    frmSendValue.find("input[name='pageNum']").val(1);
    frmSendValue.submit(); 
 });


//화면에 보이는 페이지 설정
$("#selectRowCnt").on("change", function(){
    frmSendValue.find("input[name='pageNum']").val(1);
    frmSendValue.attr("action", "${contextPath}/admin/admin-newmember");
    frmSendValue.attr("method", "get");
    frmSendValue.submit();
 });

function date_Today() {
	
	var d = new Date(),
		month = '' + (d.getMonth() + 1),
		day = '' + d.getDate(),
		year = d.getFullYear();

	if (month.length < 2) 
		month = '0' + month;
	if (day.length < 2) 
		day = '0' + day;

	return [year, month, day].join('-');
	
}

function date_Today_add(sDate, nDays) {
	
	var yy = parseInt(sDate.substr(0, 4), 10);
	var mm = parseInt(sDate.substr(5, 2), 10);
	var dd = parseInt(sDate.substr(8), 10);
	 
	d = new Date(yy, mm - 1, dd + nDays);
	yy = d.getFullYear();
	mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
	dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
	 
	return '' + yy + '-' +  mm  + '-' + dd;
	
}

function fnDateSearch(code){
	 
	var today=date_Today();
	if(code=="today"){
		$("#startDate").val(today);
		$("#endDate").val(today);	 
	}
	
	if(code=="yester"){
		$("#startDate").val(date_Today_add(today,-1));
		$("#endDate").val(date_Today_add(today,-1));
	}
	
	if(code=="week"){
		$("#endDate").val(today);
		$("#startDate").val(date_Today_add(today,-7));	 		 
	}
	
	if(code=="1month"){
		$("#endDate").val(today);
		$("#startDate").val(date_Today_add(today,-30));	 	 
	}
	
	if(code=="3month"){
		$("#endDate").val(today);
		$("#startDate").val(date_Today_add(today,-90));	
	 }
	
	if(code=="6month"){
		$("#endDate").val(today);
		$("#startDate").val(date_Today_add(today,-180));	 		 
	}
	
	if(code=="year"){
		$("#endDate").val(today);
		$("#startDate").val(date_Today_add(today,-365));
		
	}
 }
 
</script>
<!-- content-wrapper ends -->
<!-- partial:partials/_footer.html -->

<%@ include file="../../templet/footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>

<%@ include file = "../../templet/header_list.jsp"%>

<!-- 목록 페이지 상단 이미지 div -->
<div class="welcome-msg col-12">

</div>

<!-- 날짜 선택 박스 -->
<div class="col-11">   
   <input id="search_date" name="start_date" type="date" class="calendar_value btn btn-dark mb-1" max="2999-12-31"
          style="background-color: #2A3038; width: 200px; text-align:left;" value="${frnd_page.frnd_startdate}"/>
   여행 시작일, 여행지, 제목 또는 해시태그 중 한 가지 이상 입력하시고 검색버튼을 눌러주세요!
</div>

<div class="select_location col-12 mb-2">
<form id="frmSendValue" class="form_inline" action="${contextPath}/friend/friend-list" method="get" name="frmSendValue">

	<!-- 대륙 선택 박스 -->
    <select id="selected_continent" name="continent_name" class="form_control js-example-basic-single select2-hidden-accessible" 
          	onchange="selected_continent2(this)" style="width: 200px" data-select2-id="1" tabindex="-1" aria-hidden="true">    	
        <option>-- 대륙 --</option>
    	<c:forEach items="${continent_info}" var="continent">
    		<option value = "${continent.continent_name}" 
    			<c:if test = "${continent.continent_name == frnd_page.continent_name}">
    				selected
    			</c:if>>${continent.continent_name}</option>
    	</c:forEach>
    </select>
    
   	<!-- 국가 선택 박스 -->
    <select id="selected_country" name="country_name" class="form-control js-example-basic-single select2-hidden-accessible" 
          	style="width: 200px" data-select2-id="2" tabindex="-1" aria-hidden="true">
      	<option>-- 국가 --</option>      	
      	<c:forEach items="${country_info}" var="country">
      		<c:if test = "${frnd_page.country_name != null}">      		
	         	<option class="selected_country_2" value = "${country.country_name}" selected>
	    				${country.country_name}
	         	</option>
         	</c:if>
       	</c:forEach>
   	</select>
   
	<!-- 새로운 글 쓰기 버튼 -->
	<button id="button_new_register" type="button" style="float:right" class="btn btn-outline-info btn-fw btn-lg mb-2"
	      	onclick="location.href='${contextPath}/friend/friend-register'">글쓰기
	</button>
   
   	
	<!-- 검색 설정 초기화 버튼 -->
  	<button id="button_reset" type="button" class="btn btn-outline-warning btn-icon-text">
  		<i class="mdi mdi-reload btn-icon-prepend"> Reset </i> 
  	</button>
	  
	<!-- 검색 버튼 -->	
	<div class="input-group">
		<input id="search_box" name="keyword" type="text" value='<c:out value="${frnd_page.keyword}"/>' class="form-control" placeholder="제목 또는 해시태그를 입력해주세요" style="color: white" aria-label="Recipient's username" aria-describedby="basic-addon2">
	  		<div class="input-group-append">
		    	<button id="button_search" class="btn btn-outline-success btn-icon-text" type="button">
		    		<i class="mdi mdi-checkbox-marked-outline">&nbsp;Search </i>
		      	</button>
	  		</div>
	</div>
	
	<input name="frnd_startdate" class="form_calendar" type="hidden" />
	<input name="page_num" type="hidden" value = "1"/>
</form>
</div>
<section style = "width : 100%">
<div class="row mt-2" id="start_div">

   <c:forEach items="${frnd_list}" var="friend">
   
       <div class="col-xl-3 col-sm-6 grid-margin stretch-card post_detail" data-frnd_no = "${friend.frnd_no}">

         <div class="card">
           <div class="card-body">           
             <div class="row">
               <div class="col-12"> <!-- 이미지 삽입 위치 -->
                <c:url value = "/friend_display_upload_file" var = "url">
               	 <c:param name="file_name" value = "C:/tmz_upload/friend/${friend.attach_file_list[0].fuploadpath }/${friend.attach_file_list[0].fuuid }-${friend.attach_file_list[0].ffilename }"/>
                </c:url>
                 <img src="${url }"
                  class="rounded" width="100%" height="200" alt="이미지가 없습니다."/>
                 <div class="d-flex align-items-center align-self-start my-2">
                    <c:if test="${friend.frnd_status == false}">
                       <h3 class="text-success font-weight-bold mt-3 mb-0" 
                          style="font-family:HY헤드라인M;"> 모집 중
                       </h3>
                       
                       <h5 class="text-secondary mt-4 ml-3">
                          <c:out value="${friend.frnd_now_mem}"/>/ 
                            <c:out value="${friend.frnd_member_cnt}"/>
                       </h5>
                    </c:if>
                       
                    <c:if test="${friend.frnd_status == true}">
                       <h3 class="text-danger font-weight-bold mt-3 mb-0" 
                          style="font-family:HY헤드라인M;"> 모집 마감
                       </h3>
                    </c:if>
               
                 </div>
               </div>            
             </div>             
             
             <!-- 표지 페이지에 여행지, 작성자, 여행일자 표시 -->
             <h6 class="text-secondary font-weight-normal my-3">
             	<i class="mdi mdi-airplane-landing">
            		<c:out value="${friend.frnd_city}"/>, 
                    <c:out value="${friend.frnd_country}"/>
              	</i> 
             </h6>
            
             <h6 class="text-secondary font-weight-normal my-3">                 
               	<i class="mdi mdi-account"></i>
              		<c:out value="${friend.frnd_writer}"/>
             </h6>  
             
             <h6 class="text-secondary font-weight-normal mb-3">
                <i class="mdi mdi-calendar">
                	<fmt:formatDate pattern = "YYYY-MM-dd" value="${friend.frnd_startdate}"/>
               		&nbsp;~ &nbsp;
               		<fmt:formatDate pattern = "YYYY-MM-dd" value="${friend.frnd_enddate}"/>
           		</i>
       		 </h6>
                        
           </div>
         </div>
         
       </div>
   
    </c:forEach>
</div>
<button type="button" id = "more_scroll" class="btn btn-outline-secondary btn-block">더보기</button>
</section>


<script>
var csrfHeaderName = "${_csrf.headerName}"; 
var csrfTokenValue = "${_csrf.token}";
var scroll_count = 1;

$("#more_scroll").on("click", function(){

	scroll_count += 1;
	var keyword = frmSendValue.find("input[name=keyword]").val();
	var search_date = document.getElementById("search_date").value;
	var continent_value = $("#selected_continent option:selected").val(); 
	var country_value = $("#selected_country option:selected").val();
	
   	if ($("#selected_continent option:selected").val() == "-- 대륙 --") {
   		continent_value = null;
   	}
	
	if ($("#selected_country option:selected").val() == "-- 국가 --") {
		country_value = null;
	}
	
	var friend_paging = {keyword : keyword, frnd_startdate : search_date, continent_name : continent_value, country_name : country_value, page_num : scroll_count};
	
	$.ajax({
		type : "post",
		url : "${contextPath}/friend/friend-list/friend-page",
		data : JSON.stringify(friend_paging),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		beforeSend: function(xhr) {
			  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
			 },	
		success : function(result, status, xhr){
			var list_start = $("#start_div");
			var str = '';
 			
			$(result).each(function(i, obj) {
				
				var list_file_path = 
					encodeURIComponent(obj.attach_file_list[0].frepoPath + "/" + 
									   obj.attach_file_list[0].fuploadpath +  "/" + 
									   obj.attach_file_list[0].fuuid + "-" + 
									   obj.attach_file_list[0].ffilename);
				
				const date1 = new Date(obj.frnd_startdate);
				const date2 = new Date(obj.frnd_enddate);
				
				var start_year = date1.getFullYear();
				var start_month = ('0' + (date1.getMonth() + 1)).slice(-2);
				var start_day = ('0' + date1.getDate()).slice(-2);
				
				var end_year = date2.getFullYear();
				var end_month = ('0' + (date2.getMonth() + 1)).slice(-2);
				var end_day = ('0' + date2.getDate()).slice(-2);

				var start_date = start_year + '-' + start_month  + '-' + start_day;
				var end_date = end_year + '-' + end_month  + '-' + end_day;
				
					
				str += '<div class="col-xl-3 col-sm-6 grid-margin stretch-card post_detail" data-frnd_no = "' + obj.frnd_no + '">'
					+  '	<div class="card">'
					+  '		<div class="card-body">'
					+  '             <div class="row">'				
					+  '				<div class="col-12">'
					+  '					<img src="${contextPath}/friend_display_upload_file?file_name=' + list_file_path + '" '
					+  '						 class="rounded" width="100%" height="200" alt="이미지가 없습니다."/>'
					+  '					<div class="d-flex align-items-center align-self-start my-2">';
				
				
					if (obj.frnd_status == false) {
						
						str += '				<h3 class="text-success font-weight-bold mt-3 mb-0"'
							+  '					style="font-family:HY헤드라인M;"> 모집 중'
							+  '				</h3>'
							+  '				<h5 class="text-secondary mt-4 ml-3">'
							+  						obj.frnd_now_mem + "/" + obj.frnd_member_cnt
							+  '				</h5>';
							
					}
				
					if (obj.frnd_status == true) {
						
						str += '				<h3 class="text-danger font-weight-bold mt-3 mb-0"'
						    +  '					style="font-family:HY헤드라인M;"> 모집 마감'
						    +  '				</h3>';
						    
					}
					
					str += '					</div>'
						+  '				</div>'
						+  '			</div>';
					
					str += '			<h6 class="text-secondary font-weight-normal my-3">'
						+  '				<i class="mdi mdi-airplane-landing">'
						+  						obj.frnd_city + ", &nbsp;" + obj.frnd_country
						+  '				</i>'
						+  '			</h6>'
						+  '			<h6 class="text-secondary font-weight-normal my-3">'
						+  '				<i class="mdi mdi-account"></i>'
						+  						'&nbsp;' + obj.frnd_writer
						+  '			</h6>'
						+  '			<h6 class="text-secondary font-weight-normal mb-3">'
						+  '				<i class="mdi mdi-calendar">'
						+  '					&nbsp;' + start_date
						+  '					&nbsp;~ &nbsp;'
						+  '					&nbsp;' + end_date
						+  '				</i>'
						+  '			</h6>'
						+  '		</div>'
						+  '	</div>'
						+  '</div>';
				
						

				
			});
			
 			if (result.length < 12) {
				
				str += '<div class = "col-12">' 
					+  '	<h2 style="text-align:center">검색하신 조건에 만족하는 모든 게시물을 확인하셨어요!</h2>'
					+  '</div>';
					
				$("button").remove("#more_scroll");
			}
				
			list_start.append(str);
				
		},
		
		error : function(er){
			alert("er");
		}
	});
})

//게시물마다 상세페이지 이동
$("#start_div").on("click", ".post_detail", function() {
   self.location = "${contextPath}/friend/friend-detail?frnd_no=" + $(this).data("frnd_no");
});

//대륙, 국가 선택 박스 Ajax
function selected_value(obj) {
	var continent_name = obj;
	var selected_country = $("#selected_country");
	var str = "";
	
	$.ajax({
		type : "get",
		url  : "${contextPath}/friend/get-country-list",
		data : {continent_name: continent_name},
		dataType : "json",
		success: function (result) {
			if (!result || Object.keys(result).length == 0) {
				str += "<option>-- 국가 --</option>"
			}
			else {
				str += '<option>-- 국가 --</option>'; 
				for (var country of result) {
					str += '<option value = "' + country.country_name + '"';
					if (country.country_name == "${frnd_page.country_name}") {
						str += " selected";
					}
					str += '>' + country.country_name + '</option>';
				}
			}
			selected_country.html(str);
		}
	});	
}

//대륙, 국가 리스트 함수
function selected_continent2(obj) {
	var selected_continent = $(obj).val();
	selected_value(selected_continent);

}


//변수 선언
var frmSendValue = $("#frmSendValue");
var form_calendar = $(".form_calendar");

//검색 설정 초기화 버튼 이벤트
//input 초기화를 위해 <select> 태그의 초기 비어있는 박스를 복사해서 저장
var cloned_select_box_1 = cloned_select_box_1; 
var cloned_select_box_2 = cloned_select_box_2;

$("#button_reset").on("click", function() {
 	$("#selected_continent").val("");
	$("#selected_country").val("");
	$("#search_box").val("");
	$(".calendar_value").val("");
	
	frmSendValue.submit();
});

$(document).ready(function() {	
	cloned_select_box_1 = $("#selected_continent").html();
	cloned_select_box_2 = $("#selected_country").html();
});


//검색 버튼 클릭 이벤트
$("#button_search").on("click", function() {
	var start_date = document.getElementById("search_date").value;
	var calendar_value = $(".calendar_value").val();
	
	//검색 이벤트가 실행되지 않도록 하는 조건문	
   	if ( ((frmSendValue.find("input[name=keyword]").val() == null) ||
		   (frmSendValue.find("input[name=keyword]").val() == "")) &&
		( $("#selected_continent option:selected").val() == null || 
		   $("#selected_continent option:selected").val() == "-- 대륙 --" ) &&
		( $("#selected_country option:selected").val() == null || 
		   $("#selected_country option:selected").val() == "-- 국가 --" ) &&
	   ((start_date == null) || (start_date == "")) ) {
 		
		alert("검색 조건을 다시 확인해주세요");
		return false;
	}
	
   	if ($("#selected_continent option:selected").val() == "-- 대륙 --") {
   		$("#selected_continent").remove();
   	}
	
   	if ($("#selected_country option:selected").val() == "-- 국가 --") {
   		$("#selected_country").remove();
	}
   	
   	if (!(frmSendValue.find("input[name=keyword]").val()) ||
 		   (frmSendValue.find("input[name=keyword]").val() == "")) {
   		frmSendValue.find("input[name=keyword]").remove();
   	}
    
   	if (!(calendar_value) || (calendar_value == "")) {
   		frmSendValue.find("input[name=frnd_startdate]").remove();
   	}
   	else {
   		frmSendValue.find("input[name=frnd_startdate]").val(calendar_value);
   	}
   	
	frmSendValue.submit();
});

//글쓰기 버튼 눌렀을 때 alert
<sec:authorize access="!hasAnyRole('ROLE_USER', 'ROLE_ADMIN', 'ROLE_SUPER')">
$("#button_new_register").on("click", function() {
	alert("로그인 후, 이용 가능합니다.");
});
</sec:authorize>


$(document).ready(function(){
	if($("#selected_continent option:selected").val() || 
	   $("#selected_continent option:selected").val() != "-- 대륙 --"){
		selected_value("${frnd_page.continent_name}");
	}
})
</script>
<%@ include file = "../../templet/footer_list.jsp"%>
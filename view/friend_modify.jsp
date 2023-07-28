<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@ include file="../../templet/header.jsp"%>
<div class="col-md-12 grid-margin stretch-card">
	<div class="card">

		<div class="card-body px-5">

			<div class="img_wrapper my-4" style="width: 100%; height: 350px;">
				
			</div>
			
			<form name="frm_modify" id="frm_modify">
			<div class="d-flex flex-row justify-content-between mx-2">
				<div class="mb-4">
					<p class = "text-muted">제목</p>
					<input type="text"
						class="form-control form-control-lg" name="frnd_title"
						value="${frnd_info.frnd_title }"
						style="width: 400px; color: white;"/>
				</div>
				
				<div>
				
					<div class="row">
						<p class = "col-12 text-muted mb-3">여행기간</p>
						<input type="date"
						 max = "2099-12-31" name="frnd_startdate" class="form-control mr-2"
							value="<fmt:formatDate pattern = 'YYYY-MM-dd' value='${frnd_info.frnd_startdate }'/>"
							style="width: 150px;">
						<input type="date" max = "2099-12-31" name="frnd_enddate" class="form-control"
							value="<fmt:formatDate pattern = 'YYYY-MM-dd' value='${frnd_info.frnd_enddate }'/>"
							style="width: 150px;">
					</div>
					
				</div>
			</div>
			<div class="d-flex flex-row justify-content-between ml-4">
				<div class = "row">
					<div class = "d-flex flex-row justify-content-between col-4">
						<p class = "text-muted pl-0">여행장소</p>
					</div>
					<div class = "d-flex flex-row justify-content-between">
					<div class = "mr-2">
						<select name="frnd_continent" id = "selected_continent"
							class="js-example-basic-single select2-hidden-accessible"
							style="width: 150px;" data-select2-id="2" tabindex="-1"
							aria-hidden="true" onchange = "selected_value(this)"
							>
								<c:forEach items="${continent_info }" var="continent">
									<option value="${continent.continent_name }" 
										<c:if test = "${frnd_info.frnd_continent == continent.continent_name}">selected</c:if> >
										${continent.continent_name }
									</option>
								</c:forEach>
						</select>
					</div>
						<select name="frnd_country" id = "selected_country"
							class="js-example-basic-single select2-hidden-accessible"
							style="width: 150px;" data-select2-id="1" tabindex="-1"
							aria-hidden="true"
						>
							<c:forEach items="${country_info }" var="country">
								<option value="${country.country_name }" 
								<c:if test = "${frnd_info.frnd_country == country.country_name}">selected</c:if> >
									${country.country_name }
								</option>
							</c:forEach>
						</select>
					
					<input type="text" name="frnd_city" class="form-control ml-2"
						style="width: 150px; color: white;"
						id="exampleInputCity1" value="${frnd_info.frnd_city }">
						
					</div>
				</div>
				
				<div class="row mb-3">
					<p class = "col-12 text-muted">모집인원(1~99)</p>
					<input type = "number" name = "frnd_member_cnt" class = " ml-2 form-control" style="width: 150px;" value = "${frnd_info.frnd_member_cnt }"/>
				</div>
				
			</div>

			<div class="col-12">
				<div class="preview-list">
					<div class="form-group mt-4">
						<textarea name="frnd_content" class="form-control"
							id="exampleTextarea1" rows="20" style="color: white;">${frnd_info.frnd_content}</textarea>
					</div>
				</div>
			</div>
			
			<div class = "col-7 my-4">
				<p class = "col-12 text-muted pl-0">게시물 태그 (스페이스바로 태그 구분)</p>
				<input type="text" name = "frnd_tag" class="form-control" style = "color : white;" value = "${frnd_info.frnd_tag}" maxlength="30" placeholder="게시물에 대한 태그를 작성해주세요">
			</div>
			
			<div class="form-group">
         	<label>첨부 파일</label>
	         	<div class="input-group col-xs-12 upload_div">
	         		<input id="input_file" type="file" name="upload_files" class="file-upload-default file_upload_input">
	         	
	         		<input type="text" class="form-control file-upload-info file_upload_result" disabled placeholder="Upload Image"/>
					<span class="input-group-append">
	               		<button id="file_upload_button" class="file-upload-browse btn btn-primary" type="button">Upload</button>
					</span>                
				</div>
	        </div>
	        
	        <div class = "file_frm">
	        	<%--파일의 정보들이 담긴 인풋 히든값들 --%>
	        </div>
	        
	        <input type="hidden" name="frnd_writer" value = "${frnd_info.frnd_writer }"/>
			<input type="hidden" name="frnd_no" value="${frnd_info.frnd_no }" />
			<input type = "hidden" name = "frnd_delflag" value = "${frnd_info.frnd_delflag }"/>
			<sec:csrfInput/>
			</form>

			<div class="float-right mt-3">
				<button type="button" id="modify_button"
					class="btn btn-outline-primary btn-icon-text ml-1">
					<i class="mdi mdi-border-color btn-icon-prepend"></i>수정
				</button>
				<button type="button" id="delete_button"
					class="btn btn-outline-danger btn-icon-text ml-1">
					<i class="mdi mdi-file-excel btn-icon-prepend"></i>삭제
				</button>
				<button type="button" id="cancel_button"
					class="btn btn-outline-secondary btn-icon-text ml-1">
					<i class="mdi mdi-file-restore btn-icon-prepend"></i>취소
				</button>
			</div>

		</div>
	</div>
</div>

<%-- 페이지 이동 처리 스크립트--%>
<script>
	var frm = $("#frm_modify");
	var loginUser = "";
	<sec:authorize access = "isAuthenticated()">
		loginUser = '<sec:authentication property = "principal.username"/>';
	</sec:authorize>
	var file_frm = $(".file_frm");

	$("#cancel_button").on("click", function() { // 취소 버튼 클릭시
		frm.find("input[name=_csrf]").remove();
		frm.attr("method", "get");
		frm.attr("action", "${contextPath}/friend/friend-detail");
		frm.submit();
	});
	
	$("#delete_button").on("click", function(){
		if(confirm("게시물을 삭제하시겠습니까?")){
			frm.attr("method", "post");
			frm.attr("action", "${contextPath}/friend/friend-delete");
			frm.submit()
		}
	});

	$("#modify_button").on("click", function() { // 수정 버튼 클릭시
		
		// 수정 유효성 검사
		var frnd_title = frm.find("input[name=frnd_title]").val()
		var frnd_startdate = frm.find("input[name=frnd_startdate]").val();
		var frnd_enddate = frm.find("input[name=frnd_enddate]").val();
		var frnd_continent = frm.find("select[name=frnd_continent]").val();
		var frnd_country = frm.find("select[name=frnd_country]").val();
		var frnd_city = frm.find("input[name=frnd_city]").val();
		var frnd_now_mem = "${frnd_info.frnd_now_mem}";
		var frnd_member_cnt = frm.find("input[name=frnd_member_cnt]").val();
		var frnd_content = frm.find("textarea[name=frnd_content]").val();
		frm.find("input[name=frnd_writer]").val(loginUser);
		
		if(frnd_title.length == 0 || frnd_title == null){
			alert("제목을 입력해주세요");
			return;
		}
		if(frnd_startdate > frnd_enddate){
			alert("여행기간 설정을 확인해 주세요");
			return;
		}else{
			var date = new Date();
			var month = date.getMonth()+1 > 10 ? date.getMonth()+1 : "0" + (date.getMonth()+1);
			var today = date.getFullYear() + "-" + month + "-" + (date.getDate() < 10 ? "0" + date.getDate() : date.getDate());
			if(today >= frnd_startdate){
				alert("여행기간 설정을 확인해 주세요");
				return;
			}
		}
		if(frnd_continent.length == 0 || frnd_continent == null){
			alert("대륙 선택을 해주세요");
			return;
		}
		if(frnd_country.length == 0 || frnd_country == null){
			alert("여행 국가를 선택해주세요");
			return;
		}
		if(frnd_city.length == 0 || frnd_city == null){
			alert("여행 도시를 선택해 주세요");
			return;
		}
		if(frnd_member_cnt.length == 0 || frnd_member_cnt == null || frnd_member_cnt <= 0 || frnd_member_cnt > 99){
			alert("모집인원은 1명이상 99명 이하여야 합니다");
			return;
		}else if(frnd_member_cnt < frnd_now_mem){
			alert("모집인원이 현재 모집된 인원보다 적습니다");
			return;
		}
		if(frnd_content.length == 0 || frnd_content == null){
			alert("내용을 입력해 주세요");
			return;
		}
		//.end 유효성 검사
		
		frm.attr("method", "post");
		frm.attr("action", "${contextPath}/friend/friend-modify");
		frm.submit();
	});

// 국가<select>태그의 리스트 가져오기
function selected_value(obj) {
	var continent_name = $(obj).val();
	var selected_country = $("#selected_country");
	var str = "";
	$.ajax({
		type : "get",
		url  : "${contextPath}/friend/get-country-list",
		data : {continent_name: continent_name},
		dataType : "json",
		success: function (result) {
			if (Object.keys(result).length == 0 || !result) {
				str += "<option>--없음--</option>"
			}
			else {
				for(var country of result){
					str += '<option value = "' + country.country_name + '">' + country.country_name + '</option>';
				}
			}
		selected_country.html(str);
		}
	});//.end ajax
}//.end selected_value(obj)


//파일처리 스크립트
//이미지 표시
function show_upload_image(upload_result) {
	
	var file_upload_result = $(".img_wrapper");
	var str = "";
	
	$(upload_result).each(function(obj) {
		
		var upload_file_path = 
				encodeURIComponent(upload_result[0].frepoPath + "/" + 
								   upload_result[0].fuploadpath +  "/" + 
								   upload_result[0].fuuid + "-" + 
								   upload_result[0].ffilename);
		console.log("encodeURIComponent 처리 상태: " + upload_file_path);
		
		str += "<img src='${contextPath}/friend_display_upload_file?file_name=" + upload_file_path + "'"
			+  "	 alt='이미지 없음' class='rounded' width='100%' height='100%' /> ";
	});
	
	var str_input_hidden = "";
	str_input_hidden += '<input type="hidden" name="attach_file_list[0].fuuid" value="' + upload_result[0].fuuid + '" >'
	 				 +  '<input type="hidden" name="attach_file_list[0].ffilename" value="' + upload_result[0].ffilename + '" >'
	 				 +  '<input type="hidden" name="attach_file_list[0].fuploadpath" value="' + upload_result[0].fuploadpath + '" >';
	file_frm.html(str_input_hidden);
	
	file_upload_result.html(str);
}


function check_upload_file(file_name, file_size) {
	var max_size_allowed = 10485760;
	var reg_exp_for_file_extention = /(.*)\.(jpg|jpeg|png|bmp)$/i ;
		
	//최대 허용 크기 제한 검사
	if (file_size >= max_size_allowed) {
		alert("업로드 파일의 제한된 크기(10MB)를 초과했습니다.");
		return false;
	}
	
	//업로드 파일의 확장자 검사
	if (!reg_exp_for_file_extention.test(file_name)) {		
		alert("이미지 형식 이외의 파일은 업로드할 수 없습니다.");
		return false;
	}
	
	return true;
}

var clone_input_file = $(".file_upload_result").clone();


var csrfHeaderName = "${_csrf.headerName}"; 
var csrfTokenValue = "${_csrf.token}";

$(".upload_div").on("change", "input[type='file']", function(e) {
	
	var form_data = new FormData();
	
	var input_files = $(this);
	
	var files = input_files[0].files;

	if (!check_upload_file(files[0].name, files[0].size)) {

		$('.file_upload_result').val('');		
		return false;
	}
	
	form_data.append("upload_files", files[0]);

	
$.ajax({
		type : 'post',
		url : '${contextPath}/friend_file_upload_ajax_action',
		processData : false,
		contentType : false,
		data : form_data,
		beforeSend: function(xhr) {
			  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
			 },	
		dataType : 'json',
		success : function(upload_result, status) {		
			
			show_upload_image(upload_result);
			
			$(".file_upload_result").html(clone_input_file.html());
		}
	})
});

//.end 파일처리
</script>


<script>
	$(document).ready(function(){
		$.ajax({
			type : "get",
			url : "${contextPath}/friend_file_get/" + "${frnd_info.frnd_no}",
			dataType : "json",
			success : function(file_result, status, xhr){
				
				show_upload_image(file_result);
				
				$(".file_upload_result").html(clone_input_file.html());
				
			},error : function(er){
				alert("er");
			}
		});//.end ajax
	});//.end document.ready()
</script>


<%@ include file="../../templet/footer.jsp"%>

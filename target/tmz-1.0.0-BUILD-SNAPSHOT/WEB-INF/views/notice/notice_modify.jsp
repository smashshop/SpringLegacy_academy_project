<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@ include file = "../../templet/notice_header.jsp"%> 
<%@ include file = "../../templet/notice_button.jsp"%>  
<header>
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
</header>


<div class="col-md-12 grid-margin stretch-card my-4">
	<div class="card pb-5"><br><br>

		<form name="notice_modify_board" method="post" id="notice_modify">
			<sec:csrfInput />
			<!-- 이게 있어야 POST값이 처리가 됨  -->

			<div class="row mx-5 mt-3"
				style="border: 1px solid gray; border-radius: 20px;">
				<div class="card-body col-12 px-5">

					<div class="form-group">
					<p><h3 style="color: red">★공지사항 수정중 입니다★</h3><br><br>
						<label><h4>글번호</h4></label><input class="form-control" name="ntc_no" style="background-color: #000000"
							value='<c:out value="${notice.ntc_no}"/>' readonly="readonly" /><br>
					</div>

					
				  <div class = "d-flex flex-row justify-content-between" style="float:left;">
	              <div class = "mr-2" >
	                 <select name="notice_continent" id = "selected_continent"
	                    	  class="js-example-basic-single select2-hidden-accessible"
	                    	  style="width: 150px;" data-select2-id="2" tabindex="-1"
	                    	  aria-hidden="true" onchange = "selected_value(this)">
	                     <option><c:out value="${notice.ntc_continent}" /></option>
		    		  <c:forEach items="${countinent_list}" var="region"><!-- countinent_list 이거는 컨트롤러에서 옴!!! -->
			    		  <option value = "${region.continent_name}">${region.continent_name}</option>
			    	  </c:forEach>
	                 </select>
	              </div>
	              <div>
                  <select name="notice_country" id = "selected_country"
	                   	  class="js-example-basic-single select2-hidden-accessible"
	                   	  style="width: 150px;" data-select2-id="1" tabindex="-1"
	                   	  aria-hidden="true">
	                  <option><c:out value="${notice.ntc_country}" /></option>
			      	  <c:forEach items="${country_list}" var="country">
			         	  <option class="selected_country_2" value = "${country.country_name}">${country.country_name}</option>
			       	  </c:forEach>
	              </select>
              </div>
	              </div>
	            
					<div class="form-group"><br><br><br>
						<label><h4>제목</h4></label><input class="form-control" name="ntc_title" style="background-color: #000000"
							value='<c:out value="${notice.ntc_title}"/>' /><br>
					</div>
					<div class="form-group">
						<label><h4>내용</h4></label>
						<textarea class="form-control" rows="20" name="ntc_content"  style="background-color: #000000"><c:out
								value="${notice.ntc_content}" /></textarea><br>
					</div>
					<div class="form-group">
						<label><h5>작성자</h5></label> <input class="form-control" name="ntc_writer"  style="background-color: #000000"
							value='<c:out value="${notice.ntc_writer}"/>' readonly="readonly" /><br>
					</div>
					<!-- 첨부파일 표시 -->
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">파일첨부</div>
								<div class="panel-body">
									<div class="form-group upload_div">
										<input id="input_file" type="file" name="upload_files"
											multiple><br>
									</div>
									<div class="form-group file_upload_result">
										<ul>
											<!-- 업로드 후 결과처리 로직이 표시될 영역 -->
										</ul>
									</div>
								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<!-- /.row -->
				</div>
			</div>

			<div class="mt-5 mb-4 col-12">
				<div class="float-right mr-3">
    			
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<%-- <sec:authorize access="isAuthenticated()">  추가: 로그인 유무 확인
						<sec:authentication property="principal" var="principal" /> 	추가: 로그인 계정 변수화 --%>
	
               			<button type="button" id="notice_modify_button"
								class="custom-btn btn-3 ebtn-icon-text btn_noticemodi"
								data-oper="modify">
								<span><i class="mdi mdi-border-color"></i>수정</span>
							</button>
							<button type="button" id="notice_remove_button"
								class="custom-btn btn-5 btn-icon-text ml-1 btn_noticemodi"
								data-oper="remove">
								<span><i class="mdi mdi-file-check btn-icon-prepend"></i>삭제</span>
							</button>
					</sec:authorize>
					
					<button type="button" id="notice_list_button"
						class="custom-btn btn-8  btn-icon-text ml-1 btn_noticemodi"
						data-oper="list">
						<span><i class="mdi mdi-file-check btn-icon-prepend "></i>취소</span>
					</button>
					
				</div>
			</div>
			<!-- 전달할 hidden 유형의 input 요소들이 추가되어 값들이 전달될 비어있는 form -->
			<input type="hidden" name="notice_page_num"
				   value="${notice_pagingDTO.notice_page_num }" /> <input
				   type="hidden" name="notice_amount_per_page"
				   value="${notice_pagingDTO.notice_amount_per_page }" /> <input
				   type='hidden' name='notice_scope'
				   value='${notice_pagingDTO.notice_scope}'><input
				   type='hidden' name='notice_keyword'
				   value='${notice_pagingDTO.notice_keyword}'>
			<sec:csrfInput />
		</form>
	</div>
</div>


<script>

<%-- var loginUser = "";
<sec:authorize access="hasRole('ROLE_ADMIN')">
 loginUser = '<sec:authentication property="principal.username"/>';로그인 사용자명 변수에 저장

</sec:authorize> --%>

var notice_modify = $("#notice_modify"); // 위에 정의된 form 메소드
/* 
 var login_user = "";
<sec:authorize access="isAuthenticated()">
login_user = '<sec:authentication property="principal.username"/>';
</sec:authorize>  */
$(".btn_noticemodi").on("click", function(e){ 
 
 var operation = $(this).data("oper"); //각 버튼의 data-xxx 속성에 설정된 값을 저장
 var ntc_writer_val = '<c:out value="${notice.ntc_writer}"/>';
//    alert("operation: "+ operation + ", ntc_writer_val: " + ntc_writer_val);
 if(operation == "list"){//게시물 목록 화면 요청
    
    notice_modify.empty();
    notice_modify.attr("action","${contextPath}/notice/notice-list").attr("method","get");
    notice_modify.submit();
     
    } 
 else if(operation == "modify"){

	 var str_files_inputhidden = ""; //여기서부터는 추가 시작
     var notice_continent = notice_modify.find("select[name=notice_continent]").val();	//val는 선택한 옵션값
     var notice_country = notice_modify.find("select[name=notice_country]").val();
     //업로드 결과의 li 요소 선택하여 각각에 대하여 다음을 처리
     $(".file_upload_result ul li").each(function(i, obj){
     var obj_li = $(obj);
   	  str_files_inputhidden
      += " <input type='hidden' name='notice_file_list["+i+"].nuuid' value='"+obj_li.data("nuuid")+"'>"
      + " <input type='hidden' name='notice_file_list["+i+"].nuploadpath' value='"+obj_li.data("nuploadpath")+"'>"
      + " <input type='hidden' name='notice_file_list["+i+"].nfilename' value='"+obj_li.data("nfilename")+"'>"
      + " <input type='hidden' name='notice_file_list["+i+"].nfiletype' value='"+ obj_li.data("nfiletype")+"'>" ;

   });
//   	    alert(str_files_inputhidden); //테스트 후, 주석처리할 것
        notice_modify.append(str_files_inputhidden); //form에 추가, //여기까지 추가 끝
        notice_modify.append(" <input type='hidden' name='ntc_continent' value='"+notice_continent+"'>");       
        notice_modify.append(" <input type='hidden' name='ntc_country' value='"+notice_country+"'>");
        notice_modify.attr("method", "post");
        notice_modify.attr("action", "${contextPath}/notice/notice-modify");

}

else if(operation == "remove"){
	notice_modify.attr("action", "${contextPath}/notice/notice-remove");
} 
 	notice_modify.submit();
 	alert("삭제되었습니다.");
});

<%-- 첨부파일 표시 처리 --%>
<%-- HTML에서 일어나는 모든 Ajax 전송 요청에 대하여 csrf 토큰값이 요청 헤더에 설정됨 --%>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
/* $(document).ajaxSend(function(e, xhr, options){ 
    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});  */

var notice_value = '<c:out value="${notice.ntc_no}"/>';
//첨부파일 정보 표시 함수
function show_uploaded_files(upload_result) {
   if(!upload_result || upload_result.length == 0){
    return ;
    }
    var file_upload_result = $(".file_upload_result ul");
    var str = "";
 $(upload_result).each(function(i, obj) {
    if (obj.nfiletype=="F") { //이미지가 아닌 경우

 //encodeURIComponent로 처리된 첨부파일(전체 경로 포함, 삭제 시 필요): 
    var called_path_file_name = encodeURIComponent(obj.notice_repo_path + "/" + obj.nuploadpath + "/" +
                               obj.nuuid + "_" + obj.nfilename);
    console.log("전체 경로포함 파일이름: " + called_path_file_name);

    //아이콘 이미지 및 uuid 없는 파일이름 표시
    str += "<li data-repopath='" + obj.repoPath + "' data-nuploadpath='" + obj.nuploadpath + "'"
       + " data-nuuid='" + obj.nuuid + "' data-nfilename='" + obj.nfilename + "'"
       + " data-nfiletype='F' style='height:25px;'>" //수정
       + " <img src='${contextPath}/resources/assets/images/file-icons/128/005-database.png' alt='No Icon' "
       + " style='height: 18px; width: 18px;'>&nbsp;&nbsp;" //추가
       + obj.nfilename
      // + " <span data-filename='"+calledPathFileName+"' data-filetype='F'>[삭제]</span>"//버튼으로 교체
       + " &nbsp;<button type='button' class='btn btn-danger btn-xs' "
       + " data-nfilename='" + called_path_file_name + "' data-nfiletype='F'>X</button>"
       + "</li>";
    } else if (obj.nfiletype=="I") { //이미지파일인 경우

 //encodeURIComponent로 처리된 썸네일파일(전체 경로 포함):
 var thumbnail_file_path =
    encodeURIComponent(obj.notice_repo_path + "/" + obj.nuploadpath + "/s_" + obj.nuuid + "_" + obj.nfilename);
    console.log("encodeURIComponent 처리된 썸네일이름: " + thumbnail_file_path);
    //업로드 된 파일이름(uuid 포함된 이름, 삭제 시 필요)
    //var originPathImageFileName = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
    //originPathImageFileName = originPathImageFileName.replace(new RegExp(/\\/g),"/");
    //썸네일 및 uuid 없는 파일이름 표시
    str += "<li data-notice_repo_path='" + obj.notice_repo_path + "'"
       + " data-nuploadpath='" + obj.nuploadpath + "'"
       + " data-nuuid='" + obj.nuuid + "'"
       + " data-nfilename='" + obj.nfilename + "'"
       + " data-nfiletype='I' style='height:25px;' >" //수정
       + " <img src='${contextPath}/notice_display_thumbnail_file?file_name=" + thumbnail_file_path + "'"
       + " alt='No Icon' style='height: 18px; width: 18px;'>&nbsp;&nbsp;" //추가
       + obj.nfilename
       // + " <span data-filename='" + thumbnailFilePath + "' data-filetype='I'>[삭제]</span>"//버튼으로 교체
       + " &nbsp;<button type='button' class='btn btn-danger btn-xs'"
       + " data-nfilename='" + thumbnail_file_path + "' data-nfiletype='I'>X</button>"
       + "</li>";
    }
 });

 file_upload_result.append(str);
}

//업로드 파일의 확장자 및 최대 파일 크기 검사 함수
function check_uploadfile(nfilename, file_size) {
    // 확장자에 대한 정규식 및 최대 허용크기(10MB) 저장변수
    var max_size_allowed = 52428800;
    var reg_exp_for_file_extention = /(.*)\.(exe|sh|zip|alz)$/i ;
 
    //최대 허용 크기 제한 검사
    if (file_size >= max_size_allowed) {
       alert("업로드 파일의 제한된 크기(50MB)를 초과했습니다.");
       return false;
    }
 
    //업로드파일의 확장자 검사:
    if (reg_exp_for_file_extention.test(nfilename)) {
       alert("해당 종류(exe/sh/zip/alz)의 파일은 업로드할 수 없습니다.");
       return false;
    }
       return true;
   }
   //input 초기화를 위해 div 요소의 비어있는 input 요소를 복사해서 저장함.
   var clone_input_file = $(".upload_div").clone() ; //<-- 파일업로드 처리 함수위에 추가
      //파일업로드 처리
      $(".upload_div").on("change", "input[type='file']", function(e) {
       //FormData() Ajax 파일 전송 시에 사용되는 Web API 클래스의 생성자
       var form_data = new FormData();
       //선택된 input 요소를 변수에 저장
       var input_files = $(this);
       //inputFiles에 저장된 파일들을 files 변수에 저장: [0]은 첫번째 input 요소를 의미
       var files = input_files[0].files;
       console.log(files);
 
       //formdata 객체에 파일추가
       for(var i = 0; i < files.length ; i++) {
          if (!check_uploadfile(files[i].name, files[i].size)) { //파일 확장자 및 최대크기검사 실행
          return false; //검사를 만족하지 못하면 false를 반환하고 파일업로드 중지
       }
 
       //uploadFiles 파라미터로 file 정보 추가
       form_data.append("upload_files", files[i]);
       }
 

//url 키에 명시된 주소의 컨트롤러에게 formData 객체를 POST 방식으로 전송.
       $.ajax({
          type: 'post',
          url: '${contextPath}/notice_file_upload_ajax_action',
          processData: false, //contentType에 설정된 형식으로 data를 처리하지 않음.
          contentType: false, //contentType에 MIME 타입을 지정하지 않음.
          beforeSend: function(xhr) {
              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
           },
          data: form_data,
          dataType: 'json', //수정
          success: function(upload_result, status){
//             alert("첨부파일의 업로드 완료: " + status);
             $(".upload_div").html(clone_input_file.html()); //파일이름이 선택된 기존 input을 초기화
             show_uploaded_files(upload_result);
             }
          })
      });
         
      //파일 삭제(수정화면): 브라우저 표시 항목만 삭제.
      //$(".fileUploadResult").on("click","li span", function(e){
      $(".file_upload_result").on("click","button", function(e){
          //this: span 또는 button
          console.log("파일삭제(화면에서 항목만 삭제)");
       
          if (confirm("이 파일을 삭제하시겠습니까?")){
             var target_li = $(this).closest("li");
             target_li.remove();
//             alert("파일이 삭제되었습니다")
          } else {
//             alert("파일 삭제가 취소되었습니다.")
          }
      });

      
      
      //대륙, 국가 선택 박스 Ajax
        function selected_value(obj) {
            var form_obj = $("form[role='form']");
        	var continent_name = $(obj).val();
        	var selected_country = $("#selected_country");
        	var str = "";
        	
        	$.ajax({
        		type : "get",
        		url  : "${contextPath}/notice/get-country-list",
        		data : {continent_name: continent_name},
        	 	beforeSend: function(xhr) {
                 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
                },
        		dataType : "json",
        		success: function (result) {
        			if (!result || Object.keys(result).length == 0) {
        				str += "<option>-- 없음 --</option>"
        			}
        			else {
        				str += '<option>-- 국가 --</option>'; 
        				for (var country of result) {
        					str += '<option value = "' + country.country_name + '">' + country.country_name + '</option>';
        				}
        			}
        			selected_country.html(str);
        		}
        	});	
        }
      
      
      
$(document).ready(function(){//페이지 로딩 시 함수 실행, 전체 JavaScript 내용 중 제일 마지막에 위치해야 함

    $.ajax({
       type: 'get',
       url: '${contextPath}/notice/notice_get_files',
       data: {ntc_no: notice_value}, 
       dataType: 'json',
       success: function(file_list, status){
          console.log("첨부파일 목록 수집: " + status);
          show_uploaded_files(file_list);
       }
    }) //ajax end
});       
       

</script>


<%@ include file="../../templet/footer.jsp"%>

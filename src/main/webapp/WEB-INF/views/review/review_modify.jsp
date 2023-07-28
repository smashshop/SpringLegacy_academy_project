<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%--추가--%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@ include file = "../../templet/review-header.jsp"%>  
<div class="col-md-12 grid-margin stretch-card my-4">
   <div class="card pb-5">
     <%--  <div class="img_wrapper my-4" style="border-radius : 30px; width: 100%; height: 350px;">
         <img src = "${pageContext.request.contextPath }/resources/assets/images/review/img2.jpg" alt = "이미지 없음" class = "rounded" width = "100%" height = "100%"/>
      </div> --%>

         <!--    <div class="d-flex flex-row justify-content-between">
               <h1 class="card-title mb-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 공지사항</h1>
            </div> -->

		 <form role="form" id="frm_modify" method="post" name="frm_board" >
		 <sec:csrfInput />
			         <!-- 이게 있어야 POST값이 처리가 됨  -->
      <div class="row mx-5 mt-3"
         style="border: 1px solid gray; border-radius: 20px;">
         <div class="card-body col-12 px-5">
	
			 
		         
			               <div class="form-group">
			               <p><h3 style="color: red">후기 게시판 수정</h3></p><br><br>
			                  <label><h4>글번호</h4></label><input class="form-control" name="rv_no" style="background-color: #000000"
			                     value='<c:out value="${review.rv_no}"/>' readonly="readonly" /><br>
			               </div>
			               <div class="form-group">
			                  <label><h4>제목</h4></label><input class="form-control" name="rv_title" style="background-color: #000000"
			                    value='<c:out value="${review.rv_writer}"/>' /><br>
			               </div>
			               <div class = "d-flex flex-row justify-content-between" style="float:left;">
				                 <div class = "mr-2">
				                    <select name="review_continent" id = "selected_continent"
				                            class="js-example-basic-single select2-hidden-accessible"
				                            style="width: 150px;" data-select2-id="2" tabindex="-1"
				                            aria-hidden="true" onchange = "selected_value(this)">
				                        
				                        <option><c:out value="${review.rv_continent}" /></option>
				                  
				                  <c:forEach items="${continent_list}" var="continent">
				                     <option value = "${continent.continent_name}">${continent.continent_name}</option>
				                  </c:forEach>
				                    </select>
				                 </div>
				                 
				                  <select name="review_country" id = "selected_country"
				                           class="js-example-basic-single select2-hidden-accessible"
				                           style="width: 150px;" data-select2-id="1" tabindex="-1"
				                           aria-hidden="true">
				                     <option><c:out value="${review.rv_country}" /></option>
				                    <c:forEach items="${country_info}" var="country">
				                       <option class="selected_country_2" value = "${country.country_name}">${country.country_name}</option>
				                     </c:forEach>
				                 </select>
               
				                 </div>
				                 <br><br><br><br>
			               <div class="form-group">
			                  <label><h4>내용</h4></label>
			                  <textarea class="form-control" rows="10" name="rv_content"  style="background-color: #000000"><c:out
			                        value="${review.rv_content}" /></textarea><br>
			               </div>
			               <div class="form-group">
			                  <label><h5>작성자</h5></label> <input class="form-control" name="rv_writer"  style="background-color: #000000"
			                     value='<c:out value="${review.rv_writer}"/>' readonly="readonly" />
			                <br>
			               </div>
			              
			               <%-- 첨부파일 표시 --%>
							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">파일첨부</div>
										<div class="panel-body">
											<div class="form-group upload_div">
												<input id="inputFile" type="file" name="uploadFiles" multiple><br>
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
			            <div class="row">
			               <div class="col-12">
			                  <div class="preview-list">
			                     <div class="form-group float-right mr-3" >
									<br>
									<br>
						<sec:authorize access="isAuthenticated()" ><%-- 추가: 로그인 유무 확인 --%>
						 <sec:authentication property="principal" var="principal"/><%-- 추가: 로그인 계정 변수화 --%>
					 <c:if test="${principal.username eq review.rv_writer}">
						<button type="button" class="btn btn-outline-secondary btn-frmModify" id="btnModify" data-oper="modify"><i class="mdi mdi-border-color"></i>수정</button>
						<button type="button" class="btn btn-outline-danger btn-frmModify" id="btnRemove" data-oper="remove"><i class="mdi mdi-file-check btn-icon-prepend"></i>삭제</button>
						<button type="button" class="btn btn-outline-primary btn-frmModify" id="btnList" data-oper="list"><i class="mdi mdi-file-check btn-icon-prepend "></i>취소</button>
					</c:if><%-- 추가 --%>
					</sec:authorize><%-- 추가 --%>
						
						 <input type="hidden" name="review_page_num" value = "${review_pagingDTO.review_page_num }">
						 <input type="hidden" name="review_page_row_amount_per_page" value="${review_pagingDTO.review_page_row_amount_per_page }">
						 <input type='hidden' name='review_scope' value='${review_pagingDTO.review_scope}'>
						 <input type='hidden' name='review_keyword' value='${review_pagingDTO.review_keyword}'> 
                     </div>
                  </div> 
               </div>
            </div>
            <sec:csrfInput/>
            </form>
         </div>
         
			<!-- /.row -->


      </div>
   </div>
</div>
<script>

	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	/* $(document).ajaxSend(function(e, xhr, options){ 
	 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	}); */
	
	var frm_modify = $("#frm_modify"); // 위에 정의된 form 메소드
	
	var login_user = "";
	<sec:authorize access="isAuthenticated()">
	login_user = '<sec:authentication property="principal.username"/>';
	</sec:authorize> 
	$('.btn-frmModify').on("click", function(e){ 
	 //e.preventDefault(); //버튼 유형이 submit가 아니므로 설정할 필요 없음
		 var operation = $(this).data("oper"); //각 버튼의 data-xxx 속성에 설정된 값을 저장
		 var rv_writer_val = '<c:out value="${review.rv_writer}"/>';<%-- 추가 --%>
		 alert("operation: "+ operation + ", rv_writer_val: " + rv_writer_val);<%-- 기존코드 삭제 후, 추가 --%> 
		 if(operation == "list"){ //게시물 목록 화면 요청
			 //기존 페이징 데이터 input 요소 복사
			 /*  var review_page_num_input = $("input[name='review_page_num']").clone(); //추가
			 var review_page_row_amount_per_page_input = $("input[name='review_page_row_amount_per_page']").clone(); //추가
			 var review_scope_input = $("input[name='review_scope']").clone(); //추가
			 var review_keyword_input = $("input[name='review_keyword']").clone(); //추가
			 
			 frmModify.empty();
			 frmModify.attr("action","${contextPath}/review/review-list");
			 frmModify.attr("method","get");
			 frmModify.append(review_page_num_input); //추가
			 frmModify.append(review_page_row_amount_per_page_input); //추가
			 frmModify.append(review_scope_input); //추가
			 frmModify.append(review_keyword_input); //추가 */
			  
			 frm_modify.attr("method", "get");
			 frm_modify.attr("action", "${contextPath}/review/review-list");
			 frm_modify.submit();
			 } else if(operation =="modify"){
				 // 수정시에 대륙과 나라이름 추가
				 var str_input_hidden = "";
				 var review_country = frm_modify.find("select[name=review_country]").val();
				 var review_continent = frm_modify.find("select[name=review_continent]").val();
				 
				 str_input_hidden+=" <input type='hidden' name='rv_country' value='"+ review_country+"'>";
				 alert(str_input_hidden); //테스트 후, 주석처리할 것
				 frm_modify.append(str_input_hidden);
				 frm_modify.append(" <input type='hidden' name='rv_continent' value='"+ review_continent +"'>");
			
				 var str_files_input_hidden = ""; //여기서부터는 추가 시작
				 //업로드 결과의 li 요소 선택하여 각각에 대하여 다음을 처리
				 $(".file_upload_result ul li").each(function(i, obj){
				 var objLi = $(obj);
				 str_files_input_hidden
						 += " <input type='hidden' name='attach_review_file_list["+i+"].ruuid' "
						 + " value='" + objLi.data("ruuid") + "'>"
						 + " <input type='hidden' name='attach_review_file_list["+i+"].ruploadpath' "
						 + " value='" + objLi.data("ruploadpath") + "'>"
						 + " <input type='hidden' name='attach_review_file_list["+i+"].rfilename' "
						 + " value='" + objLi.data("rfilename") + "'>"
						 + " <input type='hidden' name='attach_review_file_list["+i+"].rfiletype' "
						 + " value='" + objLi.data("rfiletype") + "'>" ;
				 });
				 alert(str_files_input_hidden);
					 console.log(str_files_input_hidden); //테스트 후, 주석처리할 것
					 frm_modify.append(str_files_input_hidden); //form에 추가, //여기까지 추가 끝
					 frm_modify.attr("method","post");
					 frm_modify.attr("action", "${contextPath}/review/review-modify");
			 <%--로그인 안 한 경우--%>
			  if(!login_user){
				 alert("로그인 후, 수정/삭제가 가능합니다.");
				 return ;
			 } 
			 
			 <%--로그인 계정과 작성자가 다른 경우--%>
			 if(rv_writer_val != login_user){
				 alert("작성자만 수정/삭제가 가능합니다");
				 return ;		 
			 }
			 }else if(operation =="remove"){
				 frm_modify.attr("action", "${contextPath}/review/review-remove");
			 }
 
		 frm_modify.submit();
	 });
	//대륙, 국가 선택 박스 Ajax
	 function selected_value(obj) {
		var form_obj = $("form[role='form']");
		var continent_name = $(obj).val();
	   var selected_country = $("#selected_country");
	   var str = "";
	   $.ajax({
	      type : "get",
	      url  : "${contextPath}/review/get-country-list",
	      data : {continent_name: continent_name},
	      beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
	      dataType : "json",
	      success: function (result) {
	         if (!result) {
	            str += "<option>-- 없음 --</option>"
	         }
	         else {
	            str += '<option>-- 국가 --</option>'; 
	            
	            for (var country of result) {
	               str += '<option value = "' + country.country_name + '">' + country.country_name + '</option>';
	               
	               
	            }
	         }
	         selected_country.html(str);
	         form_obj.append(str_hidden);
	      }
	   });   
	}
	//첨부파일 표시
	<%-- 첨부파일 표시 처리 --%>
		<%-- HTML에서 일어나는 모든 Ajax 전송 요청에 대하여 csrf 토큰값이 요청 헤더에 설정됨 --%>
		/* var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		$(document).ajaxSend(function(e, xhr, options){ 
		 	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		}); */
		var rv_no_value = '<c:out value="${review.rv_no}"/>';
		//첨부파일 정보 표시 함수
		function show_uploaded_files(upload_result) {
			if(!upload_result || upload_result.length == 0){
			 return ;
			 }
			 var file_upload_result = $(".file_upload_result ul");
			 var str = "";
		 $(upload_result).each(function(i, obj) {
		 	if (obj.rfiletype=="F") { //이미지가 아닌 경우
 
 		//encodeURIComponent로 처리된 첨부파일(전체 경로 포함, 삭제 시 필요): 
 			var called_path_file_name = encodeURIComponent(obj.review_repo_path + "/" + obj.ruploadpath + "/" +
												 obj.ruuid + "_" + obj.rfilename);
 			console.log("전체 경로포함 파일이름: " + called_path_file_name);
 
 			//아이콘 이미지 및 uuid 없는 파일이름 표시
			 str += "<li data-review_repo_path='" + obj.review_repo_path + "' data-ruploadpath='" + obj.ruploadpath + "'"
				 + " data-ruuid='" + obj.ruuid + "' data-rfilename='" + obj.rfilename + "'"
				 + " data-rfiletype='F' style='height:25px;'>" //수정
				 + " <img src='${contextPath}/resources/assets/images/file-icons/512/004-folder-1.png' alt='No Icon' "
				 + " style='height: 18px; width: 18px;'>"
				 + obj.rfilename
				// + " <span data-filename='"+calledPathFileName+"' data-filetype='F'>[삭제]</span>"//버튼으로 교체
				 + " &nbsp;<button type='button' class='btn btn-danger btn-xs' "
				 + " data-rfilename='" + called_path_file_name + "' data-rfiletype='F'>X</button>"
				 + "</li>";
 			} else if (obj.rfiletype=="I") { //이미지파일인 경우
 
 		//encodeURIComponent로 처리된 썸네일파일(전체 경로 포함):
		 var thumbnail_file_path =
 			encodeURIComponent(obj.review_repo_path + "/" + obj.ruploadpath + "/s_" + obj.ruuid + "_" + obj.rfilename);
			 console.log("encodeURIComponent 처리된 썸네일이름: " + thumbnail_file_path);
			 //업로드 된 파일이름(uuid 포함된 이름, 삭제 시 필요)
			 //var originPathImageFileName = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
			 //originPathImageFileName = originPathImageFileName.replace(new RegExp(/\\/g),"/");
			 //썸네일 및 uuid 없는 파일이름 표시
			 str += "<li data-review_repo_path='" + obj.review_repo_path + "'"
				 + " data-ruploadpath='" + obj.ruploadpath + "'"
				 + " data-ruuid='" + obj.ruuid + "'"
				 + " data-rfilename='" + obj.rfilename + "'"
				 + " data-rfiletype='I' style='height:25px;' >" //수정
				 + " <img src='${contextPath}/review_display_thumbnail_file?file_name=" + thumbnail_file_path + "'"
				 + " alt='No Icon' style='height: 18px; width: 18px;'>"
				 + obj.rfilename
				 // + " <span data-filename='" + thumbnailFilePath + "' data-filetype='I'>[삭제]</span>"//버튼으로 교체
				 + " &nbsp;<button type='button' class='btn btn-danger btn-xs'"
				 + " data-rfilename='" + thumbnail_file_path + "' data-rfiletype='I'>X</button>"
				 + "</li>";
 			}
 		});
 
		 file_upload_result.append(str);
	}
		//업로드 파일의 확장자 및 최대 파일 크기 검사 함수
		function check_upload_file(file_name, file_size) {
			 // 확장자에 대한 정규식 및 최대 허용크기(10MB) 저장변수
			 var max_size_allowed = 5242880;
			 var reg_exp_for_file_extention = /(.*)\.(exe|sh|zip|alz)$/i ;
		 
			 //최대 허용 크기 제한 검사
			 if (file_size >= max_size_allowed) {
				 alert("업로드 파일의 제한된 크기(1MB)를 초과했습니다.");
				 return false;
			 }
		 
			 //업로드파일의 확장자 검사:
			 if (reg_exp_for_file_extention.test(file_name)) {
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
					 if (!check_upload_file(files[i].name, files[i].size)) { //파일 확장자 및 최대크기검사 실행
					 return false; //검사를 만족하지 못하면 false를 반환하고 파일업로드 중지
				 }
		 
				 //uploadFiles 파라미터로 file 정보 추가
			 	form_data.append("upload_files", files[i]);
				 }
				//url 키에 명시된 주소의 컨트롤러에게 formData 객체를 POST 방식으로 전송.
				 $.ajax({
					 type: 'post',
					 url: '${contextPath}/review_file_upload_ajax_action',
					 processData: false, //contentType에 설정된 형식으로 data를 처리하지 않음.
					 contentType: false, //contentType에 MIME 타입을 지정하지 않음.
					 beforeSend: function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
					 data: form_data,
					 dataType: 'json', //수정
					 success: function(upload_result, status){
						 alert("첨부파일의 업로드 완료: " + status);
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
						 alert("파일이 삭제되었습니다")
					 } else {
						 alert("파일 삭제가 취소되었습니다.")
				 	}
				});

				
			$(document).ready(function(){//페이지 로딩 시 함수 실행, 전체 JavaScript 내용 중 제일 마지막에 위치해야 함
				 $.ajax({
					 type: 'get',
					 url: '${contextPath}/review/get_files',
					 data: {rv_no: rv_no_value}, //bnoValue는 상단에 정의된 것 사용
					 dataType: 'json',
					 success: function(file_list, status){
						 console.log("첨부파일 목록 수집: " + status);
						 show_uploaded_files(file_list);
			 		}
			 	}) //ajax end
			});
		 
</script>
<%@ include file = "../../templet/footer.jsp"%>  
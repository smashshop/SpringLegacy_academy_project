<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file = "../../templet/review-header.jsp"%>  
		 <%--<div class="col-md-12 grid-margin stretch-card my-4">
   	<div class="card pb-5">
      <div class="img_wrapper my-4" style="border-radius : 30px; width: 100%; height: 350px;">
        <img src = "${pageContext.request.contextPath }/resources/assets/images/review/img2.jpg" alt = "이미지 없음" class="my-2 px-5 rounded" width = "100%" height = "100%" margin : auto;/>
           
      </div> --%>
      <div class="col-md-12 grid-margin stretch-card">
		   <div class="card"> 
		   <!--  <div class="card-body px-5"> -->
		   <%--   <div class = "img_wrapper my-4" style = "width : 100%; height : 350px;">
		         <img src = "${pageContext.request.contextPath }/resources/assets/images/review/img2.jpg" alt = "이미지 없음" class = "rounded" width = "100%" height = "100%"/>
       </div> --%>
		  <div class="row mx-5 mt-3"
         style="border: 1px solid gray; border-radius: 20px;">
         <div class="card-body col-12 px-5">
		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">후기 등록</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
				            <div class="row">
				                <div class="col-lg-12">
				                    <div class="panel panel-default">
				                        <div class="panel-heading">
				                        </div>
				                        <!-- /.panel-heading -->
				                        <div class="panel-body">
                       	 <form role="form" action="${contextPath}/review/review-register" method="post" name="review_frm_board">
				                  	  <div class = "row">
				                 <div class = "d-flex flex-row justify-content-between col-4">
				                    <p class = "text-muted">여행장소</p>
				                 </div>
				                 
				                 <div class = "d-flex flex-row justify-content-between">
				                 <div class = "mr-2">
				                    <select name="review_continent" id = "selected_continent"
				                            class="js-example-basic-single select2-hidden-accessible"
				                            style="width: 150px;" data-select2-id="2" tabindex="-1"
				                            aria-hidden="true" onchange = "selected_value(this)">
				                        <option>-- 대륙 --</option>
				                  <c:forEach items="${continent_list}" var="continent">
				                     <option value = "${continent.continent_name}">${continent.continent_name}</option>
				                  </c:forEach>
				                    </select>
				                 </div>
				                 
				                  <select name="review_country" id = "selected_country"
				                           class="js-example-basic-single select2-hidden-accessible"
				                           style="width: 150px;" data-select2-id="1" tabindex="-1"
				                           aria-hidden="true">
				                     <option>-- 국가 --</option>
				                    <c:forEach items="${country_info}" var="country">
				                       <option class="selected_country_2" value = "${country.country_name}">${country.country_name}</option>
				                     </c:forEach>
				                 </select>
               
				                 </div>
				              </div>
                  	                        	 
								 <div class="form-group">
								 <label><h4>제목</h4></label> <input type="text" class="form-control" name="rv_title" style="width :100%; color : white; background-color: #000000;"><br><br>
								 </div>
								<div class="form-group">
								 <label><h4>내용<h4></h4></label> <textarea class="form-control" rows="5" name="rv_content" style="background-color: #000000; color : white;"></textarea><br><br>
								 </div>
								<div class="form-group">
								 <sec:authentication property="principal" var="principal"/>
								 <label>작성자</label> <input class="form-control" name="rv_writer" style="background-color: #000000;"
								 							value='${principal.username }' readonly="readonly" >
	 						
								 </div>
								 <%-- 첨부파일 결과 표시 --%>
									<div class="row">
										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-heading">파일첨부</div>
												<div class="panel-body">
													<div class="form-group upload_div">
														<input id="input_file" type="file" name="upload_files" multiple><br>
													</div>
													<div class="form-group file_upload_result">
														<ul>
															<%-- 업로드 후, 업로드 처리결과가 표시될 영역 --%>
														</ul>
													</div>
												</div>
												<%-- /.panel-body --%>
											</div>
											<%-- /.panel --%>
										</div>
										<%-- /.col-lg-12 --%>
									</div><%-- /.row --%>
						<button type="button" class="btn btn-outline-warning btn-md" data-oper="list" onclick="location.href='${contextPath}/review/review-list'" style="float:right">
                           <i class="mdi mdi-reload btn-icon-prepend"></i>취소</button>
						<button type="button" class="btn btn-outline-primary btn-icon-text" id="btn_register" style="float:right; margin-right:5px; ">
                           <i class="mdi mdi-upload btn-icon-prepend"></i>등록</button>&nbsp;		 
								 <sec:csrfInput />
							 </form>  
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
		</div><br><br>
	</div>
		<script>
		var csrfHeaderName = "${_csrf.headerName}"; 
		var csrfTokenValue = "${_csrf.token}";
		//수정된 게시물 입력값 유무 확인 함수
		function send_board(){
				 var review_frm_board=document.review_frm_board;
				 var rv_title=review_frm_board.rv_title.value;
				 var rv_content=review_frm_board.rv_content.value;
				 var rv_writer=review_frm_board.rv_writer.value;
				 if( (rv_title.length==0 ||rv_title=="") ||
				 //(rv_content.length==0 ||rv_content=="") || (rv_writer.length==0 ||rv_writer=="") ){
						 (rv_content.length==0 ||rv_content=="") ){
					 return false;
			 	} else {
				 		return true;
					 }
		}
			//업로드 파일의 확장자 및 최대 파일 크기 검사 함수
			function check_upload_file(file_name, fileSize) {
			 // 확장자에 대한 정규식 및 최대 허용크기(5MB)
				 var max_size_allowed = 5242880;
				 var reg_exp_for_file_extention = /(.*)\.(exe|sh|zip|alz)$/i ;
			 
				 //최대 허용 크기 제한 검사
				 if (fileSize >= max_size_allowed) {
				 	alert("업로드 파일의 제한된 크기(5MB)를 초과했습니다.");
				 	return false;
				 }
				 //업로드파일의 확장자 검사:
				 if (reg_exp_for_file_extention.test(file_name)) {
				 	alert("해당 종류(exe/sh/zip/alz)의 파일은 업로드할 수 없습니다.");
					 return false;
					 }
				 	return true;
				}
				var rv_no_value = '<c:out value="${review.rv_no}"/>'; //추가
			
			//업로드 후, 첨부파일 정보 표시 함수
			function show_uploaded_files(upload_result) {
				 	console.log("show_uploaded_files 실행: 화면 표시 시작=======================================");
					 
				 	if(!upload_result || upload_result.length == 0){ //첨부파일이 없으면, 함수 종료.
						 return ;
					 }
				 //화면표시 시작
				 var file_upload_result = $(".file_upload_result ul");
				 var str = "";
				 $(upload_result).each(function(i, obj) {
					 if (obj.rfiletype=="F") { //이미지가 아닌 경우, 아이콘 이미지 및 원본 파일이름 표시
						 var called_path_file_name = encodeURIComponent( obj.review_repo_path + "/" + obj.ruploadpath + "/" +
																	  obj.ruuid + "_" + obj.rfilename);
					 	 console.log("호출된 파일이름: " + called_path_file_name);
						 
				 	 							 str += "<li data-ruploadpath='" + obj.ruploadpath + "'"
													 + " data-ruuid='" + obj.ruuid + "'"
													 + " data-rfilename='" + obj.rfilename + "'"
													 + " data-rfiletype='F'>" //수정: li 요소에 data-XXX 속성으로 필요한 값을 지정
													 + " <img src='${contextPath}/resources/assets/images/file-icons/512/004-folder-1.png' alt='No Icon' "
													 + " style='height: 18px; width: 18px;'>"
													 + obj.rfilename
													 + " <span data-rfilename='" + called_path_file_name + "' data-rfiletype='F'>[삭제]</span>"
													 + "</li>";
					 } else if (obj.rfiletype=="I") { //이미지파일인 경우 썸네일 및 원본 파일이름 표시
					 //encodeURIComponent로 처리된 전체 경로명이 포함된 썸네일 파일이름
							 var thumbnail_file_path =
							 encodeURIComponent(obj.review_repo_path + "/" + obj.ruploadpath + "/s_" + obj.ruuid + "_" + obj.rfilename);
							 console.log("encodeURIComponent 처리 파일이름: " + thumbnail_file_path);
					 //전체 경로명이 포함된 원본 이미지 파일이름, 주석처리
					 //var originPathImageFileName = obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;
					 //originPathImageFileName = originPathImageFileName.replace(new RegExp(/\\/g), "/");
					 //console.log("originPathImageFileName: " + originPathImageFileName);
				 
						 str += "<li  data-ruploadpath='" + obj.ruploadpath + "'"
							 + " data-ruuid='" + obj.ruuid + "'"
							 + " data-rfilename='" + obj.rfilename + "'"
							 + " data-rfiletype='I' >" //수정: li 요소에 data-XXX 속성으로 필요한 값을 지정
							 + " <img src='${contextPath}/review_display_thumbnail_file?file_name=" + thumbnail_file_path + "'"
							 + " alt='No Icon' style='height: 18px; width: 18px;'>"
							 + obj.rfilename
							 + " <span data-rfilename='" + thumbnail_file_path + "' data-rfiletype='I'>[삭제]</span>"
							 + "</li>";
						 }
						 }); 
				 file_upload_result.append(str);
					}
				//input 초기화를 위해 비어있는 input 요소를 복사해서 저장함.
				var clone_input_file = $(".upload_div").clone(); //<-- 파일업로드 처리 함수위에 추가
				console.log("clone_input_file: " + clone_input_file.html()); //복사된 input 요소 확인
				//<input id="inputFile" type="file" name="uploadFiles" multiple=""><br> //웹브라우저 콘솔표시 결과
				//파일 업로드 처리: 파일 input 요소의 내용이 바뀌면 업로드가 자동으로 수행되도록 수정
				//업로드 후, .uploadDive가 복사된 것으로 교체되어 input이 초기화되므로, 
				//화면에서의 파일 수정(파일 추가, 삭제)은 이벤트 위임 방식을 사용하여 구현
				//ajax를 통한 첨부파일 전송 시 필요한 csrf 토큰값을 변수에 저장
				/* var csrfHeaderName = "${_csrf.headerName}"; 
				var csrfTokenValue = "${_csrf.token}"; */
				
				
			
				
				$(".upload_div").on("change", "input[type='file']", function(e) { //수정
					//FormData() Ajax 파일 전송 시에 사용되는 Web API 클래스의 생성자
					var form_data = new FormData(); //전송될 파일을 저장할 객체 //여기서부터 동일하게 추가
					//uploadFiles 이름의 file 유형 input 요소를 변수에 저장
					//var inputFiles = $("input[name='uploadFiles']"); //기존코드
					var input_files = $(this); //위의 코드 대체
					//inputFiles에 저장된 파일들을 files 변수에 저장.
					//inputFiles[0]은 첫번째 input 요소를 의미(input 요소가 하나만 있더라도 [0]을 명시해야 함).
					var files = input_files[0].files;
					console.log(files);
	
					//formdata 객체에 파일추가
					for (var i = 0; i < files.length; i++) {
						if (!check_upload_file(files[i].name, files[i].size)) { //업로드 파일 요구조건 검사
							return false; //검사를 만족하지 못하면 false를 반환하고 파일업로드 중지
						}
	
						//uploadFiles 파라미터로 file 정보 추가
						form_data.append("upload_files", files[i]);
					}
	
					//url 키에 명시된 주소의 컨트롤러에게 formData 객체를 POST 방식으로 전송.
					$.ajax({ //파일 전송 및 서버로부터 첨부파일 데이터를 받아, 화면 결과 표시
						type : 'post',
						url : '${contextPath}/review_file_upload_ajax_action',
						processData : false, //contentType에 설정된 형식으로 data를 처리하지 않음.
						contentType : false, //contentType에 MIME 타입을 지정하지 않음.
						beforeSend: function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						data : form_data,
						dataType : 'json', //수정
						success : function(upload_result, status) {
							alert("첨부파일의 업로드 완료: " + status);
							$(".upload_div").html(clone_input_file.html()); //파일이름이 선택된 기존 input을 초기화
							//$(".uploadDiv #inputFile").val(""); //다른 방법 브라우저 버전따라 실행이 않될 수 있음(권장않함)
							show_uploaded_files(upload_result);
	
						}
					})
				});
			//파일 삭제:이벤트 위임을 이용하여, 서버의 파일 삭제 및 브라우저 항목 삭제.
			$(".file_upload_result").on("click","span", function(e){
				 //this: span
				 var target_file_name = $(this).data("rfilename");
				 var target_file_type = $(this).data("rfiletype");
				 //span이 포함된 li 변수에 저장
				 var parent_li = $(this).parent();
				 //var targetLi = $(this).closest("li");
			 
			 $.ajax({
				 type: 'post',
				 url: '${contextPath}/review_delete_uploaded_file',
				 data: {file_name: target_file_name, file_type: target_file_type},
				 dataType:'text',
				 beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				 success: function(result){
					 if (result == "success_deleting_file"){
						 alert("파일이 삭제되었습니다.");
						 //이벤트 위임을 이용하여, 삭제된 파일의 항목을 브라우저의 HTML 문서에서 삭제합니다.
						 //이 때, $(this).parent().remove(); 와 $(this).closest("li").remove(); 는 항목 삭제가 되지 않습니다.
						 parent_li.remove();
						 //targetLi.remove();
						 } else {
						 		alert("오류: 파일 삭제 실패.");
						 }
					 }
				 }); //End $.ajax
			});

			//게시물 등록: 첨부파일 포함
			$("#btn_register").on("click", function(){
				 if (!send_board()){
					 alert("글제목/글내용/작성자를 모두 입력해야 합니다.");
					 return ;
				 }
			 	
				 var form_obj = $("form[role='form']");
				 var str_input_hidden = "";
				 var review_country = form_obj.find("select[name=review_country]").val();
				 var review_continent = form_obj.find("select[name=review_continent]").val();
				 
			 //업로드 결과의 li 요소 각각에 대하여 다음을 처리(이벤트 위임 이용)
			 $(".file_upload_result ul li").each(function(i, obj){
			 	var objLi = $(obj);
				 //name 속성 값은 MyBoardVO의 첨부파일 목록이 저장되는 attachFileList 필드명(List 객체)으로 지정합니다.
					 str_input_hidden
					 += " <input type='hidden' name='attach_review_file_list["+i+"].ruuid' value='"+objLi.data("ruuid")+"'>"
					 + " <input type='hidden' name='attach_review_file_list["+i+"].ruploadpath' value='"+objLi.data("ruploadpath")+"'>"
					 + " <input type='hidden' name='attach_review_file_list["+i+"].rfilename' value='"+objLi.data("rfilename")+"'>"
					 + " <input type='hidden' name='attach_review_file_list["+i+"].rfiletype' value='"+ objLi.data("rfiletype")+"'>"
				 });
			 	str_input_hidden+=" <input type='hidden' name='rv_country' value='"+ review_country+"'>";
				 alert(str_input_hidden); //테스트 후, 주석처리할 것
				 form_obj.append(str_input_hidden);
				 form_obj.append(" <input type='hidden' name='rv_continent' value='"+ review_continent +"'>");
				 form_obj.attr("method", "post");
				 form_obj.attr("action", "${contextPath}/review/review-register");
			 
				 form_obj.submit();
			})
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
			
				

		</script>
	</div><!-- /#page-wrapper -->
		
<%@ include file = "../../templet/footer.jsp"%>    
    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file = "../../templet/notice_header.jsp"%> 
<%@ include file = "../../templet/notice_button.jsp"%>  
<header>
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
</header>
<div class="col-md-12 grid-margin stretch-card">
   <div class="card"> <br><br>
   <!--  <div class="card-body px-5"> -->
 <!--    </div> -->
 <!--  </div> -->


      <div class="row mx-5 mt-3" style="border: 1px solid gray; border-radius: 20px;">
         <div class="card-body col-12 px-5">
          <div id="page-wrapper">
            <div class="row">
               <div class="col-lg-12">
                  <p><h3 class="page-header">공지사항 글등록</h3></p><br>
               </div>
            </div>       
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                     	 
                     	 <form role="form" action="${contextPath}/notice/notice-register" method="post" name="notice_rigeboard">
                      	 
                      	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                      	  
                      	  
		                  <!-- 대륙/ 나라 선택 -->    	  
		                  <div class = "form-group">
			              <div class = "d-flex flex-row justify-content-between col-12">
			                 <h4>여행장소</h4>
			              </div>
			              
			              <div class = "d-flex flex-row justify-content-between"  style=" float: left;"">
			              <div class = "mr-2" >
			                 <select name="notice_continent" id = "selected_continent"
			                    	  class="js-example-basic-single select2-hidden-accessible"
			                    	  style="width: 150px;" data-select2-id="2" tabindex="-1"
			                    	  aria-hidden="true" onchange = "selected_value(this)">
			                     <option>-- 대륙 --</option>
				    		  <c:forEach items="${countinent_list}" var="region">
					    		  <option value = "${region.continent_name}">${region.continent_name}</option>
					    	  </c:forEach>
			                 </select>
			              </div>
			              <div>
		                  <select name="notice_country" id = "selected_country"
			                   	  class="js-example-basic-single select2-hidden-accessible"
			                   	  style="width: 150px;" data-select2-id="1" tabindex="-1"
			                   	  aria-hidden="true">
			                  <option>-- 국가 --</option>
					      	  <c:forEach items="${country_list}" var="country">
					         	  <option class="selected_country_2" value = "${country.country_name}">${country.country_name}</option>
					       	  </c:forEach>
			              </select>
		              </div>
			              </div>
			              <br><br></div><!-- 대륙/ 나라 선택 끝-->   
                      	  
                        	<div class="form-group"><br>
                         	<label><h4>제목</h4></label><input class="form-control" name="ntc_title" style="background-color: #000000;" placeholder="제목을 입력하세요"><br><br>
                        	</div>
                        	
                        	<div class="form-group">
                         	<label><h4>내용</h4></label><textarea class="form-control" rows="15" name="ntc_content" style="background-color:#000000;"  placeholder="내용을 입력하세요"></textarea><br><br>
                        	</div>
                        	
                        	<div class="form-group">
                         	<label>작성자</label><input class="form-control" name="ntc_writer" style="background-color: #000000;"  value='${principal.username }' readonly="readonly">
                        	<br></div>
                        	
                        	
                        	<%-- 첨부파일 결과 표시 --%>
					         <div class="row">
					            <div class="col-lg-12">
					               <div class="panel panel-default">
					                  <div class="panel-heading">파일첨부</div>
					                  <div class="panel-body">
					                     <div class="form-group upload_div">
					                        <input  id="input_file" type="file" name="upload_files" multiple><br>
					                     </div>
					                     <div class="form-group file_upload_result">
					                        <ul>
					                           <%-- 업로드 후, 업로드 처리결과가 표시될 영역 --%>
					                        </ul>
					                     </div>
					                  </div>    <%-- /.panel-body --%>
					               </div>     <%-- /.panel --%>
					            </div>    <%-- /.col-lg-12 --%>
					        </div>
                        	
                        	
                        	<button type="button" class="custom-btn btn-7 btn-md" data-oper="list" onclick="location.href='${contextPath}/notice/notice-list'" style="float:right">
                        	<span><i class="mdi mdi-reload btn-icon-prepend"></i>취소</span></button>
	                        <button type="button" class="custom-btn btn-3" id="notice_register" style="float:right; margin-right:5px; ">
	                        <span><i class="mdi mdi-upload btn-icon-prepend"></i>등록</span></button>
	                        
	                        
	                         <input type="hidden" name="review_page_num" id="review_page_num" value="${review_paging_creatorDTO.my_review_pagingDTO.review_page_num }" />
                       
                        <sec:csrfInput/>
                        </form>  
                       </div>
                        <!-- /.panel-body -->
                        
<!--                     </div> -->
                    <!-- /.panel -->
                	</div>
                <!-- /.col-lg-12 -->
            	</div>
            <!-- /.row -->
     </div>
   </div>
 </div>
</div><br><br>
</div>         
 <script>
 
 var loginUser = "";
 <sec:authorize access="isAuthenticated()">
  loginUser = '<sec:authentication property="principal.username"/>';<%--로그인 사용자명 변수에 저장--%>
 </sec:authorize> 
 

 
 //수정된 게시물 입력값 유무 확인 함수
function noticesend_board(){
        var notice_rigeboard=document.notice_rigeboard;
        var ntc_title=notice_rigeboard.ntc_title.value;
        var ntc_content=notice_rigeboard.ntc_content.value;
        var ntc_writer=notice_rigeboard.ntc_writer.value;
        var continent_name=notice_rigeboard.continent_name;
        var country_name=notice_rigeboard.country_name;
        if( (ntc_title.length==0 ||ntc_title=="") ||
	        (ntc_content.length==0 ||ntc_content=="")  ){
	      //  (ntc_content.length==0 ||ntc_content=="") ||(ntc_writer.length==0 ||ntc_writer=="") ){

           return false;
        } else {
              return true;
        }
}

        
   //업로드 파일의 확장자 및 최대 파일 크기 검사 함수
function check_uploadfile(nfilename, file_size) {
    // 확장자에 대한 정규식 및 최대 허용크기(5MB)
       var max_size_allowed = 52428800;
       var reg_exp_for_file_extention = /(.*)\.(exe|sh|zip|alz)$/i ;
    
       //최대 허용 크기 제한 검사
       if (file_size >= max_size_allowed) {
          alert("업로드 파일의 제한된 크기(5MB)를 초과했습니다.");
          return false;
       }
       //업로드파일의 확장자 검사:
       if (reg_exp_for_file_extention.test(nfilename)) {
          alert("해당 종류(exe/sh/zip/alz)의 파일은 업로드할 수 없습니다.");
          return false;
          }
          return true;
      }
      var notice_value = '<c:out value="${notice.ntc_vo}"/>'; //추가
   
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
          if (obj.nfiletype=="F") { //이미지가 아닌 경우, 아이콘 이미지 및 원본 파일이름 표시
             var called_path_file_name = encodeURIComponent( obj.notice_repo_path + "/" + obj.nuploadpath + "/" +
                                               				 obj.nuuid + "_" + obj.nfilename);
              console.log("호출된 파일이름: " + called_path_file_name);
             
                                 str += "<li data-nuploadpath='" + obj.nuploadpath + "'"
                                  + " data-nuuid='" + obj.nuuid + "'"
                                  + " data-nfilename='" + obj.nfilename + "'"
                                  + " data-nfiletype='F'>" //수정: li 요소에 data-XXX 속성으로 필요한 값을 지정
                                  + " <img src='${contextPath}/resources/assets/images/file-icons/128/005-database.png' alt='No Icon' "
                                  + " style='height: 18px; width: 18px;'>"
                                  + obj.nfilename
                                  + " <span data-nfilename='" + called_path_file_name + "' data-nfiletype='F'>[삭제]</span>"
                                  + "</li>";
          } else if (obj.nfiletype=="I") { //이미지파일인 경우 썸네일 및 원본 파일이름 표시
          //encodeURIComponent로 처리된 전체 경로명이 포함된 썸네일 파일이름
                var thumbnail_file_path =
                encodeURIComponent(obj.notice_repo_path + "/" + obj.nuploadpath + "/s_" + obj.nuuid + "_" + obj.nfilename);
                console.log("encodeURIComponent 처리 파일이름: " + thumbnail_file_path); 
          //전체 경로명이 포함된 원본 이미지 파일이름, 주석처리
          //var originPathImageFileName = obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid + "_" + obj.file_name;
          //originPathImageFileName = originPathImageFileName.replace(new RegExp(/\\/g), "/");
          //console.log("originPathImageFileName: " + originPathImageFileName);
       
             str += "<li data-nuploadpath='" + obj.nuploadpath + "'"
                + " data-nuuid='" + obj.nuuid + "'"
                + " data-nfilename='" + obj.nfilename + "'"
                + " data-nfiletype='I' >" //수정: li 요소에 data-XXX 속성으로 필요한 값을 지정
                + " <img src='${contextPath}/notice_display_thumbnail_file?file_name=" + thumbnail_file_path + "'"
                + " alt='No Icon' style='height: 18px; width: 18px;'>"
                + obj.nfilename
                + " <span data-nfilename='" + thumbnail_file_path + "' data-nfiletype='I'>[삭제]</span>"
                + "</li>";
             }
             }); 
       			file_upload_result.append(str);
         }
      //input 초기화를 위해 비어있는 input 요소를 복사해서 저장함.
      var clone_input_file = $(".upload_div").clone(); //<-- 파일업로드 처리 함수위에 추가
      console.log("clone_input_file: " + clone_input_file.html()); //복사된 input 요소 확인
      //<input id="inputFile" type="file" name="upload_files" multiple=""><br> //웹브라우저 콘솔표시 결과
      //파일 업로드 처리: 파일 input 요소의 내용이 바뀌면 업로드가 자동으로 수행되도록 수정
      //업로드 후, .upload_div가 복사된 것으로 교체되어 input이 초기화되므로, 
      //화면에서의 파일 수정(파일 추가, 삭제)은 이벤트 위임 방식을 사용하여 구현
      //ajax를 통한 첨부파일 전송 시 필요한 csrf 토큰값을 변수에 저장
      var csrfHeaderName = "${_csrf.headerName}"; 
      var csrfTokenValue = "${_csrf.token}"; 
      
      $(".upload_div").on("change", "input[type='file']", function(e) { //수정
         //FormData() Ajax 파일 전송 시에 사용되는 Web API 클래스의 생성자
         var form_data = new FormData(); //전송될 파일을 저장할 객체 //여기서부터 동일하게 추가
         //upload_files 이름의 file 유형 input 요소를 변수에 저장
         //var inputFiles = $("input[name='upload_files']"); //기존코드
         var input_files = $(this); //위의 코드 대체
         //input_files에 저장된 파일들을 files 변수에 저장.
         //input_files[0]은 첫번째 input 요소를 의미(input 요소가 하나만 있더라도 [0]을 명시해야 함).
         var files = input_files[0].files;
         console.log(files);

         //form_data 객체에 파일추가
         for (var i = 0; i < files.length; i++) {
            if (!check_uploadfile(files[i].name, files[i].size)) { //업로드 파일 요구조건 검사
               return false; //검사를 만족하지 못하면 false를 반환하고 파일업로드 중지
            }

            //upload_files 파라미터로 file 정보 추가
            form_data.append("upload_files", files[i]);
         }

         //url 키에 명시된 주소의 컨트롤러에게 form_data 객체를 POST 방식으로 전송.
         $.ajax({ //파일 전송 및 서버로부터 첨부파일 데이터를 받아, 화면 결과 표시
            type : 'post',
            url : '${contextPath}/notice_file_upload_ajax_action',
            processData : false, //contentType에 설정된 형식으로 data를 처리하지 않음.
            contentType : false, //contentType에 MIME 타입을 지정하지 않음.
            beforeSend: function(xhr) {
                 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
                },
            data : form_data, 
            dataType : 'json', //수정  
            success : function(upload_result, status) {
//               alert("첨부파일의 업로드 완료: " + status);
               $(".upload_div").html(clone_input_file.html()); //파일이름이 선택된 기존 input을 초기화
               //$(".upload_div #inputFile").val(""); //다른 방법 브라우저 버전따라 실행이 않될 수 있음(권장않함)
               show_uploaded_files(upload_result);

            }
         })
      });
      
   //파일 삭제:이벤트 위임을 이용하여, 서버의 파일 삭제 및 브라우저 항목 삭제.
   $(".file_upload_result").on("click","span", function(e){
       //this: span
       var target_file_name = $(this).data("nfilename");
       var target_file_type = $(this).data("nfiletype");
       //span이 포함된 li 변수에 저장
       var parent_li = $(this).parent();
       //var targetLi = $(this).closest("li");
    
    $.ajax({
       type: 'post',
       url: '${contextPath}/delete_uploaded_file',
       beforeSend: function(xhr) {
           xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
          },
       data: {file_name: target_file_name, file_type: target_file_type},
       dataType:'text',
       success: function(result){
          if (result == "success_deleting_file"){
//             alert("파일이 삭제되었습니다.");
             //이벤트 위임을 이용하여, 삭제된 파일의 항목을 브라우저의 HTML 문서에서 삭제합니다.
             //이 때, $(this).parent().remove(); 와 $(this).closest("li").remove(); 는 항목 삭제가 되지 않습니다.
             parent_li.remove();
             //targetLi.remove();
             } else {
//                   alert("오류: 파일 삭제 실패.");
             }
          }
       }); //End $.ajax
   });

   //게시물 등록: 첨부파일 포함 
   $("#notice_register").on("click", function(){
       if (!noticesend_board()){
          alert("글제목/글내용/작성자를 모두 입력해야 합니다.");
          return ;
       }
    
       var form_obj = $("form[role='form']");
       var str_input_hidden = "";
       var notice_continent = form_obj.find("select[name=notice_continent]").val();	//val는 선택한 옵션값
       var notice_country = form_obj.find("select[name=notice_country]").val();
    
    //업로드 결과의 li 요소 각각에 대하여 다음을 처리(이벤트 위임 이용)
    $(".file_upload_result ul li").each(function(i, obj){
       var obj_li = $(obj);
       //name 속성 값은 MyBoardVO의 첨부파일 목록이 저장되는 attachFileList 필드명(List 객체)으로 지정합니다.
          str_input_hidden
          += " <input type='hidden' name='notice_file_list["+i+"].nuuid' value='"+obj_li.data("nuuid")+"'>"
          + " <input type='hidden' name='notice_file_list["+i+"].nuploadpath' value='"+obj_li.data("nuploadpath")+"'>"
          + " <input type='hidden' name='notice_file_list["+i+"].nfilename' value='"+obj_li.data("nfilename")+"'>"
          + " <input type='hidden' name='notice_file_list["+i+"].nfiletype' value='"+ obj_li.data("nfiletype")+"'>" ;

       });
    
//       alert(str_input_hidden); //테스트 후, 주석처리할 것
       form_obj.append(str_input_hidden);
       form_obj.append(" <input type='hidden' name='ntc_continent' value='"+notice_continent+"'>");       
       form_obj.append(" <input type='hidden' name='ntc_country' value='"+notice_country+"'>");
       form_obj.attr("method", "post");
       form_obj.attr("action", "${contextPath}/notice/notice-register");
    
       form_obj.submit();
   });

      
      
 //대륙, 국가 선택 박스 Ajax
   function selected_value(obj) {
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
      
</script>
</div><!-- /#page-wrapper -->
   
<%@ include file = "../../templet/footer.jsp"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@ include file = "../../templet/notice_header.jsp"%>  
<%@ include file = "../../templet/notice_like.jsp"%>  
<%@ include file = "../../templet/notice_button.jsp"%>  
<header>
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
</header>
<div class="col-md-12 grid-margin stretch-card">
   <div class="card"><br><br>


<form class="form-detail" role="form">
		<div class="row mx-5 mt-3" style="border: 1px solid gray; border-radius: 20px;">
			<div class="card-body col-12 px-5">

        <div class="col-lg-12"><br>
			<input class="form-control" name="ntc_title" readonly="readonly" style="font-size: 30px; background-color:transparent; border: 0 solid;"   value='<c:out value="${notice.ntc_title }" />'>
        </div>
 
 <div class="container">  
<!--좋아요 검사 하기전에 기본 변수 값 설정  -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>  
       <c:set var="notice_like" value="false"/>    
       <c:if test="${like_list.size() > 0}">
       <c:forEach begin="0" end="${like_list.size()-1}" var="i">
          <c:if test="${not notice_like}">
             <c:if test="${principal.username eq like_list[i].user_id}">
                <c:set var="notice_like" value="true"/>
             </c:if>
          </c:if>   
       </c:forEach>
       </c:if>
            
       
      <!--좋아요 버튼 안누른 사람일때  -->
      <c:if test="${not notice_like}"> 
       <!-- 좋아요 버튼 -->
       <div class="col-lg-2" style="display: inline-block;">      
       <input type="checkbox" class="checkbox" id="checkbox" name="review_like1"/> <label for="checkbox"> <svg id="heart-svg"
                     viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
        <g id="Group" fill="none" fill-rule="evenodd"
                        transform="translate(467 392)">
          <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                        id="heart" fill="#AAB8C2" />
          <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5"
                        cy="29.5" r="1.5" />

          <g id="heartgroup7" opacity="0" transform="translate(7 6)">
            <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2" />
            <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2" />
          </g>

          <g id="heartgroup6" opacity="0" transform="translate(0 28)">
            <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2" />
            <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2" />
          </g>

          <g id="heartgroup3" opacity="0" transform="translate(52 28)">
            <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2" />
            <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2" />
          </g>

          <g id="heartgroup2" opacity="0" transform="translate(44 6)">
            <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2" />
            <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2" />
          </g>

          <g id="heartgroup5" opacity="0" transform="translate(14 50)">
            <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2" />
            <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2" />
          </g>

          <g id="heartgroup4" opacity="0" transform="translate(35 50)">
            <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2" />
            <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2" />
          </g>

          <g id="heartgroup1" opacity="0" transform="translate(24)">
            <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
            <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
          </g>
        </g>
      </svg>
   </label>
      </div>
      </c:if>
      
               
    <c:if test="${notice_like}">
    <div class="col-lg-2" style="display: inline-block;">      
          <input type="checkbox" class="checkbox" id="checkbox" checked="checked" name="review_like2"/> <label for="checkbox"> <svg id="heart-svg"
                        viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
           <g id="Group" fill="none" fill-rule="evenodd"
               transform="translate(467 392)">
             <path
            d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
            id="heart" fill="#AAB8C2" />
             <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5"
                           cy="29.5" r="1.5" />
   
             <g id="heartgroup7" opacity="0" transform="translate(7 6)">
               <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2" />
               <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2" />
             </g>
   
             <g id="heartgroup6" opacity="0" transform="translate(0 28)">
               <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2" />
               <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2" />
             </g>
   
             <g id="heartgroup3" opacity="0" transform="translate(52 28)">
               <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2" />
               <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2" />
             </g>
   
             <g id="heartgroup2" opacity="0" transform="translate(44 6)">
               <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2" />
               <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2" />
             </g>
   
             <g id="heartgroup5" opacity="0" transform="translate(14 50)">
               <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2" />
               <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2" />
             </g>
   
             <g id="heartgroup4" opacity="0" transform="translate(35 50)">
               <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2" />
               <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2" />
             </g>
   
             <g id="heartgroup1" opacity="0" transform="translate(24)">
               <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
               <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
             </g>
           </g>
         </svg>
      </label>
         </div>
         </c:if>
         </sec:authorize><!-- 좋아요 끝 -->

      
         
        
        <div style="width:100%;">
        <!-- 좋아요 갯수 표시자리 -->   
        <div id="like_result">
        	&nbsp;&nbsp;&nbsp; 현재 좋아요 개수: <c:out value="${cnt_like }"></c:out>
        </div>
        <div style="width:300px; float:left;">&nbsp;&nbsp;&nbsp;&nbsp;<strong><c:out value="${notice.ntc_continent}"/>&nbsp;&nbsp; - &nbsp;&nbsp;<c:out value="${notice.ntc_country}"/></strong></div>

        <div style="width:300px; text-align:right; float:right;"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.ntc_regdate}" /> &nbsp;&nbsp;<img src = "${pageContext.request.contextPath }/resources/assets/images/notice/coconut.png" >관리자 <c:out value="${notice.ntc_writer}"/></div>
     		<br><hr style="background-color:#2A3038;height: 1px">
     	<button  class="btn btn-inverse-warning btn-fw float-right" type="button" id="sh-link">
		<i class="mdi mdi-clippy"></i>URL복사</button><br><br><br>
      	</div>
        
					<div class="col-12">
						<div class="preview-list">
							<div class="form-group">
								<h4 class="card-title mb-1"></h4><!-- <hr style="background-color:#2A3038;height: 1px "> -->
									<textarea back class="form-control" rows="15" name="ntc_content" style="resize: none; font-size: 20px; background-color:transparent; border: 0 solid;" 
									readonly="readonly" ><c:out value="${notice.ntc_content }"/></textarea><br><br>
							</div>
							
									<!-- 첨부파일 표시 -->
		         <div class="panel panel-default"><br>
		            <div class="panel-heading">파일첨부</div>
		            <%--수정--%>
		            <div class="panel-body"><br>
		               <div class="form-group file_upload_result">
		                  <%--첨부파일 목록 표시 div--%>
		                  <%--div 전체 내용 추가--%>
		                  <ul>
		                     <%-- 첨부파일 목록이 표시될 영역 --%>
		                  </ul>
		               </div>
		            </div>
		            <!-- /.panel-body -->
		         </div>
		         <!-- /.panel -->

						</div>
					</div>
			</div>

			<div class="mt-5 mb-4 col-12">
				<div class="float-right mr-3">
				
	                <sec:authorize access="hasRole('ROLE_ADMIN')">
	                   <button type="button" id="notice_modify_button"
	                      class="custom-btn btn-7 ">
	                      <span><i class="mdi mdi-border-color"></i>수정</span>
	                   </button>
	                </sec:authorize>

					<button type="button" id="notice_list_button"
						class="custom-btn btn-3">
						<span><i class="mdi mdi-file-check btn-icon-prepend"></i>목록</span>
					</button>
				</div>
			</div>
		</div>
		</div> <br><br>   
		</form>
		</div>
	</div>



<%-- 첨부파일 이미지 표시 Modal 시작 --%>
   <div class="modal fade" id="notice_modal" tabindex="-1" role="dialog" aria-labelledby="notice_modal_label" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content" style="background-color: #191C24;">
            
            <div class="modal-body">
               <%-- 이미지 표시 --%>
            </div>

         </div>
         <%-- /.modal-content --%>
      </div>
      <%-- /.modal-dialog --%>
   </div>
   <%-- /.modal --%>



<form name="notice_detail" id="notice_detail">
<!-- 전달할 hidden 유형의 input 요소들이 추가되어 값들이 전달될 비어있는 form -->
     <input type="hidden" name="ntc_no" id="ntc_no" value='<c:out value="${notice.ntc_no }"/>'> 
     <input type="hidden" name="notice_page_num" value="${notice_pagingDTO.notice_page_num }" />
     <input type="hidden" name="notice_amount_per_page" value="${notice_pagingDTO.notice_amount_per_page }" />
     <input type='hidden' name='notice_scope' value='${notice_pagingDTO.notice_scope}'>
     <input type='hidden' name='notice_keyword' value='${notice_pagingDTO.notice_keyword}'>

</form>

<!-- URL복사 -->
<script>

var ntc_no_value = '<c:out value="${notice.ntc_no}"/>';
var login_user = "";
<sec:authorize access="isAuthenticated()">
login_user = '<sec:authentication property="principal.username"/>';
</sec:authorize> 
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

$(document).on("click", "#sh-link", function(e) {
    // 링크복사 시 화면 크기 고정
    $('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no');
    var html = "<input id='clip_notice_target' type='text' value='' style='position:absolute;top:-9999em;'/>";
    $(this).append(html);

    var input_notice_clip = document.getElementById("clip_notice_target");    
	//현재 url 가져오기
	var _url = $(location).attr('href'); 
    $("#clip_notice_target").val(_url);

    if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) {

        var editable = input_notice_clip.contentEditable;
        var readOnly = input_notice_clip.readOnly;

        input_notice_clip.contentEditable = true;
        input_notice_clip.readOnly = false;

        var range = document.createRange();
        range.selectNodeContents(input_notice_clip);

        var selection = window.getSelection();
        selection.removeAllRanges();
        selection.addRange(range);
        input_notice_clip.setSelectionRange(0, 999999);

        input_notice_clip.contentEditable = editable;
        input_notice_clip.readOnly = readOnly;
    } else {
    	input_notice_clip.select();
    }
    try {
        var successful = document.execCommand('copy');
        input_notice_clip.blur();
        if (successful) {
            alert("URL이 복사 되었습니다. 원하시는 곳에 붙여넣기 해 주세요.");
            // 링크복사 시 화면 크기 고정
            $('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes');
        } else {
            alert('이 브라우저는 지원하지 않습니다.');
        }
    } catch (err) {
        alert('이 브라우저는 지원하지 않습니다.');
    }
}); //클립보드 복사


</script>

<%-- 페이지 이동 처리 스크립트--%>
<script>
    var notice_detail = $("#notice_detail");

    $("#notice_list_button").on("click", function() { // 목록 버튼 클릭시
/*       notice_detail.find("rv_no").remove();
 */      notice_detail.attr("method", "get");
		 notice_detail.attr("action", "${contextPath}/notice/notice-list");
		 notice_detail.submit();
    });

    $("#notice_modify_button").on("click", function() {
    	notice_detail.attr("method", "get");
    	notice_detail.attr("action", "${contextPath}/notice/notice-modify");
    	notice_detail.submit();
    });
    <%-- 첨부파일 처리 JS --%>
   //업로드 후, 첨부파일 정보 표시 함수
   var ntc_no_value = '<c:out value="${notice.ntc_no}"/>';
   function show_uploaded_files(upload_result) {

       var file_upload_result = $(".file_upload_result ul");
       var str = "";
       
       console.log("show_uploaded_files 실행: 화면 표시 시작=======================================");
       //서버로부터 전달된 파일업로드 결과내용이 없으면, 함수 종료.
       if(!upload_result || upload_result.length == 0){
    	   
    	   str += "<li> 첨부파일 없음</li>"; 
    	   file_upload_result.html(str);
           return ;
       } 
       
       
       //전달받은 배열형식 데이터 각각에 대하여
       $(upload_result).each(function(i, obj) {
          if (obj.nfiletype=="F") { //이미지가 아닌 경우, 아이콘 이미지 및 원본 파일이름 표시
             //var calledPathFileName = encodeURIComponent( obj.repoPath + "/" + obj.uploadPath + "/" + //주석처리
             // obj.uuid + "_" + obj.fileName ); //주석처리
             //console.log("호출된 파일이름: " + calledPathFileName); //주석처리
            
             //아래의 li 태그를 다음처럼 수정: data-* 속성들 추가
                   str += "<li data-notice_repo_path='" + obj.notice_repo_path + "'"
                   	   + " 	   data-nuploadpath='" + obj.nuploadpath + "'"
                   	   + "     data-nuuid='" + obj.nuuid + "'"
                       + "     data-nfilename='" + obj.nfilename + "'"
                       + "     data-nfiletype='F' >"
                   //+ " <a href='${contextPath}/notice_file_down_modal?file_name=" + calledPathFileName + "'>" //주석처리
                       + " <img src='${contextPath}/resources/assets/images/file-icons/512/004-folder-1.png' "
                       + " alt='No Icon' style='height: 18px; width: 18px;'/>&nbsp;"
                       + obj.nfilename
                   //+ " </a>" //주석처리
                   //+ " <span data-filename='" + calledPathFileName + "' data-filetype='F'>[삭제]</span>" //주석처리
                       + "</li>";
             } else if (obj.nfiletype=="I") {//이미지파일인 경우 썸네일 및 원본 파일이름 표시
                //전체 경로명이 포함된 썸네일 파일이름을 encodeURIComponent로 처리
                var thumbnail_file_path = 
                	encodeURIComponent(obj.notice_repo_path + "/" 
                					+ obj.nuploadpath + "/"
                					+ "s_" + obj.nuuid 
                					+ "_" + obj.nfilename);
             
                console.log("encodeURIComponent 처리 파일이름: " + thumbnail_file_path);
                //원본이미지 파일이름(경로포함)
                //var originPathImageFileName = obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid //주석처리
                // + "_" + obj.fileName; //주석처리
                //originPathImageFileName = originPathImageFileName.replace(new RegExp(/\\/g),"/"); //주석처리
               
                //아래의 li 태그를 다음처럼 수정: data-* 속성들 추가
                str += "<li data-notice_repo_path='" + obj.notice_repo_path + "'"
               		 + " 	data-nuploadpath='" + obj.nuploadpath + "'"
               		 + " 	data-nuuid='" + obj.nuuid + "'"
               		 + " 	data-nfilename='" + obj.nfilename + "'"
                	 + " 	data-nfiletype='I' >" //수정: li 요소에 data-XXX 속성으로 필요한 값을 지정
                	 + " 		<img src='${contextPath}/notice_display_thumbnail_file?file_name=" + thumbnail_file_path + "'"
               		 + " 			alt='No Icon' style='height:50px; width: 50px;'/>&nbsp;"
               		 +		obj.nfilename
					 + "</li>";
       }else{
         '<a href ="${contextPath}/access_forbidden_msg" />  ' 
       }
    });
    //기존 페이지에 첨부파일 정보 표시를 HTML로 추가
    file_upload_result.html(str);
   } 
   
   
   
 //첨부파일 li 클릭 이벤트 처리: 첨부파일 다운로드//원본 이미지 표시(새로 추가)
   $(".file_upload_result ul").on("click","li", function(e){
       var obj_li = $(this);
       var noti_downloaded_path_file_name =
    	   									  obj_li.data("notice_repo_path") + "/"
    	   									+ obj_li.data("nuploadpath") + "/"
    	   									+ obj_li.data("nuuid") + "_"
    	   									+ obj_li.data("nfilename");
       
       	noti_downloaded_path_file_name =
    	   encodeURIComponent(noti_downloaded_path_file_name.replace(new RegExp(/\\/g),"/"));
    	   
          if(obj_li.data("nfiletype") == "I"){  
          //이미지파일일 경우, 원본이미지를 다운로드 하여 결과표시 영역에 표시
          		$(".modal-body").html(
          				"<img src='${contextPath}/notifile_download_action?file_name=" 
          			+     		noti_downloaded_path_file_name + "'"
         			+   " style='width:100%; height:100%;' >");
    
          		$("#notice_modal").modal("show");
          } 
          else { // else if(obj_li.data("filetype") == "F") {
          //이미지가 이닐 경우, 다운로드 수행
          self.location ="${contextPath}/notifile_download_action?file_name=" 
        		  		+ noti_downloaded_path_file_name ;
          } 
         });
   
 //이미지 표시 모달 감추기
    $(".modal").on("click", function(e){
    	$(".modal").modal("hide");
    }); 
    

 
//좋아요 클릭 했을때
    function notice_heart_pressed() {
       var ntc_no = ntc_no_value;
       $.ajax({
          type : "get",
          url  : '${contextPath}/notice/heart_pressed',
          data : {ntc_no: ntc_no,
             user_id : login_user},
          beforeSend: function(xhr) {
             xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
          },
          dataType : "json",
          success: function (result) {
             if (result==0) {
           //     alert("등록 실패 줸장");
             }
             else {
             //   alert("좋아요 등록 성공");
           	 like_update_and_show();
                }
             }
       });   
    } 
    //하트 누른걸 취소했을 때
    function notice_heart_unpressed() {
       var ntc_no = ntc_no_value;
       $.ajax({
          type : "get",
          url  : '${contextPath}/notice/heart_unpressed',
          data : {ntc_no: ntc_no,
             user_id : login_user},
          beforeSend: function(xhr) {
             xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
          },
          dataType : "json",
          success: function (result) {
             
            // alert(result);
             
             if (result==-1) {
              //     alert("해제 실패 줸장");
                }
                else {
                //   alert("좋아요 해제 성공");
              	 like_update_and_show();
                   }
                },
           error: function(xhr){
              alert("error");
           }

          
       });   
    } 
    //좋아요 하트 누르기 구현
      $("#checkbox").on("click",function(){
         
         like_check();
        
      }); 
   

      
    // 현재 좋아요가 눌렸는지 체크하는 함수
   function like_check(){
       var ntc_no = ntc_no_value
       $.ajax({
          type : "get",
          url  : "${contextPath}/notice/heart_check",
          data : {ntc_no: ntc_no,
             user_id : login_user},
          beforeSend: function(xhr) {
             xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
          },
          dataType : "text",
          success: function (result) {
             if(result == "존재함"){
            	 notice_heart_unpressed();

             }else if(result == "존재안함"){
            	 notice_heart_pressed();

             }
          },error: function(xhr){
              alert("error");
           }


       }); 
    } 
    

  function like_update_and_show(){
	  
	  $.ajax({
		  url:'${contextPath}/notice/notice_heart_total_show',
		  type:'get',
		  data: {ntc_no: ntc_no_value, user_id: login_user},
          beforeSend: function(xhr) {
              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
           },
           dataType : "json",
		  //데이터 전송 완료시 메시지
		  success: function(data){		//앞에 컨트롤러에서 totallike가 여기 data로 쏙 들어옴
			//  alert("좋아요 총 울마나?" +data);
			  document.getElementById('like_result').innerHTML="  &nbsp;&nbsp;&nbsp; 현재 좋아요 개수: "+data
		  },
		  error: function(xhr){
			  //alert("에러발생" );
		  }
		  });
	  }
	  
  

  
  //
  

   
   $(document).ready(function() {//페이지 로딩 시 함수 실행 전체 JavaScript 내용 중 제일 마지막에 위치해야 함
      //첨부파일 정보를 가져오는 Ajax.
       $.ajax({ 
          type: 'get',
          url: '${contextPath}/notice/notice_get_files',
          data: {ntc_no: ntc_no_value}, //bnoValue는 상단에 정의(댓글구현 시 사용)된 것 사용
          dataType: 'json',
          success: function(file_list, status){
//             alert("첨부파일 목록 수신: " + status);
             show_uploaded_files(file_list);
          }
       }); //ajax end
      /* showCmtList(1); */
   });
  
   
</script>


<%@ include file = "../../templet/footer.jsp"%>  

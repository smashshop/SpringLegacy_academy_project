<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Corona Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${contextPath }/resources/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${contextPath }/resources/assets/images/favicon.png">
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="${contextPath }/resources/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- jQuery -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- inject:js -->
    <script src="${contextPath }/resources/assets/js/off-canvas.js"></script>
    <script src="${contextPath }/resources/assets/js/hoverable-collapse.js"></script>
    <script src="${contextPath }/resources/assets/js/misc.js"></script>
    <script src="${contextPath }/resources/assets/js/settings.js"></script>
    <script src="${contextPath }/resources/assets/js/todolist.js"></script>
    <!-- endinject -->
 </head>

<body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper align-items-center auth login-bg">
          	
	        <div class="card col-lg-2 mx-auto" style = "width:100%; height:80px; cursor:pointer; margin-bottom: 60px; margin-top: 120px"
	        	 OnClick="location.href ='${contextPath}/main'">
        		<h2 class="text-center" style="align:center; margin-top: 20px;">Travel Zzang</h2>
	        </div>
          
            <div class="card col-lg-4 mx-auto my-auto">
              <div class="card-body px-5 py-5">              
                <h3 class="card-title text-left mb-3">비밀번호 찾기</h3>
                
                <form role="form" class="form-find_pw" method="post" action="${contextPath}/find_pw">
	              <fieldset>
					  <h6 class="text-danger"><c:out value="${error}"/></h6>
					  <h6 class="text-muted"><c:out value="${logout}"/></h6>
				  </fieldset>
				  <div class="form-group">
                    <label>아이디</label>
                    <input type="text" name="user_id" class="form-control p_input" placeholder="아이디" required>
                  </div>
                  <div class="form-group">
                    <label>이메일</label>
                    <input type="email" name="user_email" class="form-control p_input" placeholder="이메일" required>
                  </div>
                  <div class="form-group d-flex align-items-center justify-content-between">
                    
                    <div><!-- csrf 토큰값 처리를 위한 div 추가 -->
 						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 					</div>
                    <a href="${contextPath }/signup/find_id" class="forgot-pass">아이디 찾기</a>
                  </div>
                  <div class="text-center">
                    <button type="button" class="btn btn-primary btn-block enter-btn" id="mail_check_btn">비밀번호 찾기 이메일 전송</button>
                  </div>
                  
                  <div class="form-group">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                    <label>인증번호 입력</label>
                    <input type="text" id="check_num" class="form-control check_num" placeholder="메일로 받은 6자리 인증번호 입력해주세요" maxlength="6" disabled="disabled">
                  </div>
                  <div class="text-center">
                    <button type="button" class="btn btn-primary btn-block enter-btn">확인 버튼</button>
                  </div>
                  <div><span id="mail-check-warn"></span></div>
                  <%--회원 비번 변경 모달 --%>
                      <div class="modal" tabindex="-1" data-backdrop="static" id="example_modal">
						   <div class="modal-dialog modal-dialog-centered">
						      <div class="modal-content" style = "background-color : #191C24;">
						      
						         <div class="modal-header">
						            <h5 class="modal-title">비밀번호 변경</h5>
						            <button type="button" class="close" data-dismiss="modal" aria-label="Close" data-target="#example_modal">
						               <span aria-hidden="true">&times;</span>
						            </button>
						         </div>
						         <div class="modal-body">
						            <h5><c:out value="${myinfo.user_id}"/>님 수정하실 비밀번호를 입력해주세요.</h5>
					                  <table class="table table-bordered">
					                     <tr>
					                        <th><strong>비밀번호</strong></th>
					                        <td><input style="height:25px;" id="new_pw" type="password" placeholder="암호를 입력해주세요.">&nbsp;<h6 id="right_pw_form" style="color: red;"></h6></td>
					                     </tr>
					                     <tr>
					                        <th><strong>비밀번호 재확인</strong></th>
					                        <td><input style="height:25px;" id="new_pw_check" type="password" placeholder="암호를 입력해주세요.">&nbsp;<h6 id="check_pw" style="color: red;"></h6></td>                 
					                     </tr>
					                  </table>
						         </div>
						         
						         <div class="modal-footer">
						            <button type="button" id = "pw_mod_apply" class="btn btn-primary" data-oper="change">변경</button>
						            <button id="cancle" type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
						         </div>
						         
						      </div>
						   </div>
						</div><%-- /.modal end --%>

                  <p class="sign-up">계정이 없으신가요?<a href="${contextPath }/signup/join">&nbsp;&nbsp; 회원가입</a></p>
                </form>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
        </div>
        <!-- row ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    
<script>
$('#mail_check_btn').click(function() {
	const email = $('#user_email').val();
	console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
	const check_num = $('.check_num'); // 인증번호 입력하는곳 
	
	$.ajax({
		type : 'get',
		url : '<c:url value ="/user/mail_check?email="/>' + email, 
		success : function (data) {
			check_num.attr('disabled', false);
			code = data;
			alert('인증번호가 전송되었습니다.');
		}			
	}); //.ajax
}); // .send email 
</script>

<script type="text/javascript">
//이메일로 받은 인증번호와 같으면 비번변경 모달창 띄우기
$(function(){
   $("#pw_change_modal").on("click", function(){
      $(".modal").modal("show");
   });
   
});

$('button').on("click", function(){
	var operation = $(this).data("oper");
	
	if (operation == "change") {

		  var user_id = "${myinfo.user_id}";
		  var new_pw = $("#new_pw").val();
		  var new_pw_check = $("#new_pw_check").val();
	      var regExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
	      
	      if(regExp.exec(new_pw) != null){
	         pw_form = true; 
	      }else{
	    	  msg = "8자 이상의, 하나 이상의 <br>영문 대,소문자 및 하나의 숫자를 입력해주세요!";
			  $("#right_pw_form").html(msg);
			  $("#right_pw_form").css("color", "pink");
			  $("#right_pw_form").css("display", "block");
			  $("#right_pw_form").css("text-align", "left");
			  $("#right_pw_form").css("font-size", "12px");
			  $("#right_pw_form").css("padding", "4px");
			  msg = "";
			  pw_form = false; 
	      } 
	      
	      if(new_pw != new_pw_check){
	    	  msg = "비밀번호를 다시 확인해주세요!";
			  $("#check_pw").html(msg);
			  $("#check_pw").css("color", "pink");
			  $("#check_pw").css("display", "block");
			  $("#check_pw").css("text-align", "left");
			  $("#check_pw").css("font-size", "12px");
			  $("#check_pw").css("padding", "4px");
			  msg = ""; 
			  pw_check = false;
			  
		  } else{
			  pw_check = true;
		  }
	      
	      if(pw_check == true && pw_form == true){
	    	  
			  $.ajax({
			         type: "get",
			         url: "${contextPath}/mypw_modify/"+new_pw+"/"+user_id,
			         dataType: 'json',
			         success: function(result, status, xhr){
			        	 if(result){
				       		 alert("비밀번호 변경이 완료되었습니다");
			                 $('.modal').modal('hide');	 
			        	 }
			             
			         },
			         error : function(xhr){
			            alert("error");
			         }
			      
			      }); //.ajax
	      }
	      
 	}
});
</script>
  
</body>
</html>
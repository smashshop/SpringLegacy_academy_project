<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <!-- <script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>   -->
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
                <h3 class="card-title text-left mb-3">아이디 찾기</h3>
                
                <form role="form" class="form-search_id" id="frm_search_id" method="post" action="${contextPath}/signup/find_id">
	              <fieldset>
					  <h6 class="text-danger"><c:out value="${error}"/></h6>
					  <h6 class="text-muted"><c:out value="${logout}"/></h6>
				  </fieldset>
                  <div class="form-group">
                    <label>이름</label>
                    <input type="text" class="form-control user_name" id="user_name" placeholder="이름" required autofocus>
                  </div>
                  <div class="form-group">
                    <label>이메일</label>
                    <input type="text" class="form-control user_email" id="user_email" placeholder="이메일" required>
                  </div>
                  <div class="form-group d-flex align-items-center justify-content-between">
                    
                    <div><!-- csrf 토큰값 처리를 위한 div 추가 -->
 						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 					</div>
                  </div>
                  <div class="text-center">
                    <button type="button" class="btn btn-primary btn-block enter-btn" id="search">아이디 찾기</button>
                  </div>
                   <%--회원 아이디 보여주는 모달 --%>
                      <div class="modal" tabindex="-1" data-backdrop="static" id="example_modal">
						   <div class="modal-dialog modal-dialog-centered">
						      <div class="modal-content" style = "background-color : #191C24;">
						      
						         <div class="modal-header">
						            <h5 class="modal-title">아이디</h5>
						            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						               <span aria-hidden="true">&times;</span>
						            </button>
						         </div>
						         
						         <div class="modal-body">
					                  <table class="table table-bordered">
					                     <tr>
					                        <td><strong>회원님의 아이디 조회</strong></td>
					                     </tr>
					                     <tr>
					                     <td><h4 id="id_value"></h4></td>
					                     </tr>
					                  </table>
						         </div>
						         
						         <div class="modal-footer">
						            <button type="button" class="btn btn-secondary" data-dismiss="modal">
						            <a href="${contextPath}/login">확인</a></button>
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
    <!-- container-scroller -->
    
<script>
var csrfHeaderName = "${_csrf.headerName}"; 
var csrfTokenValue = "${_csrf.token}";
var frm_search_id = $("#frm_search_id");

 $(document).ready(function(){
	 $("#search").click(function(){
		 $("#example_modal").show();
	 });
	 
	 $(".close").on('click', function() {
		$('#example_modal').hide();
	});
	 
 });
 
$("#search").on("click", function(){
	
	var user_name = $(".user_name").val();
	var user_email = $("#user_email").val();
 	 $.ajax({
		 type:"post",
		 url:"${contextPath}/signup/find_id/" + user_email + "/" + user_name,
		 dataType : "text",
		 beforeSend: function(xhr) {
			 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		 success:function(data){
			 if(data == 0){
				 $('#id_value').html("정보와 일치하는 회원이 없습니다");
			 }else{
				 $('#id_value').html(data);
			 } 
		 },
		 error: function(xhr){
			 alert("error");
		 }
		
	 });
 }); 

</script>
    
</body>
</html>
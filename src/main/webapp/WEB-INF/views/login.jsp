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
                <h3 class="card-title text-left mb-3">Login</h3>
                
                <form role="form" class="form-signin" method="post" action="${contextPath}/login">
	              <fieldset>
					  <h6 class="text-danger"><c:out value="${error}"/></h6>
					  <h6 class="text-muted"><c:out value="${logout}"/></h6>
				  </fieldset>
                  <div class="form-group">
                    <label>Username *</label>
                    <input type="text" name="username" id="username" class="form-control p_input" placeholder="아이디" required autofocus>
                  </div>
                  <div class="form-group">
                    <label>Password *</label>
                    <input type="password" name="password" id="password" class="form-control p_input" placeholder="비밀번호" required>
                  </div>
                  <div class="form-group d-flex align-items-center justify-content-between">
                    <div class="form-check">
                      <label class="form-check-label">
                        <input name="remember-me" type="checkbox" class="form-check-input"> 로그인 상태 유지 <i class="input-helper"></i></label>
                    </div>
                    <div><!-- csrf 토큰값 처리를 위한 div 추가 -->
 						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 					</div>
                    <a href="${contextPath }/signup/find_id" class="forgot-pass">아이디 찾기</a>
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-block enter-btn">Login</button>
                  </div>

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
  
</body>
</html>
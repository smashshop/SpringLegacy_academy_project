<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>
		  </div>
		 </div>
        </div>
      </div>
</div>
    <script src="${contextPath }/resources/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="${contextPath }/resources/assets/vendors/select2/select2.min.js"></script>
    <script src="${contextPath }/resources/assets/vendors/typeahead.js/typeahead.bundle.min.js"></script>
    <script src="${contextPath }/resources/assets/vendors/chart.js/Chart.min.js"></script>
    <script src="${contextPath }/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
    <script src="${contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
    <script src="${contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${contextPath }/resources/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${contextPath }/resources/assets/js/off-canvas.js"></script>
    <script src="${contextPath }/resources/assets/js/hoverable-collapse.js"></script>
    <script src="${contextPath }/resources/assets/js/misc.js"></script>
    <script src="${contextPath }/resources/assets/js/settings.js"></script>
    <script src="${contextPath }/resources/assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${contextPath }/resources/assets/js/file-upload.js"></script>
    <script src="${contextPath }/resources/assets/js/typeahead.js"></script>
    <script src="${contextPath }/resources/assets/js/select2.js"></script>
    <script src="${contextPath }/resources/assets/js/dashboard.js"></script>
</body>
<script>
$(".review_main").on("click", function(){
	location.href = "${contextPath}/review/review-detail?rv_no=" + $(this).data("rv_no");
});

var user_logout = $("#user_logout");
$("#button_logout").on("click", function(e) {
	var logout_decision = confirm("로그아웃 하시겠습니까?");
	
	if (!logout_decision) {
		alert("로그아웃이 취소되었습니다.");
		return;
	}
	else {
		user_logout.submit();
	}
});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@ include file="header.jsp"%>
<div class="col-md-12 grid-margin stretch-card my-4">
	<div class="card pb-5">
		<div class="img_wrapper my-4" style="border-radius : 30px; width: 100%; height: 350px;">
			<img src="${pageContext.request.contextPath }/resources/assets/images/1655520379991.jpg"
				alt="이미지 없음" class="my-2 px-5 rounded" width="100%"
				height="100%"/>
		</div>

		<div class="row mx-5 mt-3"
			style="border: 1px solid gray; border-radius: 20px;">
			<div class="card-body col-10 px-5">

				<div class="d-flex flex-row justify-content-between">
					<h3 class="card-title mb-1">제목</h3>
				</div>
				<br>

				<div class="d-flex flex-row justify-content-between">
					<div class="row">
						<p class="text-muted mr-3">
							<i class="mdi mdi-airplane-landing"></i> 지역
						</p>
						<p style="font-size: 15px">나라&nbsp;
							도시</p>
					</div>
					<div class="row">
						<p class="text-muted mb-0 ">
							<i class="mdi mdi-calendar mr-1"></i>
						</p>
						<p style="font-size: 15px">
							<fmt:formatDate pattern="YYYY-MM-dd"
								value="" />
							&nbsp;~ &nbsp;
							<fmt:formatDate pattern="YYYY-MM-dd"
								value="" />
						</p>
					</div>
				</div>

				<div class="row">
					<p class="text-muted mr-2">모집인원</p>
					<p style="font-size: 15px">명</p>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="preview-list">
							<div class="form-group">
								<div class="mx-3 mt-3">내용</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="card-body col-2">
				<p><i class="mdi mdi-account"></i>작성자</p>
			</div>

			<div class="mt-5 mb-4 col-12">
				<div class="float-right mr-3">
					<button type="button" id="modify_button"
						class="btn btn-outline-secondary btn-icon-text">
						<i class="mdi mdi-border-color"></i>수정
					</button>
					<button type="button" id="list_button"
						class="btn btn-outline-primary btn-icon-text ml-1">
						<i class="mdi mdi-file-check btn-icon-prepend"></i>목록
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="col-md-12 grid-margin stretch-card mt-2">
	<div class="card px-3">

		<div class="card-body px-5 my2">
			<div class="form-group">
				<button type="button" class="btn btn-primary btn-icon-text mt-4">
					<i class="mdi mdi-upload btn-icon-prepend"></i> 동행 신청
				</button>
			</div>
		</div>
	</div>
</div>

<form name="frm_detail" id="frm_detail">
	<%-- 수정 또는 리스트 클릭시 보낼 값들을 히든값으로 표시 --%>
</form>


<%-- 페이지 이동 처리 스크립트--%>
<script>
// 	var frm = $("#frm_detail");

// 	$("#list_button").on("click", function() { // 목록 버튼 클릭시
// 		frm.attr("method", "get");
// 		frm.attr("action", "http://172.16.5.34:8080${contextPath}/friend/friend-list");
// 		frm.submit();
// 	});

// 	$("#modify_button").on("click", function() {
// 		frm.attr("method", "get");
// 		frm.attr("action", "${contextPath}/friend/friend-modify");
// 		frm.submit();
// 	});
</script>





<%@ include file="footer.jsp"%>

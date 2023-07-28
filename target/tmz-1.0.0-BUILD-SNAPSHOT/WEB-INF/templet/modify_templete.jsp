<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@ include file="header.jsp"%>
<div class="col-md-12 grid-margin stretch-card">
	<div class="card">

		<div class="card-body px-5">

			<div class="img_wrapper my-4" style="width: 100%; height: 350px;">
				<img src="1655520379991.jpg"
					alt="이미지 없음" class="rounded" width="100%" height="100%" />
			</div>
			
			<form name="frm_modify" id="frm_modify">
			<div class="d-flex flex-row justify-content-between mx-2">
				<div class="mb-4">
					<p class = "text-muted">제목</p>
					<input type="text"
						class="form-control form-control-lg" name="frnd_title"
						
						style="width: 400px; color: white;"/>
				</div>
				
				<div>
					<div class = "d-flex flex-row justify-content-between col8">
						<p class = "text-muted">대륙</p>
						<p class = "text-muted mr-5 pr-5">모집인원</p>
					</div>
					<div class = "d-flex flex-row justify-content-between">
						<select name="frnd_continent"
							class="js-example-basic-single select2-hidden-accessible"
							style="width: 150px;" data-select2-id="2" tabindex="-1"
							aria-hidden="true"
							>
								<%-- <c:forEach items="${country_info }" var="country">
									<option value="${country.country_name }" 
									<c:if test = "${frnd_info.frnd_country == country.country_name}">selected</c:if> >
										${country.country_name }
									</option>
								</c:forEach> --%>
						</select>
						
						<input type = "number" name = "frnd_member_cnt" class = " ml-2 form-control" style="width: 150px;"/>
					</div>
				</div>
			</div>
			<div class="d-flex flex-row justify-content-between ml-4">
					
				<div class="row mb-3">
					<p class = "col-12 text-muted">지역</p>
					<select name="frnd_country"
						class="js-example-basic-single select2-hidden-accessible"
						style="width: 150px;" data-select2-id="1" tabindex="-1"
						aria-hidden="true"
						>
						<%-- <c:forEach items="${country_info }" var="country">
							<option value="${country.country_name }" 
							<c:if test = "${frnd_info.frnd_country == country.country_name}">selected</c:if> >
								${country.country_name }
							</option>
						</c:forEach> --%>
					</select>
					
					<input type="text" name="frnd_city" class="form-control ml-2"
						style="width: 150px; color: white;"
						id="exampleInputCity1" value="도시">
				</div>

					<div class="row">
						<p class = "col-12 text-muted mb-0">여행기간</p>
						<input type="date" name="frnd_startdate" class="form-control mr-2" id="user_birth"
							value="<fmt:formatDate pattern = 'YYYY-MM-dd' />"
							style="width: 150px;">
						<input type="date" name="frnd_enddate" class="form-control" id="user_birth"
							value="<fmt:formatDate pattern = 'YYYY-MM-dd' />"
							style="width: 150px;">
					</div>
	
			</div>

			<div class="col-12">
				<div class="preview-list">
					<div class="form-group mt-3">
						<textarea name="frnd_content" class="form-control"
							id="exampleTextarea1" rows="20" style="color: white;">내용</textarea>
					</div>
				</div>
			</div>

			
			
			</form>

			<div class="float-right mt-3">
				<button type="button" id="modify_button"
					class="btn btn-outline-secondary btn-icon-text ml-1">
					<i class="mdi mdi-border-color btn-icon-prepend"></i>수정
				</button>
				<button type="button" id="cancel_button"
					class="btn btn-outline-danger btn-icon-text ml-1">
					<i class="mdi mdi-file-excel btn-icon-prepend"></i>취소
				</button>
			</div>

		</div>
	</div>
</div>

<%-- 페이지 이동 처리 스크립트--%>
<script>
// 	var frm = $("#frm_modify");

// 	$("#cancel_button").on("click", function() { // 목록 버튼 클릭시
// 		frm.html("<input type = 'hidden' name = 'frnd_no' value = '${frnd_info.frnd_no}'/>");
// 		frm.attr("method", "get");
// 		frm.attr("action", "${contextPath}/friend/friend-detail");
// 		frm.submit();
// 	});

// 	$("#modify_button").on("click", function() {
// 		frm.attr("method", "post");
// 		frm.attr("action", "${contextPath}/friend/friend-modify");
// 		frm.submit();
// 	})
</script>





<%@ include file="footer.jsp"%>

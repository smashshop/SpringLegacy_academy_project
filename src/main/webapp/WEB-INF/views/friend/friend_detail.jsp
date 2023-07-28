<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var = "today" value = "<%=new java.util.Date() %>"/>

<%@ include file="../../templet/header.jsp"%>
<div class="col-md-12 grid-margin stretch-card my-4">
	<div class="card pb-5">
		<div class="img_wrapper my-4 mx-5" style="height: 350px;">
			<c:url value = "/friend_display_upload_file" var = "url">
				<c:param name="file_name" value = "C:/tmz_upload/friend/${frnd_info.attach_file_list[0].fuploadpath }/${frnd_info.attach_file_list[0].fuuid }-${frnd_info.attach_file_list[0].ffilename }"/>
			</c:url>
			<img src="${url }"
				class="rounded" width="100%" height="100%" alt="이미지가 없습니다."/>
		</div>

		<div class="row mx-5 mt-3"
			style="border: 1px solid gray; border-radius: 20px;">
			<div class="card-body col-9 px-5">

				<div class="d-flex flex-row justify-content-between">
					<h2 class="card-title mb-1">${frnd_info.frnd_title }</h2>
				</div>
				<br>

				<div class="d-flex flex-row justify-content-between">
					<div class="row">
						<p class="text-muted mr-3">
							<i class="mdi mdi-airplane-landing"></i> 지역
						</p>
						<p style="font-size: 15px">${frnd_info.frnd_country }&nbsp;
							${frnd_info.frnd_city }</p>
					</div>
					<div class="row">
						<p class="text-muted mb-0 ">
							<i class="mdi mdi-calendar mr-1"></i>
						</p>
						<p style="font-size: 15px">
							<fmt:formatDate pattern="YYYY-MM-dd"
								value="${frnd_info.frnd_startdate }" />
							&nbsp;~ &nbsp;
							<fmt:formatDate pattern="YYYY-MM-dd"
								value="${frnd_info.frnd_enddate }" />
						</p>
					</div>
				</div>

				<div class="row">
					<p class="text-muted mr-2">모집인원</p>
					<p style="font-size: 15px">${frnd_info.frnd_member_cnt }명</p>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="preview-list">
							<div class="form-group">
								<div class="mx-3 mt-3">${frnd_info.frnd_content}</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="card-body col-3">
				<div class="d-flex flex-row justify-content-between frnd_writer_detail writer_id" data-user_id = "${frnd_info.frnd_writer }">
					<h4><i class="mdi mdi-account"></i>${frnd_info.frnd_writer }</h4>
					<div>
						<i class = "mdi mdi-star"></i>
						<fmt:formatNumber value="${user_info.user_rate }" pattern=".0"/>
					</div>
				</div>
				<c:forEach var = "tag" items = "${fn:split(user_info.user_tag, ' ') }">
					<mark class="bg-dark text-white text-muted rounded" style = "font-size : 13px;">#${tag }</mark>
				</c:forEach>
				<c:if test = "${frnd_info.frnd_startdate < today}">
					<button type="button" class="btn btn-block btn-inverse-secondary btn-icon-text mt-3 py-3">
						만료된 여행입니다
					</button>
				</c:if>
				<p class = "text-muted text-center mt-5">
					<i class="mdi mdi-comment-alert-outline"></i>아이디를 클릭해 보세요
				</p>
			</div>

			<div class="mt-5 mb-4 col-12 pl-4">
			
				<div class = "float-left">
					<div class = "my-1" style = "font-size : 13px;">
						<c:forEach var = "hash" items = "${fn:split(frnd_info.frnd_tag, ' ') }">
							<mark class="bg-dark text-white text-muted rounded">#${hash }</mark>
						</c:forEach>
					</div>
					
					<p class = "text-muted" style = "font-size : 12px;">
						<fmt:formatDate pattern="YYYY-MM-dd HH:mm"
							value="${frnd_info.frnd_regdate }" />
					</p>
				</div>
				
				<div class="float-right mr-3 mt-3">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var = "principal"/>
						<c:if test = "${principal.username == frnd_info.frnd_writer && frnd_info.frnd_startdate > today}">
							<button type="button" id="modify_button"
								class="btn btn-outline-secondary btn-icon-text">
								<i class="mdi mdi-border-color"></i>수정
							</button>
						</c:if>
						<%-- <c:if test = "${principal.username == frnd_info.frnd_writer && frnd_info.frnd_startdate < today}">
							<button type="button" id="delete_button"
								class="btn btn-outline-danger btn-icon-text ml-1">
								<i class="mdi mdi-file-excel btn-icon-prepend"></i>삭제
							</button>
						</c:if> --%>
					</sec:authorize>
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
	<div class="card">
		<div class="card-body mb-0 pb-0 mx-3">
		
			<div class="d-flex flex-row justify-content-between">
				<h4 class="card-title">Friend-apply</h4>
				${frnd_info.frnd_now_mem } / ${frnd_info.frnd_member_cnt }
			</div>
			<c:if test = "${!frnd_info.frnd_status && frnd_info.frnd_startdate > today }">
				<button type="button" id = "party_apply_button" class="btn btn-block btn-primary btn-icon-text py-3">
					<i class="mdi mdi-account-multiple-plus btn-icon-prepend"></i> 동행 신청하기
				</button>
			</c:if>
			<c:if test = "${frnd_info.frnd_status || frnd_info.frnd_startdate < today}">
				<button type="button" class="btn btn-block btn-inverse-secondary btn-icon-text py-3">
					동행 신청이 마감되었습니다
				</button>
			</c:if>
			
			<p class = "text-muted text-right">
				<i class="mdi mdi-comment-alert-outline"></i>아이디를 클릭해 보세요
			</p>
			<!-- 동행 신청댓글 표시 구간 -->
			<div class="preview-list friend_repl_box mx-4 mt-2">
				
			</div>
			
		</div>
		<button type="button" id = "more_scroll" class="btn btn-outline-secondary btn-block">더보기</button>
	</div>
</div>


<div class="modal" id = "modal_writer" tabindex="-1" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content" style = "background-color : #191C24;">
		
			<div class="modal-header">
				
				<div>
					<div class = "d-flex flex-row">
						<h3 class="modal-title">${user_info.user_id }</h3>
					</div>
					
					<div class = "d-flex flex-row">
						<c:forEach var = "tag" items = "${fn:split(user_info.user_tag, ' ') }">
							<mark class="bg-dark text-white text-muted rounded mr-1" style = "font-size : 13px;">#${tag }</mark>
						</c:forEach>
					</div>
				</div>
				
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
			<div class="modal-body" style = "height : 400px;">
				<div class = "container-fluid">
					
					<div class = "d-flex flex-row justify-content-between">
						<div class = "d-inline">
	                   		받은 동행 후기&nbsp;<span class = "party_cnt_box text-success"></span>
	                   	</div>
	                    
	                    <div class = "rate_box d-inline">
	                    	
	                    </div>
                    </div>
                    
					<div class="preview-list user_box px-3 mb-4 pt-2"><%-- 동행 후기 표시구역 --%>
						
					</div>
                    
				</div>
			</div>
			
			
			
		</div>
	</div>
</div>


<div class="modal" id = "modal_repl" tabindex="-1" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content" style = "background-color : #191C24;">
		
			<div class="modal-header">
				<h5 class="modal-title">동행 신청</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
			<div class="modal-body">
				<div class = "container-fluid">
					
					<div class="d-flex flex-row justify-content-between">
						<div class = "row">
							<p class="text-muted mr-3">
								<i class="mdi mdi-airplane-landing"></i> 지역
							</p>
							<p style="font-size: 15px">${frnd_info.frnd_country }&nbsp;
							${frnd_info.frnd_city }</p>
						</div>
						
						<div class = "row">
							<p class="text-muted mr-3">
								인원 
							</p>
							
							<p style="font-size: 15px">
								${frnd_info.frnd_now_mem } / 
								${frnd_info.frnd_member_cnt }
							</p>
						</div>
					</div>
					
					<div class="row">
						<p class="text-muted mb-0 ">
							<i class="mdi mdi-calendar mr-1"></i>
						</p>
						<p style="font-size: 15px">
							<fmt:formatDate pattern="YYYY-MM-dd"
								value="${frnd_info.frnd_startdate }" />
							&nbsp;~ &nbsp;
							<fmt:formatDate pattern="YYYY-MM-dd"
								value="${frnd_info.frnd_enddate }" />
						</p>
					</div>
					
					<textarea name="frnd_content" class="form-control"
							id="frnd_repl_content" rows="5" style="color: white;" placeholder = "간단한 자기소개나 신청이유를 말씀해 주세요"></textarea>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" id = "repl_apply_button" class="btn btn-primary">신청</button>
			</div>
			
		</div>
	</div>
</div>


<form name="frm_detail" id="frm_detail">
	<%-- 수정 또는 리스트 클릭시 보낼 값들을 히든값으로 표시 --%>
	<sec:csrfInput/>
	<input type="hidden" name="frnd_no" value="${frnd_info.frnd_no }" />
	<input type = "hidden" name = "frepl_confirm" value = ""/>
	<input type = "hidden" name = "frepl_no"/>
</form>


<%-- 페이지 이동 처리 스크립트--%>
<script>

	var ap = true;


	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	var friend_repl_box = $(".friend_repl_box");
	var del = "${frnd_info.frnd_delflag }";

	if(del == true || del == "true"){
		alert("삭제된 게시글 입니다");
		location.href = "${contextPath}/main";
	}
	
	var party_box = $(".user_box");
	var frnd_no = "${frnd_info.frnd_no}";
	var loginUser = "";
	var applyUser = "";
	var modalUser = "";
	var frnd_startdate = "<fmt:formatDate pattern='YYYY-MM-dd'
							value='${frnd_info.frnd_startdate }'/>";
	var scroll_count = 1;
	
	<sec:authorize access = "isAuthenticated()">
		loginUser = '<sec:authentication property = "principal.username"/>';
	</sec:authorize>

	
	//상세페이지 이동 관련 처리문
	var frm_detail = $("#frm_detail");
	
	$("#delete_button").on("click", function(){
		if(confirm("게시물을 삭제하시겠습니까?")){
			frm_detail.attr("method", "post");
			frm_detail.attr("action", "${contextPath}/friend/friend-delete");
			frm_detail.submit()
		}
	});
	
	$("#list_button").on("click", function() { // 목록 버튼 클릭시
		frm_detail.find("input[name=_csrf]").remove();
		frm_detail.attr("method", "get");
		frm_detail.attr("action", "${contextPath}/friend/friend-list");
		frm_detail.submit();
	});

	
	$("#modify_button").on("click", function() { // 수정 버튼 클릭시
		frm_detail.attr("method", "get");
		frm_detail.attr("action", "${contextPath}/friend/friend-modify");
		frm_detail.submit();
	});
	
	
	
	
	//동행 신청 관련 처리문
	//동행 수락 또는 취소 클릭시
	$(".friend_repl_box").on("click", "div>div>div>div>button", function(){
		frm_detail.find("input[name=frepl_no]").val($(this).data("frepl_no"));
		frm_detail.find("input[name=frepl_confirm]").val($(this).data("party"));
		if(!confirm("동행신청을 수락/취소 하시겠습니까?")){
			return;
		}
		frm_detail.attr("method", "post");
		frm_detail.attr("action", "${contextPath}/friend-repl/frepl-confirm");
		frm_detail.submit();
	});
	
	//동행 신청 댓글리스트 보여주는 함수
	function show_repl_list(){
		$.ajax({
			type : "get",
			url : "${contextPath}/friend-repl/friend-" + frnd_no + "/friend-get/" + scroll_count,
			dataType : "json",
			success : function(result, status, xhr){
				var date = new Date();
				var month = date.getMonth()+1 > 10 ? date.getMonth()+1 : "0" + (date.getMonth()+1);
				var today = date.getFullYear() + "-" + month + "-" + (date.getDate() < 10 ? "0" + date.getDate() : date.getDate());
				
				var str = "";
				
				if(result.length < 10){
					$("#more_scroll").remove();
				}
				
				if(result.length > 0){
					
					$(result).each(function(i, repl){
						str += '<div class="preview-item border-bottom">'
							 + '	<div class="preview-item-content d-flex flex-grow">'
							 + '		<div class="flex-grow">'
							 + '			<div class="d-flex d-md-block d-xl-flex justify-content-between">'
							 + '				<h6 class="preview-subject writer_id" data-user_id = "' + repl.frepl_writer + '">' + repl.frepl_writer + '</h6>';
							 if(loginUser == "${frnd_info.frnd_writer}" && today < frnd_startdate){
								 if(repl.frepl_confirm){
									 str += '		<button type = "button" class="btn btn-outline-danger btn-sm" data-party="0" data-frepl_no="' + repl.frepl_no + '">동행취소</button>';
								 }else{
									 if(!repl.frnd_status){
										 str += '	<button type="button" class="btn btn-outline-success btn-sm" data-party="1" data-frepl_no="' + repl.frepl_no + '">동행수락</button>';
									 }
								 }
							 }
						str += '			</div>'
							 + '			<p class="text-muted">' + repl.frepl_content + '</p>'
							 + '		</div>'
							 + '	</div>'
							 + '</div>';
						
						applyUser += repl.frepl_writer + " ";
					});//.end each()
				}else{
					str += "";
				}
				if(ap){
					friend_repl_box.append(str);
				}else{
					friend_repl_box.html(str);
				}
				
			},//.end success()
			error : function(er){
				alert("er");
			}
		});//.end ajax

	}
	
	
	$("#party_apply_button").on("click", function(){ // 동행신청 버튼 클릭시
		if(!loginUser || loginUser.length == 0){
			alert("로그인 유저만 사용 가능합니다");
			return;
		}
		if(loginUser == "${frnd_info.frnd_writer}"){
			alert("본인 게시글의 동행신청은 불가능합니다");
			return;
		}
		if(applyUser.indexOf(loginUser) >= 0){
			alert("중복신청은 불가능합니다");
			return;
		}
		$("#modal_repl").modal("show");
	});
	
	$("#repl_apply_button").on("click", function(){ // 모달창 신청 버튼 클릭시
		
		if(!loginUser || loginUser.length == 0){
			alert("로그인 유저만 사용 가능합니다");
			return;
		}
		if(loginUser == "${frnd_info.frnd_writer}"){
			alert("본인 게시글의 동행신청은 불가능합니다");
			return;
		}
		
		
		var frepl_content = $("#frnd_repl_content").val();
		var frepl_writer = loginUser;
		
		var friend_repl = {frnd_no : frnd_no, frepl_content : frepl_content, frepl_writer : frepl_writer};
		
		
		$.ajax({
			type : "post",
			url : "${contextPath}/friend-repl/friend-new",
			data : JSON.stringify(friend_repl),
			dataType : "text",
			contentType : "application/json;charset=UTF-8",
			beforeSend : function(xhr){
				//시큐리티 사용시 post 요청할 때 csrf값을 같이 줘야한다
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(result, status, xhr){
				ap = false;
				show_repl_list();
				$("#frnd_repl_content").val("");
				$("#modal_repl").modal("hide");
			},
			error : function(er){
				alert("er");
			}
		});
		
	});
	
	$("#more_scroll").on("click", function(){
		scroll_count++;
		ap = true
		show_repl_list();
	});
	
	
	
	//회원 상세정보 가져오는 함수
	function show_user_detail(select_id){
		$.ajax({
			
			type : "post",
			url : "${contextPath}/friend/get-user-detail/"+select_id,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(result, status, xhr){
				
				var str = '';
				var rate = 0;
				
				if(result.length > 0){
				
					$(result).each(function(i, userinfo){
						
						str += '<div class="preview-item border-bottom">'
							 + '	<div class="preview-item-content d-flex flex-grow">'
							 + '		<div class="flex-grow">'
							 + '			<div class="d-flex d-md-block d-xl-flex justify-content-between">'
							 + '				<h6 class="preview-subject">' + userinfo.rating_id + '</h6>'
							 + 					userinfo.rate_num + '점'
							 + '			</div>'
							 + '			<p class="text-muted">';
							 if(userinfo.party_comment == null || userinfo.party_comment.length == 0){
								 str += '		(코멘트가 없습니다)';
							 }else{
								 str += 		userinfo.party_comment;
							 }
						str += '			</p>'
							 + '		</div>'
							 + '	</div>'
							 + '</div>';
						
						rate += userinfo.rate_num;
					});
					
					rate = Math.round(rate/result.length * 10) / 10;
					rate = '<i class = "mdi mdi-star"></i> ' + rate
					
				}else{
					str += '<p class = "text-muted">받은 동행 후기가 없습니다</p>';
				}
				
				$(".party_cnt_box").html(result.length);
				$(".rate_box").html(rate);
				party_box.html(str);
				$("#modal_writer").modal("show");
			},
			error : function (er){
				alert("er");
			}
		});
	}
	
	//회원 상세정보 클릭시
	$(".writer_id").on("click", function(){
		show_user_detail($(this).data("user_id"));
		modalUser = $(this).data("user_id");
	});
	
	$(".friend_repl_box").on("click", "div>div>div>div>.writer_id", function(){
		show_user_detail($(this).data("user_id"));
		modalUser = $(this).data("user_id");
	});
	
	$("#report_button").on("click", function(){
		if(loginUser == modalUser){
			
			return;
		}
	});
</script>


<script>
	$(document).ready(function(){
		ap = true;
		show_repl_list();
	});
</script>


<%@ include file="../../templet/footer.jsp"%>

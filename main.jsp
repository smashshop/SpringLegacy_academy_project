<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@ include file="../templet/header_main.jsp"%>

<div class = "my-5" style = "width : 1260px; margin : auto;">
	<h3 class = "font-weight-bold">이번달 여행글</h3>
	<a href = "${contextPath }/friend/friend-list" class = "display-6 float-right">더보기</a>
</div>

<div class="" id = "main_frnd_list" style = "position : relative; width : 1260px; overflow : hidden; margin : auto;">

	<div id = "frnd_slider_left" style = "background-color : white; position : absolute; z-index : 9999; opacity : 0.7; width : 35px; height : 35px; top : 115px; border-radius : 50%;">
		<h2 class = "text-dark ml-2">&lt;</h2>
	</div>
	
	<div id = "frnd_slider_right" style = "background-color : white; position : absolute; z-index : 9999; opacity : 0.7; width : 35px; height : 35px; top : 115px; right : 0px; border-radius : 50%;">
		<h2 class = "text-dark ml-2">&gt;</h2>
	</div>
	
	<div id="start_div" style = "width : 2700px; transition : 0.5s;">
	
		<c:forEach items="${frnd_list}" var="friend" begin = "0" end = "7" step = "1">
	   
			<div class="grid-margin stretch-card float-left post_detail mr-3" style = "width : 300px;">
	       
				<div class="">
					<div class = "rounded frnd_img_box" style = "overflow : hidden; position : relative;">        
						<a href = "#" class = "move_frnd_detail" data-frnd_no = "${friend.frnd_no}">
							<c:url value = "/friend_display_upload_file" var = "url">
								<c:param name="file_name" value = "C:/tmz_upload/friend/${friend.attach_file_list[0].fuploadpath }/${friend.attach_file_list[0].fuuid }-${friend.attach_file_list[0].ffilename }"/>
							</c:url>
							<img src="${url }"
								class="mb-2 rounded" width="100%" height="250" alt="이미지가 없습니다."/>
	                		<input type = "hidden" name = "frnd_startdate" value = '<fmt:formatDate pattern = "MM-dd" value="${friend.frnd_startdate}"/>'/>
	                		<input type = "hidden" name = "frnd_enddate" value = '<fmt:formatDate pattern = "MM-dd" value="${friend.frnd_enddate}"/>'/>
	                	</a>
	                	<div style = "position : absolute; top : 5px; left : 5px;" class = "px-1 py-1">
	                		<button type = "button" class = "btn btn-rounded" style = "background-color : black; opacity: 0.6; transition : 0.3s;">
	                			<div class = "frnd_default">
	                				<i class = "mdi mdi-map-marker-radius"></i>
	                				<c:out value="${friend.frnd_city}"/>
	                			</div>
	                		</button>
	                	</div>
	                </div>
	                 	
					<div class = "row ml-0">
		                <c:if test="${friend.frnd_status == false}">
		                    <h5 class="text-success mr-2">모집 중</h5>
		                </c:if>
		                    
		                <c:if test="${friend.frnd_status == true}">
		                    <h5 class="text-danger mr-2">모집 마감</h5>
		                </c:if>
		            		
		           		<h6>${ friend.frnd_title}</h6>                     
	             	</div>
	       		 
					<h5 class="text-secondary font-weight-normal">                 
						<i class="mdi mdi-account"></i>
						<c:out value="${friend.frnd_writer}"/>
					</h5> 
	                        
				</div>
	         
			</div>
	   
		</c:forEach>
	
	</div>
</div>


<div class = "my-5" style = "position : relative; left:-180px; height : 300px; overflow:hidden; width : 140%; background-color : #eef6f3">
	<img src = "${contextPath }/resources/assets/images/main_slider/friends.png" style = "position : absolute; height : 300px; right : 300px;">
	<div style = "z-index : 9999; position : absolute; text-align : center; left : 200px; top : 100px;">
		<button class = "btn btn-rounded btn-outline-success btn-fw px-5">
			<h3 class= "font-weight-bold my-3">리뷰 보러가기</h3>
		</button>
	</div>
</div>

<div class = "preview-item border-bottom my-3" id = "he">
	<div class = "d-flex flex-row justify-content-between">
		<div>
			<h2 class = "font-weight-bold">Best Review</h2>
		</div>
		<div class = "mt-3">
			<a href = "${contextPath }/review/review-list" class = "display-6 float-right">더보기</a>
		</div>
	</div>
	<div class="row py-3">
		<c:forEach var = "review" items="${ rv_list}" begin="0" end="1" step ="1">
				<div class="col-sm-6 grid-margin">
					<div class="card">
						<div class="card-body review_main" style = "height : 250px;" data-rv_no = ${review.rv_no }>
							<h4>${review.rv_title }</h4>
							<h6 class = "text-muted font-weight-normal">${review.rv_writer }</h6>
							<div class="row">
								<div class="col-12 col-sm-12 col-xl-12 mt-2 mb-0" >
									<div class="d-flex d-sm-block d-md-flex align-items-center mx-2 blockquote mb-0 pb-1" style = "background-color : #2a3038;">
										<div class = "row mx-0 my-0">
											<h5 class = "font-weight-normal">${review.rv_content }</h5>
											<div class = "w-100"></div>
											<p class="text-muted font-weight-normal">댓글 ${review.rv_replcnt }개</p>
										</div>					
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</c:forEach>
	</div>
</div>

<form name = "move_page" id = "move_page">
	<input type = "hidden" name = "frnd_no">
</form>
<%-- 페이지 이동 처리 스크립트--%>
<script>

	var frm = $("#move_page");
	
	$(".move_frnd_detail").on("click", function(e){
		e.preventDefault();
		frm.find("input[name=frnd_no]").val($(this).data("frnd_no"));
		frm.attr("method", "get");
		frm.attr("action", "${contextPath}/friend/friend-detail");
		frm.submit();
	});
	
	
	var frnd_default;
	$(".move_frnd_detail").on("mouseover", function(){
		frnd_default = $(this).siblings().children().children().html();
		var start_date = $(this).find("input[name=frnd_startdate]").val();
		var end_date = $(this).find("input[name=frnd_enddate]").val();
		var str = start_date + '&nbsp;~ &nbsp;' + end_date;
		$(this).siblings().children().children().append(str);
	});
	
	$(".move_frnd_detail").on("mouseout", function(){
		$(this).siblings().children().children().html(frnd_default);
	});

</script>


<script>
$(document).ready(function(){

	//동행 리스트 슬라이더 스크립트
	var frnd_list_count = 0;
	var margin = 0;
	$("#frnd_slider_left").css("display", "none");
	
	$("#frnd_slider_right").on("click", function(){
		margin -= 316;
		$(this).siblings("#start_div").css("margin-left", margin + "px");
		frnd_list_count++;
		if(frnd_list_count > 0){
			$("#frnd_slider_left").css("display", "block");
		}
		if(frnd_list_count == 4){
			$("#frnd_slider_right").css("display", "none");
		}
	});
	
	$("#frnd_slider_left").on("click", function(){
		margin += 316;
		$(this).siblings("#start_div").css("margin-left", margin + "px");
		frnd_list_count--;
		if(frnd_list_count < 4){
			$("#frnd_slider_right").css("display", "block");
		}
		if(frnd_list_count == 0){
			$("#frnd_slider_left").css("display", "none");
		}
	});
	//.end 동행 리스트 슬라이더 스크립트
	
	
	//메인페이지 사진 슬라이더 스크립트
	var now = 0;
	var count_img = 1;
	
    setInterval(function(){
        slide();
    },6000);

	function slide(){
	    now = now == count_img ? 0 : now+1;
	    if(now == 1){
	    	$(".slider").css("background-color", "#fbf8e1");
	    }else{
	    	$(".slider").css("background-color", "#e8edef");
	    }
	    $(".slider").children().eq(now-1).css("margin-left", "-2000px");
	    $(".slider").children().eq(now).css("margin-left", "0");
	}
	//.end 메인페이지 사진 슬라이더 스크립트
});
</script>


<%@ include file="../templet/footer_main.jsp"%>

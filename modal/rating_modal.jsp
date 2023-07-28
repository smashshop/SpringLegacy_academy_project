<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--별점 변경 모달 --%>
<div class="modal" tabindex="-1" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content" style = "background-color : #191C24;">
	         <div class="modal-header">
	            <h5 class="modal-title">지난 동행 점수 주기</h5>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	               <span aria-hidden="true">&times;</span>
	            </button>
	         </div>
	         <form>
	         <div class="modal-body">
				<div class="page-header">
		            <div class="rating col-12">
		            </div>					        
		         </div><br>
		         <div style="margin:auto;">
		            <h5>제출한 점수는 수정할 수 없어요</h5>
			        <input type="text" id="party_comment" name="party_comment" placeholder="한줄평"/>
		        </div>
		     
	         </div>
	         <div class="modal-footer">
	            <button type="button" id="rate_apply_button" class="btn btn-primary star_rating" data-rate = "${party.rate_num }">점수 제출</button>
	         </div>
	         <sec:csrfInput/>
	      </form>   
	      </div>
	   </div>
</div><%-- /.modal end --%>
<script>
//별점 주는 div의 속성 관리 코드
$('.rating').starRating({
	  starIconEmpty:'far fa-star',
	  starIconFull:'fas fa-star',
	  starColorEmpty:'lightgray',
	  starColorFull:'#FFC107',
	  starsSize: 2,
	  stars: 5,
	  showInfo:true,
	  titles: ["최악","별로","그냥저냥","좋았","최고"],
	  inputName:'rating'
	});

//별점 코드 사용법에 있던 코드인데 혹시 몰라 참조용으로 주석처리
/* $(document).on('change', '.rating', function (e, stars, index) {
	  alert('Thxfor ${stars} stars!');
});*/

var csrfHeaderName = "${_csrf.headerName}"; 
var csrfTokenValue = "${_csrf.token}";
var frm_send_value = $("#frm_send_value");


//디비로 별점 보내는 ajax
$("#rate_apply_button").on("click", function(){
	 
	var rating_id = "${username}";
	var rate_num = frm_send_value.find("input[name=rating]:checked").val();
	var rated_id = $(".rated_id").val();
	var frnd_no = frm_send_value.find("input[name=frnd_no]").val();
	var party_comment = $("#party_comment").val();
	//var party_comment = frm_send_value.find("input[name=party_comment]").val();
	
	var userinfo_rate = {rating_id : rating_id,
						rate_num : rate_num,
						rated_id : rated_id,
						frnd_no : frnd_no,
						party_comment : party_comment};
	
	$.ajax({
		type: "post",
		url: "${contextPath}/party_rate",
		data: JSON.stringify(userinfo_rate),
		dataType: 'json',
		contentType: 'application/json;charset=UTF-8',
		beforeSend: function(xhr) {
			 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function(result, status){
				if(result){
					alert("평점 등록 완료" + status);
					$('.modal').modal('hide');
					location.reload(); 
					//$("#give_rate").load("${contextPath}/mypage/mypage_prty_list?party_member=${username} #give_rate");
				}
		},
		error : function(xhr){
			alert("error");
		}
	
	}); //.ajax

});
</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ include file="../../templet/header.jsp" %>

<style>

</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="username"/>
</sec:authorize>

 <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">
              	<%-- <c:out value="${로그인한 user_id 불러오기 ..}" /> --%>
           	    <%-- 나는 url에 파라미터를 넘긴 사용자의 kim의 정보를 불러올거야 --%> 
              	<c:out value="${myinfo.user_id}" />님 정보 수정 
              </h3>
            </div><%-- /.page-header --%>
            <div class="row">
              <div class="col-md-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">나의 정보</h4>
                    <!-- <p class="card-description"> Basic form layout </p> -->
                    <form role="form" id="frm_mypage_info" method="post">
                    <sec:csrfInput />   
                      <br>
                      
                      <div class="form-group">
                        <label for="user_id">아이디</label>
                        <input name="user_id" class="form-control" 
                        		value="<c:out value='${myinfo.user_id}'/>" readonly="readonly" style="background-color:#2A3038">
                      </div><%-- /.form-group --%>
                      <br>
                      
                      <div class="form-group">
                        <label for="user_name">이름</label>
                        <input id="user_name" class="form-control" 
                        		value="<c:out value='${myinfo.user_name}' />" readonly="readonly" style="background-color:#2A3038">
                      </div><%-- /.form-group --%>
                      <br>
                      
                      <%-- <div class="form-group">
                        <label for="user_email">이메일</label>
                        <input id="user_email" class="form-control" 
                        		value="<c:out value='${myinfo.user_email}' />">
                      </div>/.form-group
                      <br> --%>
                      
                      <div class="form-group">
                        <label for="user_pw">비밀번호</label><br>
 						<button type="button" class="btn btn-primary btn-pw_change_modal" id="pw_change_modal">비밀번호 변경</button>
                      </div><%-- /.form-group --%>
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
                     <br>
                     
                      <div class="form-group">
                        <label for="user_birth">생년월일</label>
                        <input type="date" class="form-control" 
                        		name="user_birth" value="<fmt:formatDate pattern = 'YYYY-MM-dd' value='${myinfo.user_birth}'/>"  readonly="readonly" style="background-color:#2A3038">
                      </div><%-- /.form-group --%>
                     <br>
                     
                     <div class="form-group">
                        <label for="user_email">이메일</label>
                        <input type="email" class="form-control" id="user_email"
                        		name="user_email" value="<c:out value='${myinfo.user_email}' />">&nbsp;<h6 id="right_email_form" style="color: red;"></h6>
                      </div><%--/.form-group --%>
                      
					  <div class="form-group">
                        <label for="user_tag">나의 태그</label>
                        <input class="form-control" name="user_tag" rows="3" 
                        		value="<c:out value='${myinfo.user_tag}' />"></input>
                      </div><%-- /.form-group --%>
                     <br>
                      
                      <div class="form-group">
                        <label for="user_rate">나의 점수</label>
                        <%-- 앞에 하트 혹은 무언가 --%>
                        <input class="form-control" name="user_rate"
                        		value='<fmt:formatNumber value = "${myinfo.user_rate}" pattern=".0"/>' readonly="readonly" style="background-color:#2A3038">
                      </div><%-- /.form-group --%>         
                     <br>
                     
                    <%--  <div class="form-group">
                    	 <input type="hidden" value="<c:out value='${myinfo.user_delflag}'/>">
                     </div> --%><%-- /.form-group --%>
                      
                      <%--<div class="form-group">
                       <label>File upload</label>
                       <input type="file" name="img[]" class="file-upload-default">
                       <div class="input-group col-xs-12">
                         <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                         <span class="input-group-append">
                           <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                         </span>
                       </div>
                     </div>--%>
                      
                      <br><br>
                      <button type="button" class="btn btn-primary mr-2 btn-frm_mod" id="btn_mod" data-oper="modify">
                      정보 수정</button>
                      <button type="reset" class="btn btn-dark btn-frm_mod" data-oper="reset">
                      입력 취소</button>
                      <br><br>
                      
                      <hr class="my-2">
                      <br>
                      <div class="ml-auto" style="width:200px;">
	                      <div class="form-group">
	                        <button type="button" class="btn btn-outline-dark btn-sm" id="btn_remove"
	                        data-oper="remove">회원 탈퇴</button>
	                      </div>    
                      </div>
                      
                    </form><%--/.frm_mypage_info --%>
                  </div><%-- /.card-body --%>
                </div><%-- /.card --%>  
              </div><%-- /.col-md-6 grid-margin stretch-card --%>
            </div><%-- /.row --%>
          </div><%-- /.content-wrapper --%>
       </div><%-- /.main-panel --%>
   
<script>
var frm_mypage_info = $("#frm_mypage_info");
var pw_form = false;
var pw_check = false;

var csrfHeaderName = "${_csrf.headerName}"; 
var csrfTokenValue = "${_csrf.token}";

var msg = "";

//비번변경 모달창
$(function(){
   $("#pw_change_modal").on("click", function(){
      $(".modal").modal("show");
   });
   
});

//사용자 정보 수정(정보수정 / 입력 리셋 / 비번변경 /탈퇴)
$('button').on("click", function(){
   var operation = $(this).data("oper");
   
   if(operation == "modify"){ //정보수정
	      if(confirm("정말 수정하시겠습니까?")){
	    	  
	    	  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    	  var reg_email = frm_mypage_info.find("input[name=user_email]").val();
	    	   
	    	  if(regExp.exec(reg_email) != null){
	  		  	frm_mypage_info.attr("action","${contextPath}/mypage/myinfo_modify");
		        frm_mypage_info.submit();
		        alert("수정되었습니다!");
		         
	  	  	  }else{ 
		  	      msg = "이메일을 형식에 맞게 작성해주세요!";
		     		  $("#right_email_form").html(msg);
		     		  $("#right_email_form").css("color", "pink");
		     		  $("#right_email_form").css("display", "block");
		     		  $("#right_email_form").css("text-align", "left");
		     		  $("#right_email_form").css("font-size", "12px");
		     		  $("#right_email_form").css("padding", "2px");
		     		  msg = ""; 
		     		  return;
	  	  		}
	
	      }else{
	            return;
	       }
      
   }else if(operation == "reset"){
	      $('form').each(function() {
	            this.reset();
	        });
	      return;
   }else if (operation == "change") {

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
	      
   }else if(operation == "remove"){
      
	      if(confirm("참말참말 탈퇴 하실 건가요? 되돌릴 수 없을 걸")){
	         frm_mypage_info.attr("action","${contextPath}/mypage/myid_remove");
	         frm_mypage_info.submit();
	      }else{
	         return;
	      }
      
   }

});

</script>

<%@ include file="../../templet/footer.jsp" %>
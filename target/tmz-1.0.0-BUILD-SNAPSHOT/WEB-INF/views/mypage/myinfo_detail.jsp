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

<sec:csrfInput />
 
 <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">
              	<c:out value="${username}"/>님
              </h3>
            </div><%-- /.page-header --%>
            <div class="row">
              <div class="col-md-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">나의 정보</h4>
                    <!-- <p class="card-description"> Basic form layout </p> -->

                      <div class="form-group">
                        <label for="user_name">이름</label>
                        <input id="user_name" class="form-control" 
                        		value="<c:out value='${myinfo.user_name}' />"
                        		readonly="readonly" style="background-color:#2A3038">
                      </div><%-- /.form-group --%>
                      
                      <div class="form-group">
                        <label for="user_pw">비밀번호</label>
                        <input type="password" class="form-control" 
                        		id="user_pw" placeholder="수정페이지에서 수정할 수 있습니다"
                        		readonly="readonly" style="background-color:#2A3038">
                      </div><%-- /.form-group --%>
                     
                      <div class="form-group">
                        <label for="user_birth">생년월일</label>
                        <input type="date" class="form-control" 
                        		id="user_birth" value="<fmt:formatDate pattern = 'YYYY-MM-dd' value='${myinfo.user_birth}'/>"
                        		readonly="readonly" style="background-color:#2A3038">
                      </div><%-- /.form-group --%>
                      
                      <div class="form-group">
                        <label for="user_email">이메일</label>
                        <input type="email" class="form-control" 
                        		id="user_email" placeholder="<c:out value='${myinfo.user_email}' />"
                        		readonly="readonly" style="background-color:#2A3038">
                      </div><%-- /.form-group --%>
                      
                      
					  <div class="form-group">
                        <label for="user_tag">나의 한 마디</label>
                        <textarea class="form-control" id="user_tag" rows="3" 
                        		placeholder="<c:out value='${myinfo.user_tag}' />"
                        		readonly="readonly" style="background-color:#2A3038"></textarea>
                      </div><%-- /.form-group --%>
                      
                      <div class="form-group">
                        <label for="user_rate">나의 점수</label>
                        <%-- 앞에 하트 혹은 무언가 --%>
                        <input class="form-control" id="user_rate"
                        		value='<fmt:formatNumber value = "${myinfo.user_rate}" pattern=".0"/>' readonly="readonly" style="background-color:#2A3038">
                        		
                      </div><%-- /.form-group --%>   
                      
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
                      
                      <%-- <div class="form-group">
                       <label for="exampleSelectGender">Gender</label>
                       <select class="form-control" id="exampleSelectGender">
                         <option>Male</option>
                         <option>Female</option>
                       </select>
                     </div>--%>
                      
                      <br><br>
                      <div>
                      <button type="button" class="btn btn-info mr-2 btn-block btn-frm_mod" id="btn_mod" data-oper="modify"
                      data-target="#example_modal" data-toggle="modal">
                      정보 수정</button>
                      <br></div>
                      <%--회원 비번 재확인 모달 --%>
                      <div class="modal" tabindex="-1" data-backdrop="static" id="example_modal">
						   <div class="modal-dialog modal-dialog-centered">
						      <div class="modal-content" style = "background-color : #191C24;">
						      
						         <div class="modal-header">
						            <h5 class="modal-title">비밀번호 확인</h5>
						            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						               <span aria-hidden="true">&times;</span>
						            </button>
						         </div>
						         
						         <div class="modal-body">
						            <h5><c:out value="${myinfo.user_id}"/>님 정보를 수정하기 위해 비밀번호를 입력해주세요.</h5>
					                  <table class="table table-bordered">
					                     <tr>
					                        <th><strong>아이디</strong></th>
					                        <td><c:out value="${myinfo.user_id}"/></td>
					                     </tr>
					                     <tr>
					                        <th><strong>암호</strong></th>
					                        <td><input style="height:25px;" id="check_pw" type="password" placeholder="암호를 입력해주세요.">&nbsp;<h6 id="wrong_pw" style="color: pink;"></h6></td>                  
					                     </tr>
					                  </table>
						         </div>
						         
						         <div class="modal-footer">
						            <button type="button" id = "mod_apply_button" class="btn btn-primary">입력</button>
						            <button id="cancle" type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
						         </div>
						         
						      </div>
						   </div>
						</div><%-- /.modal end --%>
						
                  </div><%-- /.card-body --%>
                </div><%-- /.card --%>  
              </div><%-- /.col-md-6 grid-margin stretch-card --%>
            </div><%-- /.row --%>
          </div><%-- /.content-wrapper --%>
       </div><%-- /.main-panel --%>
      
      
<script>
var user_pw = "${myinfo.user_pw}";

//비밀번호 재확인 모달
$(document).ready(function(){
	$("#mod_apply_button").on("click",function(){
	   
	   var check_pw = $("#check_pw").val();
	   var user_id = "<c:out value='${myinfo.user_id}'/>";
		   
	   var msg = "";
	   
	   $.ajax({
		   	type: "get",
			url: "${contextPath}/mypage/mypw_check/" + user_id + "/"+ check_pw,
			datatype: 'json',
			success: function(check_result, xhr){
				if(check_result){
					location.href="${contextPath}/mypage/myinfo_modify?user_id=<c:out value='${myinfo.user_id}' />";
				}else{
					msg = "비밀번호를 다시 확인해주세요!";
				      $("#wrong_pw").html(msg);
				      $("#wrong_pw").css("display", "inline");
				      msg = ""; 
				      return;
				}
			},
			error: function(xhr){
				alert("error");
			}
	   }); //.ajax end
	      
	});

	});
</script>


<%@ include file="../../templet/footer.jsp" %>
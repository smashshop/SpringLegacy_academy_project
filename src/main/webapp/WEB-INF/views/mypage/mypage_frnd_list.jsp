<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ include file="../../templet/header.jsp" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="username"/>
</sec:authorize>

 <form class="form-inline" id="frm_send_value" action="${contextPath }/mypage/mypage_frnd_list" method="get" name="frmSendValue">
	<sec:csrfInput />
	<div class="col-lg-12 grid-margin stretch-card">
         <div class="card">
             <div class="card-body">
               <h4 class="card-title"><c:out value='${frnd_writer}'/>님의 동행 게시판</h4>
               <div class="table-responsive">
                 <table class="table table-bordered">
                   <thead>
                     <tr>
                       <th> # </th>
                       <th> 제목 </th>
                       <th> 여행지 </th>
                       <th> 여행일정 </th>  
                     </tr>
                   </thead>
                   
                   <tbody>
                  <c:if test="${myfrnd_list.size() == 0}">
	               		<tr style="background-color: purple; text-align: center;">
	                    	<td colspan="5">작성한 동행글이 없어요 함께 해봐요</td>
	                    </tr>
	               </c:if>
	               
	               <c:if test="${myfrnd_list.size() > 0 }">
                   <c:forEach items="${myfrnd_list}" var="frnd">
	                   
	                   <c:if test="${!frnd.frnd_delflag}">
	                     <tr class="move_frnd_detail" data-frnd_no="<c:out value='${frnd.frnd_no }'/>">  
	                       <td > <c:out value="${frnd.frnd_no }"/> </td>
	                       <td> <c:out value="${frnd.frnd_title }"/> </td>
	                       <td> <c:out value="${frnd.frnd_country}"/>,&nbsp;<c:out value="${frnd.frnd_city}"/> </td>
	                       <td> 
	                       		<fmt:formatDate pattern = "YYYY-MM-dd" value="${frnd.frnd_startdate}"/>&nbsp;~ &nbsp;
	   							<fmt:formatDate pattern = "YYYY-MM-dd" value="${frnd.frnd_enddate}"/> 
	                       </td>
	                     </tr>
	                    
                     </c:if>
                    </c:forEach>
                   </c:if> 
                   <!-- <tr><td colspan="5"><button type="button" id = "more_scroll" class="btn btn-outline-secondary btn-block">더보기</button></td></tr> -->
                   </tbody>
                 </table>
               </div>
             </div>
           </div>
         </div>
         
</form>

      

<script type="text/javascript">

//상세 페이지 호출
$(".move_frnd_detail").on("click", function(){
	$(location).attr('href', "${contextPath}/friend/friend-detail?frnd_no=" + $(this).data("frnd_no"))
	
});

//더보기 관련 코드
var scroll_count = 1;
if(result.length < 10){ //result는 ajax에서 가져온 값일거라서 나도 ajax로
      $("#more_scroll").remove();
  }

</script>

<%@ include file="../../templet/footer.jsp" %>
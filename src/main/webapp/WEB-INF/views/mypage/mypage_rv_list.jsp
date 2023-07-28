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

 <form class="form-inline" id="frm_send_value" action="${contextPath }/mypage/mypage_rv_list" method="get" name="frmSendValue">
 <sec:csrfInput />
	<div class="col-lg-12 grid-margin stretch-card" style="overflow:scroll;">
         <div class="card">
             <div class="card-body">
               <h4 class="card-title"><c:out value='${rv_writer}'/>님의 후기 게시판</h4>
               <div class="table-responsive">
                 <table class="table table-bordered">
                   <thead>
                     <tr>
                       <th> # </th> 
                       <th> 제목 </th>
                       <th> 작성일 </th>
                       <th> 댓글수 </th>  
                     </tr>
                   </thead>
                   
                   <tbody>
	              <c:if test="${myrv_list.size() == 0}">
	               		<tr style="background-color: purple; text-align: center;">
	                    	<td colspan="5"><em>작성한 후기글이 없어요 후기를 써봐요</em></td>
	                    </tr>
	               </c:if>
	               
	               <c:if test="${myrv_list.size() > 0 }">
                   <c:forEach items="${myrv_list}" var="rv">
	                   <c:if test="${rv.rv_delflag == 1 }">
	                      	<tr style="background-color: Moccasin; text-align: center;">
	                    		<td><c:out value="${board.bno }"/></td>
	                    		<td colspan="5"><em>작성자에 의해 삭제된 게시물</em></td>
	                      	</tr>
	                   </c:if>
	                   <c:if test="${rv.rv_delflag == 0}">
                  		 <tr class="move_rv_detail" data-rv_no="<c:out value='${rv.rv_no }'/>">
	                       <td> <c:out value="${rv.rv_no }"/> </td>
	                       <td> <c:out value="${rv.rv_title }"/> </td>
	                       <td> <fmt:formatDate pattern = "YYYY-MM-dd" value="${rv.rv_regdate}"/></td>
	                       <td><c:out value="${rv.rv_replcnt }"/></td>
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
$(".move_rv_detail").on("click", function(){
	$(location).attr('href', "${contextPath}/review/review-detail?rv_no=" + $(this).data("rv_no"))
	
});
	

</script>

<%@ include file="../../templet/footer.jsp" %>
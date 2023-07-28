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

<form class="form-inline" id="frm_send_value" action="${contextPath }/mypage/mypage_prty_list" method="post" name="frm_send_value">
<sec:csrfInput/> 
	<div class="col-lg-12 grid-margin stretch-card">
         <div class="card">
             <div class="card-body">
               <h4 class="card-title"><c:out value='${username}'/>님의 지난 동행</h4>
               <div class="table-responsive">
                 <table class="table table-bordered">
                   <thead>
                     <tr>
                       <th> 여행지 </th>
                       <th> 여행일정 </th>
                       <th> 동행자</th>
                       <th> 평점 주기 </th>
                       <th> 내가 준 평점</th>
                     </tr>
                   </thead>
                   
                   <tbody id="page_more">
                   
                   <c:if test="${myprty_list.size() == 0}">
                     	<tr style="background-color: purple; text-align: center;">
                   			<td colspan="5">함께한 동행자가 없어요 같이 가요</td>
                     	</tr>
	               </c:if>
                 
                  <%@ include file="../modal/rating_modal.jsp" %>
                  <c:if test="${myprty_list.size() > 0 }">
                   	<c:forEach items="${myprty_list}" var="party">
	                    <c:if test="${party.party_member != username }">
	                     <tr>  	                      
	                       <td class="move_frnd_detail" data-frnd_no="<c:out value='${party.frnd_no }'/>"> 
	                       		<c:out value="${party.frnd_country}"/>,&nbsp;<c:out value="${party.frnd_city}"/> </td>
	                       <td class="move_frnd_detail" data-frnd_no="<c:out value='${party.frnd_no }'/>"> 
	                       		<fmt:formatDate pattern = "YYYY-MM-dd" value="${party.frnd_startdate}"/>&nbsp;~ &nbsp;
	   							<fmt:formatDate pattern = "YYYY-MM-dd" value="${party.frnd_enddate}"/> 
	                       </td>
	                       <td> <c:out value="${party.party_member }"/></td>
	                     
	                       <td> 
	                       <button type="button" id=rating_modal class="btn btn-secondary rating_modal" data-member = "${party.party_member }"
	                       			data-bno ="${party.frnd_no }" <c:out value="${party.rate_num eq null ? '' : 'disabled'}" />>
	                       평점</button>

	                       </td>
	                       <td> 
	                       		<c:out value="${party.rate_num}"/>
	                       	</td>
	                     
	                     </tr>
                    	 </c:if>
                    	</c:forEach>
                  	
                     </c:if>
                   </tbody>
                 </table>
                 <button type="button" id = "more_scroll" class="btn btn-outline-secondary btn-block">더보기</button>
               </div>
             </div>
           </div>
         </div>
         <input type="hidden" class="frnd_no" name="frnd_no">
         <input type="hidden" class="rated_id" name="rated_id">
</form>
 
<script type="text/javascript">
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
var page_more = $("#page_more");
//동행글 누르면 해당 detail 페이지로
$(".move_frnd_detail").on("click", function(){
	$(location).attr('href', "${contextPath}/friend/friend-detail?frnd_no=" + $(this).data("frnd_no"));
	
});

//점수 주는 모달창 뒤로가기 방지 
$(function(){
	$("#page_more").on("click", "tr>td>.rating_modal", function(){
		$(".modal").modal("show");
		$(".rated_id").val($(this).data("member"));
		$(".frnd_no").val($(this).data("bno"));
		window.addEventListener('popstate', function(event) { 
		history.pushState(null, null, location.href);
		})
		history.pushState(null, null, location.href);
		
	});
	
	$(".close").click(function(){
		$(".modal").modal("hide");
	})
	
}); 

//더보기버튼 더 없으면 사라지게
var scroll_count = 1;
/* 	if(result.length < 10){
	    $("#more_scroll").remove();
	} */

//더보기 버튼 처리
$("#more_scroll").on("click", function(){
	scroll_count += 1;
	var user_id = "${username}"
	
	
	$.ajax({
		url:"${contextPath}/mypage/more_party_list/"+user_id+"/"+scroll_count,
		type: "post",
		dataType: "json",
		beforeSend : function(xhr){
			//시큐리티 사용시 post 요청할 때 csrf값을 같이 줘야한다
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function(result, status, xhr){
			
			var str = '';
			if(result.length < 10){
				$("#more_scroll").remove();
			}
			
			$(result).each(function(i, mem){
				
				if(mem.party_member != "${username}" ){
					
					var date1 = new Date(mem.frnd_startdate);
					var date2 = new Date(mem.frnd_enddate);
					
					var year = date1.getFullYear();
					var month = ('0' + (date1.getMonth() + 1) ).slice(-2);
					var day = ('0' + date1.getDate() ).slice(-2);
					
					var startdate = year + "-" + month + "-" + day;
					
					year = date2.getFullYear();
					month = ('0' + (date2.getMonth() + 1) ).slice(-2);
					day = ('0' + date2.getDate() ).slice(-2);
					
					var enddate = year + "-" + month + "-" + day;
					
					str += '<tr>' 	                      
	                     + '	<td class="move_frnd_detail" data-frnd_no="'+ mem.frnd_no + '">' 
						 + 		mem.frnd_country + ',&nbsp;' + mem.frnd_city + '</td>'               			 
               			 + '	<td class="move_frnd_detail" data-frnd_no="' + mem.frnd_no + '">'
                   		 +		 startdate +'&nbsp;~&nbsp;' 
                   		 + 		enddate	
                   		 + '	</td>'
                   		 + '	<td>' + mem.party_member + '</td>'
                 
                   		 + '	<td>' 
                   		 + '	<button type="button" id=rating_modal class="btn btn-secondary ratng_modal" data-member = "' + mem.party_member + '"'
                   		 + 		((mem.rate_num == null) ? '' : 'disabled') + '>'
                   		 + '	평점</button>'

		                 + '	<input type="hidden" class="rated_id" value="' + mem.rated_id +'">'
		                 + '	<input type="hidden" name="frnd_no" value="' + mem.frnd_no +'">'
		                  
		                 + '	</td>'
		                 + '	<td>' 
		                 + 		((mem.rate_num == null) ? '' : mem.rate_num)
		                 +' 	</td>'
		         		 + '</tr>';
					}
					
				});
			
			page_more.append(str);
		},
		error: function(er) {
			alert("error");
		}
	});
});

	


</script>

<%@ include file="../../templet/footer.jsp" %>
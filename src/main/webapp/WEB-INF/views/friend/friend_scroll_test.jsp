<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>

<%@ include file = "../../templet/header.jsp"%>

<div class="welcome-msg col-12">
   <h1 class="text-muted display-1" align="center" >여행을 동행할</h1>
   <h1 class="text-muted display-1" align="center" >마음 맞는 친구들을 찾아보세요!</h1>   
</div>

<div class="form-calendar col-11">   
   <input type="date" class="form-control"
         style="background-color: black; width: 200px"/>
</div>

<div class="select-location col-12 mb-2">   
   <select id="selected_continent" class="js-example-basic-single select2-hidden-accessible" 
         onchange="selected_value(this)"
         style="width: 200px" data-select2-id="1" tabindex="-1" aria-hidden="true">      
      <c:forEach items="${continent_info}" var="continent">         
         <option value = "${continent.continent_name}">${continent.continent_name}</option>
       </c:forEach>
   </select>
   
   <select id="selected_country" class="js-example-basic-single select2-hidden-accessible" 
         style="width: 200px" data-select2-id="2" tabindex="-1" aria-hidden="true">
      <c:forEach items="${country_info}" var="country">
         <option value = "${country.country_name}">${country.country_name}</option>
       </c:forEach>
   </select>
   
   <button type="button" style="float:right" class="btn btn-outline-info btn-fw btn-lg"
         onclick="location.href='${contextPath}/friend/friend-register'">글쓰기
   </button>
   
   <!-- 검색 설정 초기화 버튼 -->
   <button id="button_reset" type="button" class="btn btn-outline-warning btn-icon-text">
      <i class="mdi mdi-reload btn-icon-prepend"> Reset </i> 
   </button>
   
   <span class="button_search"><!-- 검색 버튼 -->
      <button class="btn btn-outline-success btn-icon-text" type="button" id="btnSearchGo">
         <i class="mdi mdi-checkbox-marked-outline">&nbsp;Search </i>
      </button>
   </span>
   
</div>


<section>
<div class="row">



   <c:forEach items="${frnd_list}" var="friend">
   
       <div class="col-xl-3 col-sm-6 grid-margin stretch-card post_detail" data-frnd_no = "${friend.frnd_no}">
       
         <div class="card">
           <div class="card-body">           
             <div class="row">
               <div class="col-12"> <!-- 이미지 삽입 위치 -->
                  <img src="${contextPath}/resources/img/Image01.jpg" width="100%" height="200" alt="이미지가 없습니다."/>
                 <div class="d-flex align-items-center align-self-start my-2">
                    
                    <c:if test="${friend.frnd_status == false}">
                       <h3 class="text-success font-weight-bold mt-3 mb-0" 
                          style="font-family:HY헤드라인M;"> 모집 중
                       </h3>
                       
                       <h5 class="text-secondary mt-4 ml-3">
                          <c:out value="${friend.frnd_now_mem}"/>/ 
                            <c:out value="${friend.frnd_member_cnt}"/>
                       </h5>
                    </c:if>
                       
                    <c:if test="${friend.frnd_status == true}">
                       <h3 class="text-danger font-weight-bold mt-3 mb-0" 
                          style="font-family:HY헤드라인M;"> 모집 마감
                       </h3>
                    </c:if>
               
                 </div>
               </div>            
             </div>             
             
              <h6 class="text-secondary font-weight-normal my-3">
               <i class="mdi mdi-airplane-landing">
                  <c:out value="${friend.frnd_city}"/>, 
                      <c:out value="${friend.frnd_country}"/>
              </i> 
              </h6>
            
              <h6 class="text-secondary font-weight-normal my-3">                 
               <i class="mdi mdi-account"></i>
              <c:out value="${friend.frnd_writer}"/>
              </h6>  
             
             <h6 class="text-secondary font-weight-normal mb-3">
                 <i class="mdi mdi-calendar">
                    <fmt:formatDate pattern = "YYYY-MM-dd" value="${friend.frnd_startdate}"/>
               &nbsp;~ &nbsp;
               <fmt:formatDate pattern = "YYYY-MM-dd" value="${friend.frnd_enddate}"/>
            </i>
           </h6>
                        
           </div>
         </div>
         
       </div>       

   
    </c:forEach>


</div>
</section>

<script>
$(".post_detail").on("click", function() {
   self.location = "${contextPath}/friend/friend-detail?frnd_no=" + $(this).data("frnd_no");
});



</script>
<%@ include file = "../../templet/footer.jsp"%>
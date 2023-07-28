<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>

 <%@ include file="../../templet/header.jsp" %>
 
      <div class = "img_wrapper my-4" style = "width : 100%; height : 350px;">
   	  <img src = "${pageContext.request.contextPath }/resources/assets/images/admin/admin.png" alt = "이미지 없음" class = "rounded" width = "100%" height = "100%"/>
   	 </div> 
   
        <!-- partial -->
        <div class="main-panel">
        
         <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">동행 순위</h4>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                			<th><strong> 순위 </strong></th>
                			
                            <th><strong> 아이디 </strong></th>
                            
              				<th><strong> 이름 </strong></th>
      
                            
                            <th><strong> 동행횟수 </strong></th>
                  
                          </tr>
                        </thead>
                       <tbody>                     
                                      
                   <c:forEach var="board" items="${select_friend_cnt }" varStatus="status">
             			<tr>
                     
                           
                   					  <td><strong><c:out value="${status.count}" /></strong></td>
                                      
                                       <td><c:out value="${board.frepl_writer }" /></td>

                           
                             		   <td><c:out value="${board.user_name }" /></td>

                                      
                                      <td><c:out value="${board.frepl_confirm_sum }" /></td>
                                      
                           </tr>        
                              
              
                              
                           </c:forEach>
                              
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              
     
              

        
        
         <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">평점 목록</h4>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                			<th><strong> 평점 작성자 </strong></th>
                			
                            <th><strong> 평점 대상자 </strong></th>
                            
                     
                            <th><strong> 평점 </strong></th> 
                            
                            <th><strong> 평점 내용 </strong></th>
                            
                              <th><strong> 글제목 </strong></th> 
                            
                            <th><strong> 나라(국가) </strong></th>
                            
                            <th><strong> 동행일자 </strong></th>
                  
                          </tr>
                        </thead>
                       <tbody>                     
                                      
                   <c:forEach var="board" items="${select_rate_list }" varStatus="status">
     
                     
                           <tr>
                   					  <td><c:out value="${board.rating_id}" /></td>
                                      
                                       <td><c:out value="${board.rated_id }" /></td>
                            
                                      
                           
                                     <td><c:out value="${board.rate_num }" /></td>
                    
                                      
                                      <td><c:out value="${board.party_comment }" /></td>
                                      
                                   <td><c:out value="${board.frnd_title }" /></td>
                                   
                                   <td><c:out value="${board.frnd_country }" /></td>
                       
                                     <td align="left"><fmt:formatDate value="${board.frnd_startdate }" pattern="yyyy-MM-dd" />&nbsp;~&nbsp;
                                     <fmt:formatDate value="${board.frnd_enddate }" pattern="yyyy-MM-dd" /></td>
                            </tr>  
                           </c:forEach>
                              
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
          
 
          
          

          
          
          
  
          
          
     <%@ include file="../../templet/footer.jsp" %>
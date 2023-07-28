<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>

<!DOCTYPE html>

        <%@ include file="../../templet/header.jsp" %>
     
               <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            
            <%--게시판 --%>
            <div class="row ">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">방문 통계</h4>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                			<th> 순위 </th>
               
                            <th> 아이디 </th>
                            
                            <th> 이름 </th>
                          
                            <th> 등록날짜 </th>
                            
                            <th> 평점 </th>
                  
                          </tr>
                        </thead>
                       <tbody>                     
                                      
                   <c:forEach var="board" items="${boardList }">
                     
                                  <tr class="odd gradeX">
                                  
                                 <td>
                              <div class="progress">
                                <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                   
                                      <td><c:out value="${board.user_id }" /></td>
                            
                                      
                           
                                      <td><c:out value="${board.user_name }" /></td>
                             
                                  
                             
                                      <td><c:out value="${board.user_regdate }" /></td>
                                  
                                    
                                      
                                      <td><c:out value="${board.user_rate }" /></td>
                              
                                 </tr>
                              
                           </c:forEach>
                              
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <%--게시판 끝 --%>
          
        
                    
                    
                    
                    
             <%--   <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Bordered table</h4>
                    <p class="card-description"> Add class <code>.table-bordered</code>
                    </p>
                    <div class="table-responsive">
                      <table class="table table-bordered">
                        <thead>
                          <tr>
                            <th> # </th>
                            <th> First name </th>
                            <th> Progress </th>
                            <th> Amount </th>
                            <th> Deadline </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td> 1 </td>
                            <td> Herman Beck </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                            <td> $ 77.99 </td>
                            <td> May 15, 2015 </td>
                          </tr>
                          <tr>
                            <td> 2 </td>
                            <td> Messsy Adam </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                            <td> $245.30 </td>
                            <td> July 1, 2015 </td>
                          </tr>
                          <tr>
                            <td> 3 </td>
                            <td> John Richards </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                            <td> $138.00 </td>
                            <td> Apr 12, 2015 </td>
                          </tr>
                          <tr>
                            <td> 4 </td>
                            <td> Peter Meggik </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-primary" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                            <td> $ 77.99 </td>
                            <td> May 15, 2015 </td>
                          </tr>
                          <tr>
                            <td> 5 </td>
                            <td> Edward </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-danger" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                            <td> $ 160.25 </td>
                            <td> May 03, 2015 </td>
                          </tr>
                          <tr>
                            <td> 6 </td>
                            <td> John Doe </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-info" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                            <td> $ 123.21 </td>
                            <td> April 05, 2015 </td>
                          </tr>
                          <tr>
                            <td> 7 </td>
                            <td> Henry Tom </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                            <td> $ 150.00 </td>
                            <td> June 16, 2015 </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>      
  --%>
 <script>
 
 var frmSendValue = $("#frmSendValue");
 
//페이지 이동
 $(".page-item a").on("click", function(e){
    e.preventDefault();
    
    frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
    frmSendValue.attr("action", "${contextPath}/admin/allmember");
    frmSendValue.attr("method", "get");
    frmSendValue.submit(); 
 });
</script>
 
 
 
 
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
  
    <%@ include file="../../templet/footer.jsp" %>
 
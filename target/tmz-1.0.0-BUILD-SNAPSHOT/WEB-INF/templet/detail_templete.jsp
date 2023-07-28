<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>

<%@ include file = "header.jsp"%>
<div class="col-md-12 grid-margin stretch-card">
  <div class="card">
  
    <div class="card-body px-5">
    
     <div class = "img_wrapper my-4" style = "width : 100%; height : 350px;">
   	  <img src = "1655520379991.jpg" alt = "이미지 없음" class = "rounded" width = "100%" height = "100%"/>
   	 </div>
   	 
      <div class="d-flex flex-row justify-content-between mt-5">
      <h3 class="card-title mb-1">제목</h3>
        <div>
	        <button type="button" class="btn btn-outline-secondary btn-icon-text">
	         <i class = "mdi mdi-border-color"></i>수정
	        </button>
	        <button type="button" class="btn btn-outline-primary btn-icon-text ml-1">
	         <i class="mdi mdi-file-check btn-icon-prepend"></i>목록
	        </button>
        </div>
      </div><br>
      
      <div class="d-flex flex-row justify-content-between">
      <p class="text-muted mb-1">여행지 : 나라 &nbsp; 도시</p>
      <p class="text-muted mb-1">
       <i class="mdi mdi-airplane"></i>
       시작날자
        &nbsp;~ &nbsp;끝 날자
      </p>
      <p class="text-muted mb-1">작성자표시</p>
      </div>
      
      <div class="row">
        <div class="col-12">
          <div class="preview-list">
            <div class="form-group"><br>
              <label for="exampleTextarea1"></label>
              <div class = "px-5">
               글 내용 표시영역
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </div>
</div>

<div class="col-md-12 grid-margin stretch-card">
  <div class="card px-3">
  
    <div class="card-body px-5 my2">
    	<div class="form-group">
          <textarea class="form-control" id="exampleTextarea1" rows="10" style = "color : white;"></textarea>
          <button type="button" class="btn btn-primary btn-icon-text mt-4 float-right">
           <i class="mdi mdi-upload btn-icon-prepend"></i> 등록
          </button>
        </div>
    </div>
  </div>
</div>
<%@ include file = "footer.jsp"%>
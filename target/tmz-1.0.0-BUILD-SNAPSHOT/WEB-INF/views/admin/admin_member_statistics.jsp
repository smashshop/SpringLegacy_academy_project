<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>




<!DOCTYPE html>

  <%@ include file="../../templet/header.jsp" %>

     <div class = "img_wrapper my-4" style = "width : 100%; height : 350px;">
   	  <img src = "${pageContext.request.contextPath }/resources/assets/images/admin/admin.png" alt = "이미지 없음" class = "rounded" width = "100%" height = "100%"/>
   	 </div>
  
    <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
          
            <div class="page-header">
              <h3 class="page-title"> 회원 등록 통계 </h3>
            </div>
          <div class="row">  
        <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">일간 통계</h4>
                    <canvas id="lineChartDay" style="height:230px"></canvas>
                  </div>
                </div>
                </div>
       
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">주간 통계</h4>
                    <canvas id="lineChartWeek" style="height:230px"></canvas>
                  </div>
                </div>
             </div>
             </div>
              
        <div class="row">  
            <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">월간 통계</h4>
                    <canvas id="lineChartMonth" style="height:230px"></canvas>
                  </div>
                </div>
              </div>
              
              
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">연간 통계</h4>
                    <canvas id="lineChartYear" style="height:230px"></canvas>
                  </div>
                </div>
              </div>
              
              </div>
            </div>
            
            
     
           
      
          <!-- content-wrapper ends -->
    </div>
  </div>
  </div>
  
  <script>

/* var x1 = "${select_day_visit_cnt[0].cnt}";
alert(x1);
		
var x2 = "${select_day_visit_cnt}";
alert(x2); */

  function date_Today() {
	    var d = new Date(),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) 
	        month = '0' + month;
	    if (day.length < 2) 
	        day = '0' + day;

	    return [year, month, day].join('-');
	}

  
  function date_Today_add(sDate, nDays) {
	    var yy = parseInt(sDate.substr(0, 4), 10);
	    var mm = parseInt(sDate.substr(5, 2), 10);
	    var dd = parseInt(sDate.substr(8), 10);
	 
	    d = new Date(yy, mm - 1, dd + nDays);
	 
	    yy = d.getFullYear();
	    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
	    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
	 
	    return '' + yy + '-' +  mm  + '-' + dd;
	}

  

  	$(function() {
  		
  
  		
			  var options = {
			    scales: {
			      yAxes: [{
			        ticks: {
			          beginAtZero: true
			        },
			        gridLines: {
			          color: "rgba(204, 204, 204,0.1)" // 그래프 가로 테두리 색깔
			        }
			      }],
			      xAxes: [{
			        gridLines: {
			          color: "rgba(204, 204, 204,0.1)" // 그래프 세로 테두리 색깔
			        }
			      }]
			    },
			    legend: {
			      display: false
			    },
			    elements: {
			      point: {
			        radius: 0
			      }
			    }
			  };
  	
			  
			  var dataDay = {
					    labels: [(date_Today_add(date_Today(), -7)), (date_Today_add(date_Today(), -6)), (date_Today_add(date_Today(), -5)), (date_Today_add(date_Today(), -4)), 
					    	(date_Today_add(date_Today(), -3)), (date_Today_add(date_Today(), -2)), (date_Today_add(date_Today(), -1)), date_Today()],
					    datasets: [{
					      label: '회원수',
					      data: ["${select_day_visit_cnt[0].cnt}", "${select_day_visit_cnt[1].cnt}", "${select_day_visit_cnt[2].cnt}", "${select_day_visit_cnt[3].cnt}", 
					    	  "${select_day_visit_cnt[4].cnt}", "${select_day_visit_cnt[5].cnt}", "${select_day_visit_cnt[6].cnt}", "${select_day_visit_cnt[7].cnt}"],
					      backgroundColor: [
					        'rgba(255, 99, 132, 0.2)',
					        'rgba(54, 162, 235, 0.2)',
					        'rgba(255, 206, 86, 0.2)',
					        'rgba(75, 192, 192, 0.2)',
					        'rgba(153, 102, 255, 0.2)',
					        'rgba(255, 159, 64, 0.2)'
					      ],
					      borderColor: [
					        'rgba(255, 206, 86, 1)',                      
					        'rgba(54, 162, 235, 1)',
					        'rgba(255,99,132,1)',
					        'rgba(75, 192, 192, 1)',
					        'rgba(153, 102, 255, 1)',
					        'rgba(255, 159, 64, 1)'
					      ],
					      borderWidth: 1,
					      fill: false
					    }]
					  };
  		
	  var dataWeek = {
	    labels: [(date_Today_add(date_Today(), -27) + " ~ " + date_Today_add(date_Today(), -21)), (date_Today_add(date_Today(), -20) + " ~ " + date_Today_add(date_Today(), -14)), 
	    	(date_Today_add(date_Today(), -13) + " ~ " + date_Today_add(date_Today(), -7)), (date_Today_add(date_Today(), -6) + " ~ " + date_Today())],
	    datasets: [{
	      label: '회원수',
	      data: ["${WeekVisitCnt4 }", "${WeekVisitCnt3 }", "${WeekVisitCnt2 }", "${WeekVisitCnt }"],
	      backgroundColor: [
	        'rgba(255, 99, 132, 0.2)',
	        'rgba(54, 162, 235, 0.2)',
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)',
	        'rgba(153, 102, 255, 0.2)',
	        'rgba(255, 159, 64, 0.2)'
	      ],
	      borderColor: [
	        'rgba(255, 206, 86, 1)',                      
	        'rgba(54, 162, 235, 1)',
	        'rgba(255,99,132,1)',
	        'rgba(75, 192, 192, 1)',
	        'rgba(153, 102, 255, 1)',
	        'rgba(255, 159, 64, 1)'
	      ],
	      borderWidth: 1,
	      fill: false
	    }]
	  };
	  
	 
	  
	  
	
	  
	  
	  
	   var dataMonth = {
	    labels: ["2022년 1월", "2022년 2월", "2022년 3월", "2022년 4월", "2022년 5월", "2022년 6월", "2022년 7월", "2022년 8월", "2022년 9월", "2022년 10월", "2022년 11월", "2022년 12월"],
	    datasets: [{
	      label: '회원수',
	      data: ["${month_value.m01 }", "${month_value.m02 }", "${month_value.m03 }", "${month_value.m04 }", 
	    	  "${month_value.m05 }", "${month_value.m06 }", "${month_value.m07 }", "${month_value.m08 }", 
	    	  "${month_value.m09 }", "${month_value.m10 }", "${month_value.m11 }", "${month_value.m12 }"],
	      backgroundColor: [
	        'rgba(255, 99, 132, 0.2)',
	        'rgba(54, 162, 235, 0.2)',
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)',
	        'rgba(153, 102, 255, 0.2)',
	        'rgba(255, 159, 64, 0.2)'
	      ],
	      borderColor: [
	          'rgba(255, 206, 86, 1)',                      
		        'rgba(54, 162, 235, 1)',
		        'rgba(255,99,132,1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)'
	      ],
	      borderWidth: 1,
	      fill: false
	    }]
	  };
	  
	  
	  var dataYear = {
	    labels: ["2018년", "2019년", "2020년", "2021년", "2022년"],
	    datasets: [{
	      label: '회원수',
	      data: ["${select_Year_Visit_Cnt1}", "${select_Year_Visit_Cnt2}", "${select_Year_Visit_Cnt3}", "${select_Year_Visit_Cnt4}", "${select_Year_Visit_Cnt5}"],
	      backgroundColor: [
	        'rgba(255, 99, 132, 0.2)',
	        'rgba(54, 162, 235, 0.2)',
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)',
	        'rgba(153, 102, 255, 0.2)',
	        'rgba(255, 159, 64, 0.2)'
	      ],
	      borderColor: [
	          'rgba(255, 206, 86, 1)',                      
		        'rgba(54, 162, 235, 1)',
		        'rgba(255,99,132,1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)'
	      ],
	      borderWidth: 1,
	      fill: false
	    }]
	  };
	  

	     if ($("#lineChartDay").length) {
	    	    var lineChartCanvasDay = $("#lineChartDay").get(0).getContext("2d");
	    	    var lineChartDay = new Chart(lineChartCanvasDay, {
	    	      type: 'line',
	    	      data: dataDay,
	    	      options: options
	    	    });
	    	  }
	     
	     if ($("#lineChartWeek").length) {
	    	    var lineChartCanvasWeek = $("#lineChartWeek").get(0).getContext("2d");
	    	    var lineChartWeek = new Chart(lineChartCanvasWeek, {
	    	      type: 'line',
	    	      data: dataWeek,
	    	      options: options
	    	    });
	    	  }
	     
	     if ($("#lineChartMonth").length) {
	    	    var lineChartCanvasMonth = $("#lineChartMonth").get(0).getContext("2d");
	    	    var lineChartMonth = new Chart(lineChartCanvasMonth, {
	    	      type: 'line',
	    	      data: dataMonth,
	    	      options: options
	    	    });
	    	  }
	     
	     if ($("#lineChartYear").length) {
	    	    var lineChartCanvasYear = $("#lineChartYear").get(0).getContext("2d");
	    	    var lineChartYear = new Chart(lineChartCanvasYear, {
	    	      type: 'line',
	    	      data: dataYear,
	    	      options: options
	    	    });
	    	  }

  	});
  
  </script>
  
  
  
    
    
    
    
  
    
    
    
    
    


   <%@ include file="../../templet/footer.jsp" %>
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
     
         
        <div class="main-panel">
          <div class="content-wrapper">

            <%--게시판 --%>
            <div class="row ">
            
             
              
               <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">대륙별 동행모집 현황(모집 완료)</h4>
                    
                    <canvas id="pieChart" style="height:250px"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
              <div class="page-header">
              <h3 class="page-title"> 나라별 동행모집 현황(모집 완료) </h3>
            </div>
            <div class="row">  
               <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">동아시아</h4>
                    <canvas id="barChart_east_asia" style="height:230px"></canvas>
                  </div>
                </div>
              </div>
              
           	<div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">동남아시아</h4>
                    <canvas id="barChart_southeast_asia" style="height:230px"></canvas>
                  </div>
                </div>
              </div>
              
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">서남아시아</h4>
                    <canvas id="barChart_southwest_asia" style="height:230px"></canvas>
                  </div>
                </div>
              </div>
              
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">유럽</h4>
                    <canvas id="barChart_europe" style="height:230px"></canvas>
                  </div>
                </div>
              </div>
              
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">아메리카</h4>
                    <canvas id="barChart_america" style="height:230px"></canvas>
                  </div>
                </div>
              </div>
              
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">오세아니아</h4>
                    <canvas id="barChart_oceania" style="height:230px"></canvas>
                  </div>
                </div>
              </div>
              
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">아프리카</h4>
                    <canvas id="barChart_africa" style="height:230px"></canvas>
                  </div>
                </div>
              </div>
       
            </div>
            <%--게시판 끝 --%>
         
 <script>   
$(function() {
	 var labelAr=[];
	 var dataAr=[];
	 var labelAr2=[];
	 var dataAr2=[];
	 var labelAr3=[];
	 var dataAr3=[];
	 var labelAr4=[];
	 var dataAr4=[];
	 var labelAr5=[];
	 var dataAr5=[];
	 var labelAr6=[];
	 var dataAr6=[];
	 var labelAr7=[];
	 var dataAr7=[];
	 
	var data_east_asia;
	var data_southeast_asia;
	var data_southwest_asia;
	var data_europe;
	var data_america;
	var data_oceania;
	var data_africa;
	
	 ajaxSend();
	 
	/*  ajaxSend2();
	 
	 function ajaxSend2(){
		 commonAjaxForm("GET",'${contextPath}/admin/selectContryStat',{status:"1"},"json",function(data){
			 alert(data);
		 });
	 }
	 */ 
	 function commonAjaxForm(type,url,data,dataType,callbackFnc){
			$.ajax({
				type : type, //GET OR POST
				url : url, //URL
				data : data, //json DATA 
				dataType : dataType, //TEXT OR JSON OR AND SO ON
				success : callbackFnc, //콜백 함수 후처리
				error : function(xhr, status) {
					alert('[' + status + ']\n\n' + xhr.responseText);
				}
			});
	 }
	 
	 function ajaxSend(){
		 var url='${contextPath}/admin/selectContryStat';
		 var data={status:"1"};
		 var type="GET";
		 var dataType="json";
		 commonAjaxForm(type,url,data,dataType,function(data){
				for(var i=0; i<data.eastSouthasisList.length; i++){
					labelAr.push(data.eastSouthasisList[i].FRND_COUNTRY);
					dataAr.push(data.eastSouthasisList[i].FRND_COUNTRY_CNT);
				}
				 data_southeast_asia = {
						    labels: labelAr,
						    datasets: [{
						      label: '동행자수',
						      data: dataAr,
					      backgroundColor: [
						        'rgba(255, 99, 132, 0.2)',
						        'rgba(54, 162, 235, 0.2)',
						        'rgba(255, 206, 86, 0.2)',
						        'rgba(75, 192, 192, 0.2)',
						        'rgba(153, 102, 255, 0.2)',
						        'rgba(255, 159, 64, 0.2)',
						        
						        'rgba(255, 99, 132, 0.2)',
						        'rgba(54, 162, 235, 0.2)',
						        'rgba(255, 206, 86, 0.2)',
						        'rgba(75, 192, 192, 0.2)',
						        'rgba(153, 102, 255, 0.2)',
						        'rgba(255, 159, 64, 0.2)'
					      ],
					      borderColor: [
						        'rgba(255,99,132,1)',
						        'rgba(54, 162, 235, 1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',
						        'rgba(153, 102, 255, 1)',
						        'rgba(255, 159, 64, 1)',
						        
						        'rgba(255,99,132,1)',
						        'rgba(54, 162, 235, 1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',
						        'rgba(153, 102, 255, 1)',
						        'rgba(255, 159, 64, 1)'
					      ],
					      borderWidth: 1,
					      fill: false
					    }]
					  };
				 labelAr=[];
				 dataAr=[];
				for(var i=0; i<data.eastAsiaList.length; i++){
					labelAr.push(data.eastAsiaList[i].FRND_COUNTRY);
					dataAr.push(data.eastAsiaList[i].FRND_COUNTRY_CNT);
				}
				data_east_asia={
					    labels: labelAr,
					    datasets: [{
					      label: '동행자수',
					      data: dataAr,
					      backgroundColor: [
					        'rgba(255, 99, 132, 0.2)',
					        'rgba(54, 162, 235, 0.2)',
					        'rgba(255, 206, 86, 0.2)',
					        'rgba(75, 192, 192, 0.2)',
					        'rgba(153, 102, 255, 0.2)',
					        'rgba(255, 159, 64, 0.2)',
					        
					        'rgba(255, 99, 132, 0.2)',
					        'rgba(54, 162, 235, 0.2)',
					        'rgba(255, 206, 86, 0.2)',
					        'rgba(75, 192, 192, 0.2)',
					        'rgba(153, 102, 255, 0.2)',
					        'rgba(255, 159, 64, 0.2)'
					      ],
					      borderColor: [
					        'rgba(255,99,132,1)',
					        'rgba(54, 162, 235, 1)',
					        'rgba(255, 206, 86, 1)',
					        'rgba(75, 192, 192, 1)',
					        'rgba(153, 102, 255, 1)',
					        'rgba(255, 159, 64, 1)',
					        
					        'rgba(255,99,132,1)',
					        'rgba(54, 162, 235, 1)',
					        'rgba(255, 206, 86, 1)',
					        'rgba(75, 192, 192, 1)',
					        'rgba(153, 102, 255, 1)',
					        'rgba(255, 159, 64, 1)'
					      ],
					      borderWidth: 1,
					      fill: false
					    }]
					  };
				 labelAr=[];
				 dataAr=[];
				for(var i=0; i<data.westSouthAsisList.length; i++){
					labelAr.push(data.westSouthAsisList[i].FRND_COUNTRY);
					dataAr.push(data.westSouthAsisList[i].FRND_COUNTRY_CNT);
				}
				  data_southwest_asia = {
						    labels: labelAr,
						    datasets: [{
						      label: '동행자수',
						      data: dataAr,
						      backgroundColor: [
							        'rgba(255, 99, 132, 0.2)',
							        'rgba(54, 162, 235, 0.2)',
							        'rgba(255, 206, 86, 0.2)',
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(153, 102, 255, 0.2)',
							        'rgba(255, 159, 64, 0.2)',
							        
							        'rgba(255, 99, 132, 0.2)',
							        'rgba(54, 162, 235, 0.2)',
							        'rgba(255, 206, 86, 0.2)',
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(153, 102, 255, 0.2)',
							        'rgba(255, 159, 64, 0.2)'
						      ],
						      borderColor: [
							        'rgba(255,99,132,1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)',
							        'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)',
							        
							        'rgba(255,99,132,1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)',
							        'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)'
						      ],
						      borderWidth: 1,
						      fill: false
						    }]
						  };
				 labelAr=[];
				 dataAr=[];
				for(var i=0; i<data.armeList.length; i++){
					labelAr.push(data.armeList[i].FRND_COUNTRY);
					dataAr.push(data.armeList[i].FRND_COUNTRY_CNT);
				}
				  data_america = {
						    labels: labelAr,
						    datasets: [{
						      label: '동행자수',
						      data: dataAr,
						      backgroundColor: [
							        'rgba(255, 99, 132, 0.2)',
							        'rgba(54, 162, 235, 0.2)',
							        'rgba(255, 206, 86, 0.2)',
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(153, 102, 255, 0.2)',
							        'rgba(255, 159, 64, 0.2)',
							        
							        'rgba(255, 99, 132, 0.2)',
							        'rgba(54, 162, 235, 0.2)',
							        'rgba(255, 206, 86, 0.2)',
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(153, 102, 255, 0.2)',
							        'rgba(255, 159, 64, 0.2)'
						      ],
						      borderColor: [
							        'rgba(255,99,132,1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)',
							        'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)',
							        
							        'rgba(255,99,132,1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)',
							        'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)'
						      ],
						      borderWidth: 1,
						      fill: false
						    }]
						  };
				 labelAr=[];
				 dataAr=[];
				for(var i=0; i<data.arfList.length; i++){
					labelAr.push(data.arfList[i].FRND_COUNTRY);
					dataAr.push(data.arfList[i].FRND_COUNTRY_CNT);
				}
				  data_africa = {
						    labels: labelAr,
						    datasets: [{
						      label: '동행자수',
						      data: dataAr,
						      backgroundColor: [
							        'rgba(255, 99, 132, 0.2)',
							        'rgba(54, 162, 235, 0.2)',
							        'rgba(255, 206, 86, 0.2)',
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(153, 102, 255, 0.2)',
							        'rgba(255, 159, 64, 0.2)',
							        
							        'rgba(255, 99, 132, 0.2)',
							        'rgba(54, 162, 235, 0.2)',
							        'rgba(255, 206, 86, 0.2)',
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(153, 102, 255, 0.2)',
							        'rgba(255, 159, 64, 0.2)'
						      ],
						      borderColor: [
							        'rgba(255,99,132,1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)',
							        'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)',
							        
							        'rgba(255,99,132,1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)',
							        'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)'
						      ],
						      borderWidth: 1,
						      fill: false
						    }]
						  };
				 labelAr=[];
				 dataAr=[];
				for(var i=0; i<data.oseList.length; i++){
					labelAr.push(data.oseList[i].FRND_COUNTRY);
					dataAr.push(data.oseList[i].FRND_COUNTRY_CNT);
				}
				  data_oceania = {
						    labels: labelAr,
						    datasets: [{
						      label: '동행자수',
						      data: dataAr,
						      backgroundColor: [
							        'rgba(255, 99, 132, 0.2)',
							        'rgba(54, 162, 235, 0.2)',
							        'rgba(255, 206, 86, 0.2)',
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(153, 102, 255, 0.2)',
							        'rgba(255, 159, 64, 0.2)',
							        
							        'rgba(255, 99, 132, 0.2)',
							        'rgba(54, 162, 235, 0.2)',
							        'rgba(255, 206, 86, 0.2)',
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(153, 102, 255, 0.2)',
							        'rgba(255, 159, 64, 0.2)'
						      ],
						      borderColor: [
							        'rgba(255,99,132,1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)',
							        'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)',
							        
							        'rgba(255,99,132,1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)',
							        'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)'
						      ],
						      borderWidth: 1,
						      fill: false
						    }]
						  };
				 labelAr=[];
				 dataAr=[];
				for(var i=0; i<data.europeList.length; i++){
					labelAr.push(data.europeList[i].FRND_COUNTRY);
					dataAr.push(data.europeList[i].FRND_COUNTRY_CNT);
				}
				  data_europe = {
						    labels: labelAr,
						    datasets: [{
						      label: '동행자수',
						      data: dataAr,
						      backgroundColor: [
						        'rgba(255, 99, 132, 0.2)',
						        'rgba(54, 162, 235, 0.2)',
						        'rgba(255, 206, 86, 0.2)',
						        'rgba(75, 192, 192, 0.2)',
						        'rgba(153, 102, 255, 0.2)',
						        'rgba(255, 159, 64, 0.2)',
						        
						        'rgba(255, 99, 132, 0.2)',
						        'rgba(54, 162, 235, 0.2)',
						        'rgba(255, 206, 86, 0.2)',
						        'rgba(75, 192, 192, 0.2)',
						        'rgba(153, 102, 255, 0.2)',
						        'rgba(255, 159, 64, 0.2)',
						        
						        'rgba(255, 99, 132, 0.2)',
						        'rgba(54, 162, 235, 0.2)',
						        'rgba(255, 206, 86, 0.2)',
						        'rgba(75, 192, 192, 0.2)',
						        'rgba(153, 102, 255, 0.2)',
						        'rgba(255, 159, 64, 0.2)',
						        
						        'rgba(255, 99, 132, 0.2)',
						        'rgba(54, 162, 235, 0.2)',
						        'rgba(255, 206, 86, 0.2)',
						        'rgba(75, 192, 192, 0.2)',
						        'rgba(153, 102, 255, 0.2)',
						        'rgba(255, 159, 64, 0.2)',
						        
						        'rgba(255, 99, 132, 0.2)',
						        'rgba(54, 162, 235, 0.2)',
						        'rgba(255, 206, 86, 0.2)',
						        'rgba(75, 192, 192, 0.2)',
						        'rgba(153, 102, 255, 0.2)',
						        'rgba(255, 159, 64, 0.2)'
						      ],
						      borderColor: [
						        'rgba(255,99,132,1)',
						        'rgba(54, 162, 235, 1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',
						        'rgba(153, 102, 255, 1)',
						        'rgba(255, 159, 64, 1)',
						        
						        'rgba(255,99,132,1)',
						        'rgba(54, 162, 235, 1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',
						        'rgba(153, 102, 255, 1)',
						        'rgba(255, 159, 64, 1)',
						        
						        'rgba(255,99,132,1)',
						        'rgba(54, 162, 235, 1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',
						        'rgba(153, 102, 255, 1)',
						        'rgba(255, 159, 64, 1)',
						        
						        'rgba(255,99,132,1)',
						        'rgba(54, 162, 235, 1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',
						        'rgba(153, 102, 255, 1)',
						        'rgba(255, 159, 64, 1)',
						        
						        'rgba(255,99,132,1)',
						        'rgba(54, 162, 235, 1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',
						        'rgba(153, 102, 255, 1)',
						        'rgba(255, 159, 64, 1)'
						      ],
						      borderWidth: 1,
						      fill: false
						    }]
						  };
			 
				
				if ($("#barChart_east_asia").length) {
				    var barChartCanvas1 = $("#barChart_east_asia").get(0).getContext("2d");
				    // This will get the first returned node in the jQuery collection.
				    var barChart1 = new Chart(barChartCanvas1, {
				      type: 'bar',
				      data: data_east_asia,
				      options: options
				    });
				  }
				if ($("#barChart_southeast_asia").length) {
				    var barChartCanvas2 = $("#barChart_southeast_asia").get(0).getContext("2d");
				    // This will get the first returned node in the jQuery collection.
				    var barChart2 = new Chart(barChartCanvas2, {
				      type: 'bar',
				      data: data_southeast_asia,
				      options: options
				    });
				  }
				  
				if ($("#barChart_southwest_asia").length) {
				    var barChartCanvas3 = $("#barChart_southwest_asia").get(0).getContext("2d");
				    // This will get the first returned node in the jQuery collection.
				    var barChart3 = new Chart(barChartCanvas3, {
				      type: 'bar',
				      data: data_southwest_asia,
				      options: options
				    });
				  }
				  
				if ($("#barChart_europe").length) {
				    var barChartCanvas4 = $("#barChart_europe").get(0).getContext("2d");
				    // This will get the first returned node in the jQuery collection.
				    var barChart4 = new Chart(barChartCanvas4, {
				      type: 'bar',
				      data: data_europe,
				      options: options
				    });
				  }
				  
				if ($("#barChart_america").length) {
				    var barChartCanvas5 = $("#barChart_america").get(0).getContext("2d");
				    // This will get the first returned node in the jQuery collection.
				    var barChart5 = new Chart(barChartCanvas5, {
				      type: 'bar',
				      data: data_america,
				      options: options
				    });
				  }
				  
				if ($("#barChart_oceania").length) {
				    var barChartCanvas6 = $("#barChart_oceania").get(0).getContext("2d");
				    // This will get the first returned node in the jQuery collection.
				    var barChart6 = new Chart(barChartCanvas6, {
				      type: 'bar',
				      data: data_oceania,
				      options: options
				    });
				  }
				  
				if ($("#barChart_africa").length) {
				    var barChartCanvas7 = $("#barChart_africa").get(0).getContext("2d");
				    // This will get the first returned node in the jQuery collection.
				    var barChart7 = new Chart(barChartCanvas7, {
				      type: 'bar',
				      data: data_africa,
				      options: options
				    });
				  }
				
		 });
	 }
 var doughnutPieOptions = {
		    responsive: true,
		    animation: {
		      animateScale: true,
		      animateRotate: true
		    }
		  };

 var options = {
		    scales: {
		      yAxes: [{
		        ticks: {
		          beginAtZero: true
		        },
		        gridLines: {
		          color: "rgba(204, 204, 204,0.1)"
		        }
		      }],
		      xAxes: [{
		        gridLines: {
		          color: "rgba(204, 204, 204,0.1)"
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
 
 
 
 var data_continent = {
		    datasets: [{
		      data: ["${select_continent_east_asia2}", "${select_continent_southeast_asia2}", "${select_continent_southwest_asia2}",
		    	  "${select_continent_europe2}", "${select_continent_america2}", "${select_continent_oceania2}",
		    	  "${select_continent_africa2}"],
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.5)',
		        'rgba(54, 162, 235, 0.5)',
		        'rgba(255, 206, 86, 0.5)',
		        'rgba(75, 192, 192, 0.5)',
		        'rgba(153, 102, 255, 0.5)',
		        'rgba(255, 159, 64, 0.5)',
		        'rgba(100, 125, 110, 0.5)',
		        
		        'rgba(255, 99, 132, 0.5)',
		        'rgba(54, 162, 235, 0.5)',
		        'rgba(255, 206, 86, 0.5)',
		        'rgba(75, 192, 192, 0.5)',
		        'rgba(153, 102, 255, 0.5)',
		        'rgba(255, 159, 64, 0.5)',
		        'rgba(100, 125, 110, 0.5)'
		      ],
		      borderColor: [
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)',
		        'rgba(100, 125, 110, 1)',
		        
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)',
		        'rgba(100, 125, 110, 1)'
		      ],
		    }],

		    // These labels appear in the legend and in the tooltips when hovering different arcs
		    labels: [
		      '동아시아', '동남아시아', '서남아시아',
		      '유럽', '아메리카', '오세아니아',
		      '아프리카'
		    ]
		  };
 

 
    if ($("#pieChart").length) {
    var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
    var pieChart = new Chart(pieChartCanvas, {
      type: 'pie',
      data: data_continent,
      options: doughnutPieOptions
    });
  }      
  
  
});  

 </script>               
                    
                    
 
 
 
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
  
    <%@ include file="../../templet/footer.jsp" %>
 
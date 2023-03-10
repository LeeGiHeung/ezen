<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>JSP</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<h3 class="text-center multiEffect mb-2">DashBoard(통계그래프)</h3>	


<div class="mb-3">
	<a id="bar" href="bar" class="btn btn-primary">막대그래프</a>&nbsp;&nbsp;
	<a id="pie" href="pie" class="btn btn-danger disabled">Pie그래프</a>&nbsp;&nbsp;
	<a id="line" href="dash" class="btn btn-success">Line그래프</a>
</div>
 
 <div class="d-flex mb-3 mx-auto pl-5" style="width:40%;">
 	<button class="btn btn-primary" disabled>외부원 : pc판매량</button>
 	<button class="btn btn-info" disabled>내부원 : 모니터판매량</button> 
 </div>
<div>
	<canvas id="canvas" style="min-height:350px;border:1px solid grey;width:100%;"></canvas>
</div>

<script>
$(document).ready(function(){
	var chartLabels = [];
	var chartData1 = [];
	var chartData2 = [];
	
	let pieChartData = {
		labels : chartLabels,	//그래프의 기본축인 x 또는 y축에 사용하는 값
		datasets : [
			{
				label : "월별 PC 판매량", //데이터 종류를 나타내는 범례
				fillColor : "rgba(220,220,220,0.2)", //채울색
				strokeColor : "rgba(220,220,220,1)", //선색
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : chartData1,
				order : 1,
				backgroundColor: [					
					"aliceblue",
	                "aqua",
	                "beige",
	                "blueviolet",
	                "orange",
	            	"cyan",
	            	"chocolate",
	            	"coral",
	            	"green",
	            	"red",
	            	"deeppink",
	            	"firebrick"
				]
			},
			{
				label : "월별 모니터 판매량",
				fillColor : "rgba(151,187,205,0.2)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
		        pointHighlightFill : "#fff",
		        pointHighlightStroke : "rgba(151,187,205,1)",
		        data : chartData2,
		        order : 2,
		        backgroundColor: [		        	
		        	"aliceblue",
	                "aqua",
	                "beige",
	                "blueviolet",
	                "orange",
	            	"cyan",
	            	"chocolate",
	            	"coral",
	            	"green",
	            	"red",
	            	"deeppink",
	            	"firebrick"
		        ]
			}
		]
	};
	
	function createChart() {
		let ctx = document.getElementById("canvas").getContext("2d");
		new Chart(ctx,{
			//type: 'pie',
			type : 'doughnut',
			data :  pieChartData,
			options : {
				responsive: true
			}
		});
	}
	
	$.ajax({
		type : 'POST',
		url : 'dashView',
		data : {
			cmd : 'chart',
			subcmd : 'line',
			${_csrf.parameterName}: "${_csrf.token}"
		},
		dataType : 'json', //받는 데이터형
		success : function(result) {
			$.each(result.datas, function(index, obj){
				chartLabels.push(obj.month); 
				chartData1.push(obj.pc);
				chartData2.push(obj.monitor);
			});
			createChart();
		},
		error : function() {
			$("#mbody").text("서버접속 실패!.");
			$("#modal").trigger("click");	
		}
	});
	
	$("#line").click(function(event){
		event.preventDefault();		
		$.ajax({
			url : $("#line").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#hjumbo").text("DashBoard페이지 입니다.");
				$("#mainRegion").html(data);
			},
			error : function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}
		});
	});
	
	$("#bar").click(function(event){
		event.preventDefault();		
		$.ajax({
			url : $("#bar").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#hjumbo").text("Bar그래프입니다.");
				$("#mainRegion").html(data);
			},
			error : function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}
		});
	});
	
	$("#pie").click(function(event){
		event.preventDefault();		
		$.ajax({
			url : $("#pie").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#hjumbo").text("Pie그래프입니다.");
				$("#mainRegion").html(data);
			},
			error : function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}
		});
	});
});
</script>
</body>
</html>
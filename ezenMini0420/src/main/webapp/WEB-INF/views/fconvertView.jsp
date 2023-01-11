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

<!-- file convert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.2.11/jspdf.plugin.autotable.min.js"></script>
<script src="js/tableHTMLExport.js"></script>
</head>
<body>

<!-- 테이블을 PDF,CSV(엑셀), JSON파일 형태로 변환 -->
<h3 class="text-center text-info multiEffect mt-2 mb-5">jQuery TableHTMLExport Plugin Examples</h3>

<table class="table table-bordered table-hover" id="example">
	<thead class="thead-dark">
		<tr>
			<th scope="col">#</th> <!-- scope는 시각장애인을 위한 읽는 방식 -->
			<th scope="col">First</th>
			<th scope="col">Last</th>
			<th scope="col">Handle</th>
		</tr>		
	</thead>
	<tbody>
		<tr>
			<th scope="row">1</th>
			<td>국현섭</td>
			<td>Otto</td>
			<td>@mdo</td>				
		</tr>
		<tr>
			<th scope="row">2</th>
   			<td>Jacob</td>
   			<td>Thornton</td>
   			<td>@fat</td>
		</tr>
		<tr>
			<th scope="row">3</th>
			<td>김영희</td>
			<td>Otto</td>
			<td>@mdo</td>				
		</tr>
		<tr>
			<th scope="row">4</th>
   			<td>Smith</td>
   			<td>Thornton</td>
   			<td>@fat</td>
		</tr>
		<tr>
			<th scope="row">5</th>
			<td>국현섭</td>
			<td>Otto</td>
			<td>@mdo</td>				
		</tr>
		<tr>
			<th scope="row">6</th>
   			<td>Jacob</td>
   			<td>Thornton</td>
   			<td>@fat</td>
		</tr>
		<tr>
			<th scope="row">7</th>
			<td>김영희</td>
			<td>Otto</td>
			<td>@mdo</td>				
		</tr>
		<tr>
			<th scope="row">8</th>
   			<td>Smith</td>
   			<td>Thornton</td>
   			<td>@fat</td>
		</tr>
	</tbody>
</table>

<p class="lead mt-5"> <!-- lead는 BS4의 class로 p의  글자크기와 라인 간격을 증가시킴-->
	<button id="json" class="btn btn-primary">TO JSON</button>
	<button id="csv" class="btn btn-info">TO CSV</button>
	<button id="pdf" class="btn btn-danger">TO PDF</button>
	<button id="print" class="btn btn-success" onclick=" window.print()">전체화면 인쇄</button>
</p>

<script>
$(document).ready(function(){
	$("#json").on("click",function(){
		$("#example").tableHTMLExport({
			type:'json',
			filename:'sample.json'
		});
	});
	
	$("#csv").on("click",function(){
		$("#example").tableHTMLExport({
			type:'csv',
			filename:'sample.csv'
		});
	});
	
	/* 한글지원이 안됨
	$("#pdf").on("click",function(){
		$("#example").tableHTMLExport({
			type:'pdf',
			filename:'sample.pdf'
		});
	});
	*/
	
	$("#pdf").on("click",function(){
		html2canvas(document.getElementById("example"),{
			onrendered : function(canvas) {
				var imgData = canvas.toDataURL('images/png');
				console.log('Report imageurl : ' + imgData);
				var doc = new jsPDF('p','mm',[297,210]);
				doc.addImage(imgData,'PNG',5,5,55,20);
				doc.save('sample.pdf');
			}
		});
	});
});
</script>
</body>
</html>
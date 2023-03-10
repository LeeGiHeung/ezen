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

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />		
</sec:authorize>

<h3 class="text-center threeDEffect">λκΈ μμ±</h3>
<form action="reply" method="post" id="replyForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="bGroup" value="${replyView.bGroup}" />
	<input type="hidden" name="bStep" value="${replyView.bStep}" />
	<input type="hidden" name="bIndent" value="${replyView.bIndent}">
	<div class="form-group">
		<label for="uId">κ²μν λ²νΈ</label>
		<input type="text" class="form-control" id="uId" name="bId"	value="${replyView.bId}" readonly />
	</div>
	<div class="form-group">
		<label for="hit">ννΈμ</label>
		<input type="text" id="hit" class="form-control" name="bHit" value="${replyView.bHit}" readonly />
	</div>
	<div class="form-group">
		<label for="uname">μμ±μ</label>
		<input type="text" class="form-control" id="uname" name="bName" value="${user_id}" readonly />
	</div>
	<!-- μ λͺ©κ³Ό λ΄μ©μ μλ κ²μ λ³΄μ¬ μ£Όκ³  μμ  -->
	<div class="form-group">
		<label for="title">μ λͺ©</label>
		<input type="text" class="form-control" id="title" name="bTitle" placeholder="${replyView.bTitle}" required />	
	</div>
	<div class="form-group">
		<label for="content">λ΄μ©:</label>
		<textarea rows="10" id="content" name="bContent" class="form-control"  required>
		${replyView.bContent}
		</textarea>
	</div>
	<button type="submit" class="btn btn-success">λκΈμμ±</button>&nbsp;&nbsp;
	<a href="eBoard" id="replyBoard" class="btn btn-primary">λͺ©λ‘λ³΄κΈ°</a>
</form>

<script>
$(document).ready(function(){
	$("#replyForm").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#replyForm").attr("action"),
			type : $("#replyForm").attr("method"),
			data : $("#replyForm").serialize(),
			success : function(data) {
				$("#hjumbo").text("Mainλ΄λΆμ κ²μνμλλ€.");
				$("#mainRegion").html(data);
			},
			error : function() {
				$("#mbody").text("μλ²μ μ μ€ν¨!.");
				$("#modal").trigger("click");	
			}
		});
	});
	
	$("#replyBoard").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#replyBoard").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#hjumbo").text("Mainλ΄λΆμ κ²μνμλλ€.");
				$("#mainRegion").html(data);
			},
			error : function() {
				$("#mbody").text("μλ²μ μ μ€ν¨!.");
				$("#modal").trigger("click");	
			}
		});
	});	
});
</script>
</body>
</html>
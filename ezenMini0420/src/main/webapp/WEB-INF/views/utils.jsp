<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>              
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<title>Util</title>
<style>
/* Optional: Makes the sample page fill the window. */
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
}
#main {  
  height: auto;    
}

h3,h4 {
  color: white;
  text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
}
</style>
</head>
<body>
<!-- ckeditor의 CDN은 메인화면으로 주어야 uncaught에러가 발생 안함 -->
<!-- 모든 CDN은 메인화면(주화면)에 작성 -->

<!-- 로그인 id반환 var값 user_id를 EL 로 사용 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />		
</sec:authorize>

<div class="container mt-5 mb-5"> <!-- 내부 메뉴 -->
	<a href="fCalendar" class="btn btn-danger">Full Calendar</a>&nbsp;&nbsp; <!-- 캘린더 -->
	<a id="sse" href="sse" class="btn btn-primary">서버이벤트</a>&nbsp;&nbsp;
	<a id="fconvert" href="fconvert" class="btn btn-info">파일변환</a>&nbsp;&nbsp;
	<a id="pdfPlay" href="pdfPlay" class="btn btn-success">PDF PLAY</a>&nbsp;&nbsp;
	<a id="cedit" href="util" class="btn btn-success">CKEditor</a>&nbsp;&nbsp;
	<a id="cedList" href="cedList" class="btn btn-success">CKEditor목록</a>&nbsp;&nbsp;
</div>

<h3 class="text-center multiEffect mb-4">CkEditor로 게시판 처리</h3>
<!-- 
<form id="editForm" action="ckedit1?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" >
 -->
<form id="editForm" action="ckedit1" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="edUser" value="<c:out value='${user_id}'/>" />
	<div class="form-group">
		<label for="title">제목</label>
		<input type="text" class="form-control" id="title" name="edTitle" />
	</div>
	<div class="form-group d-none"> <!-- 보이지 않게 함 -->
		<label for="content">내용</label>
		<textarea class="form-control ck-content" id="editor" name="editor">		
		</textarea>
	</div>	
	<input id="editSub" type="submit" value="ckedit" style="visibility:hidden;">	
</form>	
<!-- toolbar container는 메뉴 툴바 콘테이너 -->
<!-- editor container 내용을 처리하는 콘테이너(우리가 작업하는 ckeditor공간,나중에 id="editor"인 textarea로 html형태로 복사)-->
<div id="toolbar-container" style="max-width:100%"></div>	  
<div id="ckeditor" class="ck-content" style="max-width:100%;min-height:400px;border:1px solid grey;line-height:0.8rem"></div>	
<br/><br/>
<button onclick="myFunction()" class="btn btn-primary">전송</button>&nbsp;&nbsp;	

<!--  
<h3 class="text-center multiEffect mb-2 mt-3">서버 저장 데이터 보기</h3>
<div id="ckeditor1" class="ck-content mt-4" style="max-width:100%;height:500px;border:1px solid grey;line-height:0.8rem"></div>	
<br/>
--> 

<script type="module">	
 DecoupledEditor
    .create( document.querySelector('#ckeditor'),{    	    	
    	language: 'ko',	       	    	
    	ckfinder: {  //이미지처리 모듈
	   		uploadUrl: 'ckedit' //요청경로,자체 이미지 사용시는 서버 의존 없이 자체 처리	   		
	   	},
	   	toolbar: ['ckfinder', '|','imageUpload', '|', 'heading', '|', 'bold', 'italic','link', 'bulletedList',
	   		'numberedList', 'blockQuote', '|', 'undo','redo','Outdent','Indent','fontsize',
	   		'fontfamily','insertTable','alignment', '|', 'fontColor', 'fontBackgroundColor']			
    })       
    .then(function(editorD) {
    	//window.editorResize = editor;
    	const toolbarContainer = document.querySelector( '#toolbar-container' );
        toolbarContainer.appendChild( editorD.ui.view.toolbar.element );        
    });
</script>
<script>
function myFunction() {
	//ckeditor창에 작성된 내용을 html형태로 textarea에 옮겨서 서버로 보내준다 --이미지는 이름과 경로를 보냄
	$("#ckeditor svg").remove(); //ckeditor창의 반환시 검정삼각형 제거
	let content = $("#ckeditor").html(); //편집창의 내용 가져옴		
	$("#editor").html(content); //textarea의 내용부에 작성	
	//$("#cview").html(content); //보여줄 부문에 작성
	setTimeout(function(){  //3초동안 서버로 갈 html을 보여줌
		$("#editSub").trigger("click");
	},2000);
	$("#editForm").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : "ckedit1", //form의 action
			type : "post",
			data : $("#editForm").serialize(),
		    success : function(data) {
		    	$("#hjumbo").text("입력 내용 저장 성공");				
		    	$("#mainRegion").html(data);	
		    	//$("#ckeditor1").html(content);
		    },
		    error: function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}			
		});
	});	
}

$(document).ready(function(){	
	$("#sse").click(function(event){
		event.preventDefault();
		$.ajax({
			url :"sse",
			type : "get",
			success : function(data) {
				$("#hjumbo").text("SSE처리창입니다.");
				$("#mainRegion").html(data);
			},
			error: function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}
		});
	});
	
	$("#fconvert").click(function(event){	
		event.preventDefault();		
		$.ajax({
			url :"fconvert",
			type : "get",			
			success : function(data) { //여기서 data는 서버로 부터 응답받은 값
				$("#hjumbo").text("파일 변환 입니다.");
				$("#mainRegion").html(data);							
			},
			error : function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}
		});		
	 });
	
	$("#pdfPlay").click(function(event){	
		event.preventDefault();		
		$.ajax({
			url :"pdfPlay",
			type : "get",			
			success : function(data) { //여기서 data는 서버로 부터 응답받은 값
				$("#hjumbo").text("PDF파일 PLAY입니다.");
				$("#mainRegion").html(data);							
			},
			error : function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}
		});		
	 });
	
	$("#cedit").click(function(event){	
		event.preventDefault();		
		$.ajax({
			url :"util",
			type : "get",			
			success : function(data) { //여기서 data는 서버로 부터 응답받은 값
				$("#hjumbo").text("에디터창입니다.");
				$("#mainRegion").html(data);							
			},
			error : function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}
		});		
	 });
	
	$("#cedList").click(function(event){	
		event.preventDefault();		
		$.ajax({
			url :"cedList",
			type : "get",			
			success : function(data) { //여기서 data는 서버로 부터 응답받은 값
				$("#hjumbo").text("에디터창입니다.");
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
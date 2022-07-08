<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajat 파일 업로드</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div>
		<h2>Ajat 파일 업로드</h2>
		<input type="file" name="uploadFile" id="uploadFile" multiple />
		<br>
		<hr>
		<br>
		<input type="button" name="uploadBtn" id="uploadBtn" value ="파일 업로드"> <br><br>
		<div id="msg"></div>	
	</div>
	<script>
		$(document).ready(function(){
			$("#uploadBtn").on("click",function(){
				var formData = new FormData();
				var inputFile = $("#uploadFile");
				var files = inputFile[0].files;
				
				for(var i=0;i<files.length;i++){
					formData.append("uploadFile",files[i]);
				}

			$.ajax({
				url:'uploadAjax.do',
				processData : false,		// 데이터 객체를 문자열로 바꿀지
				contentType : false,		// 해당 타입을 true로 하면 일반 text로 구분
				data : formData,
				type : 'POST',
				sucess : function(result) {
					$("#msg").html(result);
				}
				
				});
			});
		});
	</script>
</body>
</html>
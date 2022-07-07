<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aject 파일업로드</title>
</head>
<body>
	
	<script>
		$(document).ready(function(){
			$("#uploadBtn").on("click",function(){
				var formData = new FormData();
			})var files = inputFile[0].files;
			
			for(var i=0;i<files.length;i++){
				formDate.append("uploadFile",files[i]);
			}
			$.ajax({
				url:'uploadAjax.do',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				sucess : function(result) {
					$("#msg").html(result;)
				}
			});
		});
	</script>
</body>
</html>
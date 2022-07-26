<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단일 파일 업로드 실습</title>
</head>
<body>
	<div>
 		<form action ="fileUpload.do" method = "post" enctype="multipart/form-data">
 			<label for="file">파일 업로드</label>
 			<input type="file" name="myfile" id="file"/>
 			<br>
 			<hr>
 			<br>
 			<input type="submit" name="submitBtn" value ="파일 업로드">
 		</form>
 	</div>
</body>
</html>
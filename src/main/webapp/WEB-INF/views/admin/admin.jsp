<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 

<html>
<head>
	<title>관리자 메인</title>
	<%@include file="../inc/head.jsp" %>
</head>
<body>
	<c:import url="admin_header.jsp" />
	<div class="img" style="width:100%">
		<img src="../img/sl.png" style="width:100%"/>
	</div>
	<div id="content">
		<h1>
			관리자페이지  
		</h1>

	</div>
	<%@include file="../inc/footer.jsp" %>

</body>
</html>

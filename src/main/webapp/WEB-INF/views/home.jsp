<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 

<html>
<head>
	<title>메인</title>
	<%@include file="inc/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@include file="inc/header.jsp" %>
	<div id="content">
		<h1>
			Hello world!  
		</h1>
		<P>  The time on the server is ${serverTime}. </P>
	</div>
	<%@include file="inc/footer.jsp" %>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
<c:import url="../inc/head.jsp" />
<style>
	h2 {padding: 30px;}
	form {width: 400px; margin: 0 auto;}
	.message{padding:10px; }
</style>
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		 <form action="${path1 }/member/login.do" method="post">
		 	<h2>로그인</h2>
		 	<div class="mb-3">
			    <label for="uid" class="form-label">아이디</label>
			    <input type="text" name="uid" id="uid"  required placeholder="아이디" class="form-control">
			</div>
			<div class="mb-3">
			    <label for="upw" class="form-label">비밀번호</label>
			    <input type="password" name="upw" id="upw" required placeholder="비밀번호" class="form-control">
			    <c:if test="${!empty msg }">
				<input type="hidden" name="msg" value="${msg }" />
				</c:if>
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
			<div class="message">
				<c:if test="${!empty msg }">
				<p>${msg }</p>
				</c:if>
			</div>
 		</form>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>	
</body>
</html>
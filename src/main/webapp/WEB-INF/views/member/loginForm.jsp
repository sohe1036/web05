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
</head>
<body>
<div id="content">
	<c:import url="../inc/header.jsp" />
	<div class="content">
		 <form action="${path1 }/member/login.do" method="post">
             <div class="login_form">
                 <input type="text" name="uid" id="uid"  required placeholder="아이디">
                 <input type="password" name="upw" id="upw" required placeholder="비밀번호">							
             </div>
             <div class="button_box">
                 <button type="submit">로그인</button>
             </div>
 		</form>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>	
</body>
</html>
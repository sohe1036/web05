<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
<div class="wrap">
<%@include file="../inc/header.jsp" %>
<div id="content">
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberList }" var="mlist">
			<tr>
				<td>${mlist.uid }</td>
				<td><a href="${path1 }/member/detail.do?uid=${mlist.uid }">${mlist.uname }</a></td>
				<td>${mlist.regdate }</td>
			</tr>	
			</c:forEach>
		</tbody>
	</table>
</div>
<%@include file="../inc/footer.jsp" %>
</div>	
</body>
</html>
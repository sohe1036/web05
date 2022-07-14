<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기 </title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<table class="table">
			<tr>
				<th>글번호</th>
				<td>${board.seq }</td>
			</tr>
			<tr>
				<th>글 제목</th>
				<td>${board.btitle }</td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td>${board.bcontent }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board.uname }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${board.regdate }</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="${path1 }/board/list.do" class="btn btn-primary">목록</a>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
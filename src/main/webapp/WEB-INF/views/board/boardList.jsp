<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<%@include file="../inc/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@include file="../inc/header.jsp" %>
	<div id="content">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList }" var="list">
				<tr>
					<td>${list.seq }</td>
					<td><a href="${path1 }/board/read.do?seq=${list.seq }">${list.btitle }</a></td>
					<td>${list.uname }</td>
					<td>${list.regdate }</td>
					<td>${list.ck }</td>
				</tr>	
				</c:forEach>
				<tr>
					<td>
						<a href="${path1 }/board/write_from.do">글 추가</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%@include file="../inc/footer.jsp" %>
</div>	
</body>
</html>
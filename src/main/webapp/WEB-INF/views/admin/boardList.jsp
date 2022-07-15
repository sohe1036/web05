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
<link rel="stylesheet" href="../inc/datatables.min.css" />
<script src="../inc/datatables.min.js"></script>
</head>
<body>
<div class="wrap">
	<%@include file="admin_header.jsp" %>
	<div id="content">
		<h2 class="tit">게시판 목록</h2>
		<br>
		<div>
			<a href="${path1 }/admin/write_from.do" class="btn btn-primary">글 추가</a>
		</div>
		<br>
		<table class="table" id="boardTable">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList }" var="list">
				<tr>
					<td scope="row">${list.seq }</td>
					<td scope="row"><a href="${path1 }/admin/boardRead.do?seq=${list.seq }">${list.btitle }</a></td>
					<td scope="row">${list.uname }</td>
					<td scope="row">${list.regdate }</td>
					<td scope="row">${list.ck }</td>
				</tr>	
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$(function(){
			$("#boardTable").DataTable();
		});
	</script>
	<%@include file="../inc/footer.jsp" %>
</div>	
</body>
</html>
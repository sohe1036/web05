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
<%@include file="../inc/head.jsp" %>
<link rel="stylesheet" href="../inc/datatables.min.css" />
<script src="../inc/datatables.min.js"></script>
</head>
<body>
<div class="wrap">
<%@include file="admin_header.jsp" %>
	<div id="content">
		<table class="table" id="memberTable">
			<thead>
				<tr>
					<th scope="col">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${memberList }" var="mlist">
				<tr>
					<td scope="row">${mlist.uid }</td>
					<td scope="row"><a href="${path1 }/admin/memberDetail.do?uid=${mlist.uid }">${mlist.uname }</a></td>
					<td scope="row">${mlist.regdate }</td>
				</tr>	
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$(function(){
			$("#memberTable").DataTable();
		});
	</script>
<%@include file="../inc/footer.jsp" %>
</div>	
</body>
</html>
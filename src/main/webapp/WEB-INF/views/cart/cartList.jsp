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
	<%@include file="../inc/header.jsp" %>
	<div id="content">
		<h2 class="tit">장바구니 목록</h2>
		<br>
		<table class="table" id="cartTable">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">상품명</th>
					<th scope="col">사진</th>
					<th scope="col">수량</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartList }" var="list" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td scope="row"><a href="${path1 }/cart/read.do?seq=${list.bno }&&">${list.gname }</a></td>
					<td scope="row"><img src="${path1 }/resources/upload/${list.gimg1 }" style="width: 100px; height: 150px;"/></td>
					<td scope="row">${list.pieces }</td>
				</tr>	
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
			$(function(){
				$("#cartTable").DataTable();
			});
			</script>
	<%@include file="../inc/footer.jsp" %>
</div>	
</body>
</html>
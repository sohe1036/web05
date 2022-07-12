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
					<th scope="col">가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartList }" var="list" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td scope="row">
					${list.gname }
					<a href="${path1 }/cart/cartDetail.do?bno=${list.bno }&uid=${list.uid}" class="btn btn-primary">수량변경</a>
					<a href="${path1 }/cart/delete.do?bno=${list.bno }&uid=${list.uid}" class="btn btn-primary">삭제</a>
					</td>
					<td scope="row">
						<a href="${path1 }/goods/detail.do?gno=${list.gno}">
							<img src="${path1 }/resources/upload/${list.gimg1 }" style="width: 100px; height: 150px;"/>
						</a>	
					</td>
					<td scope="row">${list.amount }</td>
					<td scope="row"><fmt:formatNumber value="${list.price *list.amount}" type="number" /></td>
					<td><a href="${path1 }/sales/salesForm.do?gname=${list.gname}&gno=${list.gno}&gimg1=${list.gimg1}&pieces=${list.amount}&price=${list.price}" class="btn btn-primary">주문하기</a></td>
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
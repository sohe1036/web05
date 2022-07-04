<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<%@include file="../inc/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@include file="../inc/header.jsp" %>
	<div id="content">
		<table>
			<thead>
				<tr>
					<th>상품번호</th>
					<th>이름</th>
					<th>컬러</th>
					<th>사진</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${goodsList }" var="glist">
				<tr>
					<td>${glist.gno }</td>
					<td><a href="${path1 }/goods/detail.do?gno=${glist.gno }">${glist.gname }</a></td>
					<td>${glist.gcolor }</td>
					<td><img src="../img/${glist.gimg1 }" /></td>
					<td>${glist.price }</td>
				</tr>	
				</c:forEach>
				<tr>
					<td>
						<a href="${path1 }/goods/goodsAddForm">상품 추가</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%@include file="../inc/footer.jsp" %>
</div>	
</body>
</html>
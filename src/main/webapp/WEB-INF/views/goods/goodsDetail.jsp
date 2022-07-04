<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<table>
			<tr>
				<th>상품번호</th>
				<td>${goods.gno }</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>${goods.gname }</td>
			</tr>
			<tr>
				<th>모양</th>
				<td>${goods.gshape }</td>
			</tr>
			<tr>
				<th>컬러</th>
				<td>${goods.gcolor }</td>
			</tr>
			<tr>
				<th>사진</th>
				<td><img src="../img/${goods.gimg1 }"></td>
			</tr>
			<tr>
				<th>상세정보</th>
				<td>${goods.ginfo }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${goods.price }</td>
			</tr>
			<c:if test="${sid=='admin' }">
			<tr>
				<th>수량</th>
				<td>${goods.pieces }</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="2">
				<a href="${path1 }/goods/list.do">목록</a>
				<c:if test="${sid=='admin' }">
				<a href="${path1 }/goods/edit.do?gno=${goods.gno }">수정하기</a>
				<a href="${path1 }/goods/delete.do">삭제하기</a>
				</c:if>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
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
		<table class="table">
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
				<td><img src="${path1 }/resources/upload/${goods.gimg1 } " style="width: 200px; height: 250px;"/></td>
			</tr>
			<tr>
				<th>상세정보</th>
				<td>${goods.ginfo }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><fmt:formatNumber value="${goods.price }" type="number" /></td>
			</tr>
			<c:if test="${sid=='admin' }">
			<tr>
				<th>수량</th>
				<td>${goods.pieces }</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="2">
				<a href="${path1 }/goods/list.do" class="btn btn-primary">목록</a>
				<c:if test="${sid=='admin' }">
				<a href="${path1 }/goods/edit.do?gno=${goods.gno }" class="btn btn-primary">수정하기</a>
				<a href="${path1 }/goods/delete.do" class="btn btn-primary">삭제하기</a>
				</c:if>
				<a href="${path1 }/cart/insert.do?uid=${sid }&gno=${goods.gno}&gname=${goods.gname}&gcolor=${goods.gcolor}&gimg1=${goods.gimg1}" class="btn btn-primary">장바구니</a>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
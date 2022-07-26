<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
<c:import url="../inc/header.jsp" />
	<div id="content">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">주문번호</th>
					<th scope="col">결제금액</th>
					<th scope="col">상품명</th>
					<th scope="col">구매날짜</th>
					<c:if test="${sid=='admin' }">
					<th scope="col">구매아이디</th>
					</c:if>
					<th scope="col">배송상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${salesList }" var="list">
				<tr>
					<td scope="row"><a href="${path1 }/sales/detail.do?ono=${list.ono}">${list.ono }</a></td>
					<td scope="row">${list.money }</td>
					<td scope="row"><a href="${path1 }/goods/detail.do?gno=${list.gno}">${list.gname }</a></td>
					<td scope="row">${list.sdate }</td>
					<c:if test="${sid=='admin' }">
					<td scope="row">${list.uid }</td>
					</c:if>
					<td scope="row">
						<c:if test="${!empty list.transco }">
						<span>${list.rstate }</span>
						</c:if>
						<c:if test="${empty list.transco }">
						<span>상품준비중</span>
						</c:if>
					</td>
					<td scope="row">
						<c:if test="${list.rstate =='배송완료'&& list.review==0}">
							<a href="${path1 }/review/reviewForm.do?gno=${list.gno}&uid=${list.uid }&gname=${list.gname }&ono=${list.ono}" class="btn btn-primary">리뷰작성</a>
						</c:if>
						<c:if test="${list.rstate =='배송완료'&& list.review==1}">
							<span>리뷰작성 완료</span>
						</c:if>
					</td>
				</tr>	
				</c:forEach>
			</tbody>
			<tbody>
		</table>
	</div>
<c:import url="../inc/footer.jsp" />	
</div>	
</body>
</html>
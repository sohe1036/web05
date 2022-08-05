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
<link rel="stylesheet" href="../inc/datatables.min.css" />
<script src="../inc/datatables.min.js"></script>
</head>
<body>
<div class="wrap">
<c:import url="admin_header.jsp" />
	<div id="content">
		<h2>관리자용 주문내역</h2>
		<table class="table" id="salesTable">
			<thead>
				<tr style="text-align: center;">
					<th scope="col">주문번호</th>
					<th scope="col">결제금액</th>
					<th scope="col">상품</th>
					<th scope="col">구매날짜</th>
					<c:if test="${sid=='admin' }">
					<th scope="col">구매아이디</th>
					</c:if>
					<th scope="col">배송상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${salesList }" var="list">
				<tr style="text-align: center;">
					<td scope="row">
						<p>${list.ono }</p>
						<a href="${path1 }/admin/salesDetail.do?ono=${list.ono}" class="btn btn-outline-dark">주문확인</a>
					</td>
					<td scope="row"><fmt:formatNumber> ${list.money }</fmt:formatNumber>원</td>
					<%-- <td scope="row"><a href="${path1 }/goods/detail.do?gno=${list.gno}">${list.gname }</a></td> --%>
					<td scope="row">
						<a href="${path1 }/goods/detail.do?gno=${list.gno}">
							<img src="${path1 }/resources/upload/${list.gimg1 }" style="width: 150px; height:200px;">
						</a>	
					</td>
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
				</tr>	
				</c:forEach>
			</tbody>
		</table>
		<script>
		$(function(){
			$("#salesTable").DataTable({
				"ordering": false,
				"pageLength": 5
			});
			
		});
	</script>
	</div>
<c:import url="../inc/footer.jsp" />	
</div>	
</body>
</html>
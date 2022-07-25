<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보  상세보기</title>
<c:import url="../inc/head.jsp" />
<style>
	.th {display: intrne-block; width:300px;}
</style>
</head>
<body>
<div class="wrap">
	<c:import url="admin_header.jsp" />
	<div id="content">
		<table class="table">
			<tbody>
			<c:if test="${sid == 'admin' }">
				<tr>
					<th>아이디</th>
					<td>${sales.uid }</td>
				</tr>
			</c:if>
				<tr>
					<th>주문번호</th>
					<td>${sales.ono }</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>${sales.gname }</td>
				</tr>
				<tr>
					<th>결제금액</th>
					<td><fmt:formatNumber value="${sales.money }" type="number"/></td>
					
				</tr>
				<tr>
					<th>수량</th>
					<td>${sales.pieces }</td>
				</tr>
				<tr>
					<th>수취인명</th>
					<td>${sales.rname }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${sales.tel }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
					${sales.postcode }
					${sales.addr1 }
					${sales.addr2 }
					</td>
				</tr>
				<tr>
					<th>결제정보</th>
					<c:if test="${sales.paytype =='credit' }">
					<td><span>신용카드</span></td>
					</c:if>
					<c:if test="${sales.paytype =='check' }">
					<td><span>체크카드</span></td>
					</c:if>
					<c:if test="${sales.paytype =='account' }">
					<td><span>무통장입금</span></td>
					</c:if>
				</tr>
				<tr>
					<th>배송메모</th>
					<td>${sales.memo }</td>
				</tr>
				<tr>
					<th>운송장번호</th>
					<td>
						<c:if test="${!empty sales.transco }">
						<span>${sales.transco }</span>
						<span>${sales.transno }</span>
						</c:if>
						<c:if test="${empty sales.transco }">
						<span>등록된 운송장번호가 없습니다.</span>
						</c:if>
						<c:if test="${sid=='admin' }">
						<a href="${path1 }/admin/rstate.do?ono=${sales.ono}" class="btn btn-primary">운송장 입력</a>
					</c:if>
					</td>					
				</tr>
				<tr>
					<th>배송상태</th>
					<td>
					<c:if test="${!empty sales.transco }">
					<span>${sales.rstate }</span>
					</c:if>
					<c:if test="${empty sales.transco }">
					<span>상품준비중입니다.</span>
					</c:if>
					</td>
				</tr>
				<tr>
					<th>도착예정일</th>
					<td>
						<c:if test="${!empty sales.rdate }">
						<span>${sales.rdate }</span>
						</c:if>
						<c:if test="${empty sales.rdate }">
						<span></span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:if test="${empty sales.transco }">
							<a href="${path1 }/sales/edit.do?ono=${sales.ono}" class="btn btn-primary">배송정보수정</a>
							<a href="${path1 }/sales/delete.do?ono=${sales.ono}&gno=${sales.gno }&pieces=${sales.pieces }&uid=${sid}" class="btn btn-primary">주문취소</a>
						</c:if>
						<c:if test="${!empty sales.transco }">
							<span>배송이 시작되어 취소 및 수정이 불가능합니다.</span>
						</c:if>
							<a href="${path1 }/admin/salesList.do" class="btn btn-primary">목록</a>
					</td>
				</tr>
			</tbody>	
		</table>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
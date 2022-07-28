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
	.wrap{width: 100%; clear: both; display: block;}
	.salesTable ,.transTable {width: 1200px; clear: both; height: auto; margin: 0 auto; }
	.inner {width: 800px; margin: 0 auto;}
	.salesTable ul, .transTable ul {overflow: hidden;}
</style>
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content" style="width: 100%; clear: both; display: block; height: 800px;">
		<div class="salesTable">
			<div class="inner">
				<ul>
					<li>
						<span class="salesDate" style="float: left;">${sales.sdate } 주문</span>
						<span class="salesNum" style="float: right; margin-right: 100px;">주문번호 : ${sales.ono }</span>
					</li>
				</ul>
				<ul>
					<c:if test="${sales.paytype =='credit' }">
					<li><span>신용카드</span></li>
					</c:if>
					<c:if test="${sales.paytype =='check' }">
					<li><span>체크카드</span></li>
					</c:if>
					<c:if test="${sales.paytype =='account' }">
					<li><span>무통장입금</span></li>
					</c:if>
				</ul>
				<ul>
					<li>수량 : <span>${sales.pieces }개</span> </li>
				</ul>
				<ul>
					<li>결제금액 : <span><fmt:formatNumber value="${sales.money }" type="number"/>원</span></li>
				</ul>
				<ul>
					<li>
						<img src="${path1 }/resources/upload/${sales.gimg1 }" style="width: 300px; display:inline-block; padding-right: 100px;" >
						<span>${sales.gname }</span>
					</li>
				</ul>
			</div>
		</div>
		<div class="transTable">
			<div class="inner">
				<ul>
					<li><span>${sales.rname }</span></li>
				</ul>
				<ul>
					<li>
						<span>
							${sales.postcode }
							${sales.addr1 }
							${sales.addr2 }
						</span>
					</li>
				</ul>
				<ul>
					<li>배송메모 : <span>${sales.memo }</span></li>
				</ul>
				<hr>
				<ul>
					<li>배송정보 : 
						<c:if test="${!empty sales.transco }">
						<span>${sales.transco }</span>
						<span>${sales.transno }</span>
						</c:if>
						<c:if test="${empty sales.transco }">
						<span>등록된 운송장번호가 없습니다.</span>
						</c:if>
					</li>
				</ul>
				<ul>
					<li>도착 예정일: 
						<c:if test="${!empty sales.rdate }">
						<span>${sales.rdate }</span>
						</c:if>
						<c:if test="${empty sales.rdate }">
						<span></span>
						</c:if>
					</li>
				</ul>
				<ul>
					<li>
						<c:if test="${empty sales.transco }">
							<a href="${path1 }/sales/edit.do?ono=${sales.ono}" class="btn btn-primary">배송정보수정</a>
							<a href="${path1 }/sales/delete.do?ono=${sales.ono}&gno=${sales.gno }&pieces=${sales.pieces }&uid=${sid}" class="btn btn-primary">주문취소</a>
						</c:if>
						<c:if test="${!empty sales.transco }">
							<p>배송이 시작되어 취소 및 수정이 불가능합니다.</p>
						</c:if>
							<a href="${path1 }/sales/idList.do?uid=${sid}" class="btn btn-primary">목록</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
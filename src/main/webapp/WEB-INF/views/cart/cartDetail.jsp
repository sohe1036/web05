<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 상세보기</title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<form action="${path1 }/cart/update.do" method="post">
			<table class="table">
				<tr>
					<th>장바구니번호</th>
					<td>
					${cart.bno }
					<input type="hidden" name="bno" value="${cart.bno }"/>
					<input type="hidden" name="uid" value="${cart.uid }"/>
					<input type="hidden" name="pieces" value="${cart.pieces }"/>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>
					${cart.gname }
					<input type="hidden" name="gname" value="${cart.gname }"/>
					</td>
				</tr>
				<tr>
					<th>컬러</th>
					<td>
					${cart.gcolor }
					<input type="hidden" name="gcolor" value="${cart.gcolor }"/>
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td><img src="${path1 }/resources/upload/${cart.gimg1 }" style="width: 100px; height: 150px;"/></td>
				</tr>
				<tr>
					<th>수량</th>
					<td>
						<input type="number" name="amount" id="amount" value="${cart.amount }" min="1", max="${cart.pieces }" required />
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td><fmt:formatNumber value="${cart.price }" type="number" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수량 변경" class="btn btn-primary"/>
						<a href="${path1 }/cart/delete.do?bno=${cart.bno }&uid=${cart.uid}" class="btn btn-primary">삭제</a>
					</td>
				</tr>			
			</table>
		</form>	
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
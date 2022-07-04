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
		<form method="post" action="${path1 }/goods/update.do">
			<table>
				<tr>
					<th>상품번호</th>
					<td><input type="text" name="gno" value="${goods.gno }"/></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="gname" value="${goods.gname }"/></td>
				</tr>
				<tr>
					<th>모양</th>
					<td><input type="text" name="gshape" value="${goods.gshape }"/></td>
				</tr>
				<tr>
					<th>컬러</th>
					<td><input type="text" name="gcolor" value="${goods.gcolor }"/></td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
					<input type="file" name="gimg1" >
					<img src="../img/${goods.gimg1 }" >
					</td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td><textarea name="ginfo" cols="80" rows="5">${goods.ginfo }</textarea></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price" value="${goods.price }"/></td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" name="pieces" value="${goods.pieces }"/></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>	
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
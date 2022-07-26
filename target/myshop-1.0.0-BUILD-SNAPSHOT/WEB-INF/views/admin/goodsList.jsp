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
<style>
	.listBox {width :100%; height: 1200px;}
	.goodslist {float: left; }
	.goodslist li {text-align: center; padding-bottom: 10px;}
</style>
</head>
<body>
<div class="wrap">
	<%@include file="admin_header.jsp" %>
	<div id="content">
		<div class="listBox">
			<c:forEach items="${goodsList }" var="glist">
			<ul class="goodslist">
				<li>
					<a href="${path1 }/admin/goodsDetail.do?gno=${glist.gno }">
						<img src="${path1 }/resources/upload/${glist.gimg1 }" class="img-thumbnail" style="width: 205px; height: 250px;"/>
					</a>
				</li>
				<li>${glist.gname }</li>	
				<li>${glist.gcolor }</li>
				<li><fmt:formatNumber value="${glist.price }" type="number" />원</li>					
			</ul>
			</c:forEach>
		</div>
	</div>
	<%@include file="../inc/footer.jsp" %>
</div>	
</body>
</html>
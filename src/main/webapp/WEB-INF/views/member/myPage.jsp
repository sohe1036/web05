<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div id="wrap">
	<c:import url="../inc/header.jsp" />
		<div id="content" class="content">
			<h2>마이페이지</h2>
			<div>
				<ul>
					<li><a href="${path1 }/member/detail.do?uid=${sid }">내 정보</a></li>
					<li><a href="${path1 }/review/idList.do?uid=${sid }">작성한 리뷰</a></li>
					<li><a href="${path1 }/sales/idList.do?uid=${sid }">주문내역</a></li>
				</ul>
			</div>
		</div>
	<c:import url="../inc/footer.jsp" />		
</div>			
</body>
</html>
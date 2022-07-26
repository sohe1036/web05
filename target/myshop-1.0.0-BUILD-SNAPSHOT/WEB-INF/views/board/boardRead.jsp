<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기 </title>
<c:import url="../inc/head.jsp" />
<style>
	.boardBox li {margin-bottom: 40px;}
	.inner {width: 900px; margin: 0 auto;}
</style>
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<div class="boardBox">
			<div class="inner">
				<ul>
					<li style="font-size: 35px; font-weight: bold; text-align: center;">${board.btitle }</li>
					<li style="text-align: right;">
						<span>${board.regdate }</span>
						<span>/</span>
						<span> ${board.uname }</span>
					</li>
					<li><span>${board.bcontent }</span></li>
				</ul>
				<div class="button">
					<a href="${path1 }/board/list.do" class="btn btn-primary">목록</a>
				</div>
			</div>	
		</div>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
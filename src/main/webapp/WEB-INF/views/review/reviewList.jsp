<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품별 리뷰목록</title>
<%@include file="../inc/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@include file="../inc/header.jsp" %>
	<div id="content">
		<div class="thead">
			<ul>	
				<li>
					<span style="display:inline-block; width:15%;">별점</span>
					<span style="display:inline-block; width:50%;">제목</span>
					<span style="display:inline-block; width:15%;">작성자</span>
					<span style="display:inline-block; width:15%;">작성일</span>
				</li>
			</ul>
		</div>
		<hr>
		<div class="tbody">
		<c:forEach items="${reviewList }" var="list" varStatus="status">
			<ul>
				<li>
					<span style="display:inline-block; width:15%;">
						<c:forEach var="item" begin="0" end="${list.best -1}">
							<img src="${path1 }/img/star.png" />
						</c:forEach>	
					</span>
					<span style="display:inline-block; width:50%;">${list.subject }</span>
					<span style="display:inline-block; width:15%;">${list.uid }</span>
					<span style="display:inline-block; width:15%;">${list.regdate }</span>
				</li>	
			</ul>
		</c:forEach>
		</div>
	</div>
	<%@include file="../inc/footer.jsp" %>
</div>
</body>
</html>
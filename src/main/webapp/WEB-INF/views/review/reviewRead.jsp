<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
<%@include file="../inc/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@include file="../inc/header.jsp" %>
	<div id="content">
		<table class="table">
			<tbody>
				<tr>
					<th>리뷰 제목</th>
					<td>${review.subject }</td>
				</tr>
				<tr>
					<th>별점</th>
					<td>
						<c:forEach var="item" begin="0" end="${review.best -1}">
							<img src="${path1 }/img/star.png" />
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>리뷰 내용</th>
					<td>${review.content }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${review.regdate }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${review.uid }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${review.visited }</td>
				</tr>
				<c:if test="${review.uid == sid }">
				<tr>
					<td colspan="2">
						<a href="${path1 }/review/editForm.do?uno=${review.uno}" class="btn btn-primary">수정</a>
						<a href="${path1 }/review/delete.do?uno=${review.uno}" class="btn btn-primary">삭제</a>
					</td>
				</tr>
				</c:if>
			</tbody>
		</table>
		
	</div>
	<%@include file="../inc/footer.jsp" %>	
</div>	
</body>
</html>
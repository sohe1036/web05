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
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<table class="table">
			<tr>
				<th>글번호</th>
				<td>${notice.seq }</td>
			</tr>
			<tr>
				<th>글 제목</th>
				<td>${notice.title }</td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td>${notice.content }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${notice.nickname }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${notice.regdate }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${notice.visited }</td>
			</tr>
			<tr>
				<td colspan="2">
				<a href="${path1 }/notice/pageList.do?curPage=1" class="btn btn-primary">목록</a>
				<a href="${path1 }/notice/edit.do?seq=${notice.seq }" class="btn btn-primary">수정하기</a>
				<a href="${path1 }/notice/noticeDelete.do?seq=${notice.seq }" class="btn btn-primary">삭제하기</a>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
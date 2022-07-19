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
				<th>아이디</th>
				<td>
				<span>${member.uid }</span>
				<input type="hidden" name="uid" value="${member.uid }" />
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
				<span>${member.uname }</span>
				<input type="hidden" name="uname" value="${member.uname }">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td> 
				<span>${member.tel }</span>
				<input type="hidden" name="tel" value="${member.tel }">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
				<span>${member.email }</span>
				<input type="hidden" name="email" value="${member.email }">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
				<span>${member.birth }</span>
				<input type="hidden" name="birth" value=" ${member.birth }">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<a href="${path1 }/member/edit.do?uid=${sid }" class="btn btn-primary">수정하기</a>
				<a href="${path1 }/member/delete.do?uid=${sid }" class="btn btn-primary">회원탈퇴</a>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
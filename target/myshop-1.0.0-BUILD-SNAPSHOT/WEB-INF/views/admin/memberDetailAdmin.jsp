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
	<c:import url="admin_header.jsp" />
	<div id="content">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="uid" value="${member.uid }" /> </td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="upw" value="${member.upw }"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="uname" value="${member.uname }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td> <input type="tel" name="tel" value="${member.tel }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" value="${member.email }"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="birth" value=" ${member.birth }"></td>
			</tr>
			<%-- <tr>
				<td colspan="2">
				<a href="${path1 }/member/update.do" class="btn btn-primary">수정하기</a>
				<a href="${path1 }/member/delete.do?uid=${sid }" class="btn btn-primary">회원탈퇴</a>
				</td>
			</tr> --%>
		</table>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
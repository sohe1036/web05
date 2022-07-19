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
		<form action="${path1 }/member/update.do" method="post" name="memberEditForm" onsubmit="return memberEdit()">
			<table class="table">
				<tr>
					<th>아이디</th>
					<td>
					<span>${member.uid }</span>
					<input type="hidden" name="uid" value="${member.uid }" />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="upw" id="upw" value="${member.upw }" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="upw2" id="upw2" value="${member.upw }" required></td>
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
				<tr>
					<td colspan="2">
						<input type="submit" value="수정하기" class="btn btn-primary">
					</td>
				</tr>
			</table>
		</form>	
		<script>
			function memberEdit(){
				var upw = document.getElementById("upw").value;
				var upw2 = document.getElementById("upw2").value;
				if(upw!=upw2){
					alert("비밀번호가 일치하지 않습니다");
					return false;
				}
			}
		</script>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
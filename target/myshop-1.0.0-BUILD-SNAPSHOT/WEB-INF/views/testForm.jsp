<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 폼 연습</title>
</head>
<body>
<h2>스프링 폼 연습</h2>
<form:form modelAttribute="formDTO" action="save" method="post">
	<table>
		<tr>
			<th><form:label path="name">이름</form:label></th>
			<td><form:input path="name" /></td>
		</tr>
		<tr>
			<th><form:label path="id">아이디</form:label></th>
			<td><form:input path="id" /></td>
		</tr>
		<tr>
			<th><form:label path="pwd">비밀번호</form:label></th>
			<td><form:input path="pwd" /></td>
		</tr>
		<tr>
			<th><form:label path="email">이메일</form:label></th>
			<td><form:input path="email" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="전송" />			
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 성공</title>
</head>
<body>
<h2>등록 성공</h2>
<div>
	<h3>회원 정보</h3>
	<p>이름 : ${user.name }</p>
	<p>아이디 : ${user.id }</p>
	<p>이메일 : ${user.email }</p>
	<p>주소 : ${user.address.address1 } ${user.address.address2 }</p>
</div>
</body>
</html>
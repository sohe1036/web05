<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 목록 -실습</title>
</head>
<body>
	<div>
		<h2>자료 목록</h2>
		<ul class="ist">
			<c:forEach items="${databankList }" var="databank" varStatus="status">
				<li>
					
					<h5>${status.count }</h5>
					<h3>${databank.title }</h3>
					<div>
						<img src="${path1 }/upload/${databank.fileurl }" alt="${databank.title }"/>
					</div>
					<p>${databank.author }</p>
					
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>
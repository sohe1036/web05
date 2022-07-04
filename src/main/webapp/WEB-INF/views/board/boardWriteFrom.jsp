<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 추가</title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<form method="post" action="${path1 }/board/insert.do">
			<table>
				<tr>
					<th>글 제목</th>
					<td>
					<input type="text" name="btitle" id="btitle" required />
					</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td>
					<textarea cols="90" rows="8" name="bcontent" id="bcontent" required></textarea>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
					<input type="text" name="uname" id="uname" value="관리자" readonly />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="추가" />
						<input type="reset" value="취소" />
					</td>	
				</tr>
			</table>
		</form>	
	
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
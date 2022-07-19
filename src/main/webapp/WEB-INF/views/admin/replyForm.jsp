<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 작성 폼</title>
<%@include file="../inc/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@include file="admin_header.jsp" %>
	<div id="content">
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><span>${review.uid }</span></td>
				</tr>
				<tr>
					<th>작성내용</th>
					<td><span>${review.content }</span></td>
				</tr>
			</tbody>
		</table>
		<form action="${path1 }/admin/replyAdd.do" method="post">
			<table>
				<tbody>
					<tr>
						<th>답변</th>
						<td>
							<textarea name="reply" id="reply" cols="50" rows="5"></textarea>
							<input type="hidden" name="uno" value="${review.uno }"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록" class="btn btn-primary">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<%@include file="../inc/footer.jsp" %>	
</div>	
</body>
</html>
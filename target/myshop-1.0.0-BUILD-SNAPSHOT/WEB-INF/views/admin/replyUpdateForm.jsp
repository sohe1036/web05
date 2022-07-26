<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 수정 폼</title>
<%@include file="../inc/head.jsp" %>
</head>
<body>
	<div id="content">
		<form action="${path1 }/admin/replyUpdate.do" method="post" name="replyUpdateForm" onsubmit="replyUpdate()">
			<table>
				<tbody>
					<tr>
						<th>답변</th>
						<td>
							<textarea name="recontent" id="recontent" cols="50" rows="5">${replyread.recontent }</textarea>
							<input type="hidden" name="uno" value="${replyread.uno }"/>
							<input type="hidden" name="rno" value="${replyread.rno }"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정" class="btn btn-primary">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<script>
			function replyUpdate(){
				window.open.name ="parentPage";
				document.replyUpdateForm.target ="parentPage";
				self.close();
			}
		</script>
	</div>
</body>
</html>
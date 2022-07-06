<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 추가</title>
<c:import url="../inc/head.jsp" />
<script src="../ckeditor/ckeditor.js"></script>
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<form method="post" action="${path1 }/notice/addSmartNotice.do">
			<table class="table">
				<tr>
					<th><label for="title">제목</label></th>
					<td>
					<input type="text" name="title" id="title" required />
					</td>
				</tr>
				<tr>
					<th><label for="content">글 내용</label></th>
					<td>
					<textarea id="ckeditor" cols="90" rows="8" name="content" id="content" required></textarea>
					</td>
				</tr>
				<tr>
					<th><label for="nickname">작성자</label></th>
					<td>
					<input type="text" name="nickname" id="nickname" value="admin" readonly />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="추가" class="btn btn-primary" />
						<input type="reset" value="취소" class="btn btn-primary" />
					</td>	
				</tr>
			</table>
		</form>	
		<script>
			$(function(){
				CKEDITOR.replace('ckeditor', {width:"100%", height:"400px", filebrowserUploadUrl:"fileupload.do"});
			});
		</script>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
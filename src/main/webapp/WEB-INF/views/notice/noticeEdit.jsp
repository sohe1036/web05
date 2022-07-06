<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기 </title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<script src="../ckeditor/ckeditor.js"></script>
	<div id="content">
		<form action="${path1 }/notice/noticeUpdate.do" method="post">
			<table class="table">
				<tr>
					<th>글번호</th>
					<td>
					${notice.seq }
					<input type="hidden" name="seq" id="seq" value="${notice.seq }" />
					</td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td><input type="text" name="title" id="title" value="${notice.title }" /></td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td><textarea id="ckeditor" name="content" >${notice.content }</textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
					${notice.nickname }
					<input type="hidden" name="nickname" id="nickname" value="${notice.nickname }"/>
					</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
					${notice.regdate }
					<input type="hidden" name="regdate" id="regdate" value="${notice.regdate }"/>
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>
					${notice.visited }
					<input type="hidden" name="visited" id="visited" value="${notice.visited }"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="btn btn-primary">
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
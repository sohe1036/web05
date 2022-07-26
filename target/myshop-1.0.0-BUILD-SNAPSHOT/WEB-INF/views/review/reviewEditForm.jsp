<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정폼</title>
<%@include file="../inc/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@include file="../inc/header.jsp" %>
	<div id="content">
		<form action="${path1 }/review/update.do" method="post">
			<table class="table">
				<tbody>
					<tr>
						<th>리뷰 제목</th>
						<td>
						<input type="text" value="${review.subject }" name="subject"/>
						<input type="hidden" name="uno" id="uno" value="${review.uno }">
						<input type="hidden" name="gno" id="gno" value="${review.gno }">
						<input type="hidden" name="uid" id="uid" value="${review.uid }">
						<input type="hidden" name="ono" id="ono" value="${review.ono }">
						<input type="hidden" name="regdate" id="regdate" value="${review.regdate }">
						<input type="hidden" name="visited" id="visited" value="${review.visited }">
						</td>
					</tr>
					<tr>
						<th>별점</th>
						<td>
							<select name="best" id="best">
								<option value="">별점을 선택하세요.</option>
								<option value="1" <c:if test="${review.best == '1' }">selected</c:if>>1</option>
								<option value="2" <c:if test="${review.best == '2' }">selected</c:if>>2</option>
								<option value="3" <c:if test="${review.best == '3' }">selected</c:if>>3</option>
								<option value="4" <c:if test="${review.best == '4' }">selected</c:if>>4</option>
								<option value="5" <c:if test="${review.best == '5' }">selected</c:if>>5</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>리뷰 내용</th>
						<td><textarea cols="50" rows="5" name="content">${review.content }</textarea></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${review.regdate }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${review.uid }</td>
					</tr>
					<c:if test="${review.uid == sid }">
					<tr>
						<td colspan="2">
							<input type="submit" value="수정하기" class="btn btn-primary">
						</td>
					</tr>
					</c:if>
				</tbody>
			</table>
		</form>
	</div>
	<%@include file="../inc/footer.jsp" %>	
</div>	
</body>
</html>
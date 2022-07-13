<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<form action="${path1 }/review/insert.do" method="post">
			<table class="table">
				<tbody>
					<c:if test="${sales.uid == sid }">
					<h3><input type="text" name="gname" value="${sales.gname }" readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></h3>
					<p>이 상품에 대해 리뷰를 남겨주세요.</p>
						<tr>
							<th>리뷰 제목</th>
							<td>
							<input type="text" name="subject" id="subject" >
							<input type="hidden" name="gno" id="gno" value="${sales.gno }">
							<input type="hidden" name="uid" id="uid" value="${sales.uid }">
							<input type="hidden" name="ono" id="ono" value="${sales.ono }">
							</td>
						</tr>
						<tr>
							<th>별점</th>
							<td>
								<select name="best" id="best">
									<option value="">별점을 선택하세요.</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>리뷰내용</th>
							<td>
							<textarea cols="50" rows="5" name="content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="확인" class="btn btn-primary">
								<input type="reset" value="취소" class="btn btn-primary">
							</td>
						</tr>
					</c:if>	
				</tbody>
			</table>
		</form>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>	
</body>
</html>
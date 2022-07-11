<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운송장 정보 입력 폼</title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<h3>운송장 수정</h3>
		<form action="${path1 }/sales/addShipping.do" method="post">
			<table class="table">
				<tbody>
					<tr>
						<th>택배사</th>
						<td>
							<c:if test="${!empty sales.transco }">
							<input type="text" name="transco" value="${sales.transco }"required/>
							</c:if>
							<c:if test="${empty sales.transco }">
							<input type="text" name="transco" required/>
							</c:if>
							<input type="hidden" name="ono" value="${sales.ono }"required/>
						</td>
					</tr>
					<tr>
						<th>송장번호</th>
						<td>
							<c:if test="${!empty sales.transno }">
							<input type="text" name="transno" value="${sales.transno }"required/>
							</c:if>
							<c:if test="${empty sales.transno }">
							<input type="text" name="transno" required/>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>배송상태</th>
						<td>
							<select name="rstate">
								<option value="배송시작">배송시작</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>도착예정일</th>
						<td>
							<c:if test="${!empty sales.rdate }">
							<input type="date" name="rdate" value="${sales.rdate }" required/>
							</c:if>
							<c:if test="${empty sales.rdate }">
							<input type="date" name="rdate" required/>
							</c:if>
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
	</div>
<c:import url="../inc/footer.jsp" />	
</div>	
</body>
</html>
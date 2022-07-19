<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 추가폼</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link href="../inc/styles.css" rel="stylesheet" />
</head>
<body>
	<form method="post" name="cartForm" > 
		<table class="table">
			<tbody>
				<tr>
					<th>상품명</th>
					<td>
						${gname }
						<input type="hidden" name="gno" value="${gno }">
						<input type="hidden" name="gname" value="${gname }">
						<input type="hidden" name="gcolor" value="${gcolor }">
						<input type="hidden" name="gimg1" value="${gimg1 }">
						<input type="hidden" name="pieces" value="${pieces }">
						<input type="hidden" name="price" value="${price }">
						<c:if test="${!empty msg }">
						<input type="hidden" name="msg" id="msg" value="${msg }">
						</c:if>
					</td>				
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="number" name="amount" id="pieces" value="" min="1" max="${pieces }" required/></td>
				</tr>	
				<tr>
					<th>가격</th>
					<td><fmt:formatNumber value="${price }" type="number" /></td>
				</tr>
				<tr>
					<td colspan=2>
						<input type="button" value="장바구니" id="btn" onclick="addSubmit()"/>
					</td>
				</tr>			
			</tbody>
		</table>
	</form>
	
<script>
	function addSubmit(){
		if(document.getElementById("pieces").value == "" ||document.getElementById("pieces").value==null){
			alert("수량을 입력해주세요.");
			return false;
		}
		if(document.getElementById("pieces").value > ${pieces }){
			alert("재고가 부족합니다. 남은 수량은 "+${pieces }+"입니다." );
			return false;
			} else {	
				window.opener.name = "parentPage";
				document.cartForm.target = "parentPage";
				document.cartForm.action = "${path1 }/cart/insert.do?uid=${sid}";
				document.cartForm.submit();
				self.close();
			}
	} 
</script>
</body>
</html>
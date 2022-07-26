<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송정보 수정 폼</title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
	<h3>배송지 수정</h3>
		<form action="${path1 }/sales/update.do" method="post">
			<table class="table">
				<tbody>
					<tr>
						<th>수취인명</th>
						<td>
						<input type="text" name="rname" value="${sales.rname }" required/>
						<input type="hidden" name="ono" value="${sales.ono }"required/>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
						<input type="text" name="tel" value="${sales.tel }"/>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" name="postcode" id="postcode" value="${sales.postcode }"required/>
							<input type="text" name="addr1" id="addr1" value="${sales.addr1 }"required/>
							<input type="text" name="addr2" id="addr2" value="${sales.addr2 }"required/>
							<input type="button" value="주소변경" onclick="findAddr()" class="btn btn-primary">
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
	function findAddr(){
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;			//도로명
				var jibunAddr = data.jibunAddress;		//지번
				document.getElementById("postcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("addr1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("addr1").value = jibunAddr;
				}
			}
		}).open();
	}
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
	</div>
<c:import url="../inc/footer.jsp" />	
</div>
</body>
</html>
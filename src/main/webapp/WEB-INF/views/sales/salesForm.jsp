<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 폼</title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
<c:import url="../inc/header.jsp" />
	<div id="content">
		<form method="post" action="${path1 }/sales/insert.do" name="" onsubmit="return salesForm(this)">
			<table class="table">
				<tr>
					<th><label for="gname">상품명</label></th>
					<td>
					${goods.gname }
					<input type="hidden" name="gname" id="gname" value="${goods.gname }"/>
					<input type="hidden" name="gno" id="gno" value="${goods.gno }" />
					<input type="hidden" name="money" id="money" value="${goods.price * goods.pieces}" />
					<input type="hidden" name="pieces" id="pieces" value="${goods.pieces }" />
					<input type="hidden" name="uid" id="uid" value="${sid }" />
					</td>
				</tr>
				<tr>
					<th><label for="gimg1">사진</label></th>
					<td>
					<img src="${path1 }/resources/upload/${goods.gimg1 } " style="width: 100px; height: 150px;"/>
					</td>
				</tr>
				<tr>
					<th><label for="pieces">수량</label></th>
					<td>
					${goods.pieces }
					</td>
				</tr>
				<tr>
					<th><label for="pieces">금액</label></th>
					<td>
					${goods.price * goods.pieces }원
					</td>
				</tr>
				<tr>
					<th><label for="rname">수취인명</label></th>
					<td>
					<input type="text" name="rname" id="rname" required />
					</td>
				</tr>
				<tr>
					<th><label for="tel">전화번호</label></th>
					<td>
					<input type="text" name="tel" id="tel" required />
					</td>
				</tr>		
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="postcode" id="postcode">
						<input type="text" name="addr1" id="addr1" required>
						<input type="text" name="addr2" id="addr2" placeholder="상세주소 입력" required>
						<input type="button" value="주소찾기" onclick="findAddr()" class="btn btn-primary">
					</td>
				</tr>
				<tr>
					<th><label for="memo">메모</label></th>
					<td>
					<input type="text" name="memo" id="memo" />
					</td>
				</tr>
				<tr>
					<th><label for ="paytype">결제방식</label></th>
					<td>
						<select name="paytype" id="paytype" required>
							<option value="credit">신용카드</option>
							<option value="check">체크카드</option>
							<option value="account">무통장입금</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><label for="payno">카드번호/계좌번호</label></th>
					<td><input type="text" name="payno" id="payno" ></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="주문" class="btn btn-primary"/>
						<input type="reset" value="취소" class="btn btn-primary"/>
					</td>	
				</tr>
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
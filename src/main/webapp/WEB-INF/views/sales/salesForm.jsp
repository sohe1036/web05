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
<style>
	.salesBox {width: 100%; height: 1000px;}
	.inner {width: 900px; margin: 0 auto; height: 100%;}
	.salesBox li {padding-bottom: 20px;}
</style>
</head>
<body>
<div class="wrap">
<c:import url="../inc/header.jsp" />
	<div id="content">
		<form method="post" action="${path1 }/sales/insert.do" name="" onsubmit="return salesForm(this)">
			<div class="salesBox">
				<div class="inner">
					<ul style="float: left;">
						<li>
							<img src="${path1 }/resources/upload/${goods.gimg1 } " style="width: 300px; height: 350px;"/>
						</li>
					</ul>
					<ul style="float: right; padding-right: 50px;">	
						<li>
						<span style="font-size: 25px;">${goods.gname }</span>
						<input type="hidden" name="gname" id="gname" value="${goods.gname }"/>
						<input type="hidden" name="gno" id="gno" value="${goods.gno }" />
						<input type="hidden" name="money" id="money" value="${goods.price * goods.pieces}" />
						<input type="hidden" name="pieces" id="pieces" value="${goods.pieces }" />
						<input type="hidden" name="uid" id="uid" value="${sid }" />
						</li>
						<li>
							<span>수량 : </span>
							${goods.pieces }
						</li>
						<li>
							<span>총 금액 : </span>
							${goods.price * goods.pieces }원
						</li>
						<li>
							<span>수취인명 </span>
							<input type="text" name="rname" id="rname" required />
						</li>
						<li>
							<span>전화번호</span>
							<input type="text" name="tel" id="tel" required />
						</li>
						<li>
							<span>주소</span>
							<input type="button" value="주소찾기" onclick="findAddr()" class="btn btn-primary">
							<p><input type="text" name="postcode" id="postcode"></p>
							<p><input type="text" name="addr1" id="addr1" required></p>
							<p><input type="text" name="addr2" id="addr2" placeholder="상세주소 입력" required><p>
							
						</li>
						<li>
							<span>메모</span>
							<input type="text" name="memo" id="memo" />
						</li>
						<li>
							<select name="paytype" id="paytype" required>
								<option value="">결제방식을 선택하세요.</option>
								<option value="credit">신용카드</option>
								<option value="check">체크카드</option>
								<option value="account">무통장입금</option>
							</select>
						</li>
						<li>
							<span>계좌/카드 번호</span>
							<input type="text" name="payno" id="payno" required>
						</li>
						<li>
							<input type="submit" value="주문" class="btn btn-primary"/>
							<input type="reset" value="취소" class="btn btn-primary"/>
						</li>
					</ul>
				</div>
			</div>
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
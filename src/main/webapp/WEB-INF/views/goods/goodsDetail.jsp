<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<c:import url="../inc/head.jsp" />
<style>
	.goodsBox{height: 500px; padding-top: 10px;}
	.goods_img{float: left;}
	.goods_content{float: right; width:400px;}
</style>
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<div class="goodsBox">
			<h2 style="padding-bottom: 30px">${goods.gname }</h2>
			<div class="goods_img">
				<img src="${path1 }/resources/upload/${goods.gimg1 } " style="width: 350px; height: 400px;" class="rounded" alt="">
				<c:if test="${!empty goods.gimg2 }">
				<img src="${path1 }/resources/upload/${goods.gimg2 } " style="width: 350px; height: 400px;" class="rounded" alt=""/>
				</c:if>
			</div>
			<div class="goods_content">
				<form action="${path1 }/sales/salesForm.do" method="post">
					<ul>
						<li>
							<p style="font-weight: bold; font-size: 23px; padding-bottom: 10px;">${goods.gname }</p>
							<input type="hidden" name="gno" value="${goods.gno }">
							<input type="hidden" name="gname" value="${goods.gname }">
							<input type="hidden" name="gimg1" value="${goods.gimg1 }">
							<input type="hidden" name="price" value="${goods.price }">
						</li>
						<li><p>${goods.gshape } / ${goods.gcolor }</p></li>
						<li><p><fmt:formatNumber value="${goods.price }" type="number" />원</p></li>
						<li><p style="font-size: 16px">${goods.ginfo }</p></li>
						<li>
							<p>
								<c:if test="${goods.pieces!=0 }">
								<input type="number" name="pieces" style="width: 50px" value="1" min="1" max="${goods.pieces }"/>
								</c:if>
								<c:if test="${goods.pieces==0 }">
								품절된 상품입니다.
								</c:if>
							</p>
						</li>
						<li>
							<a href="${path1 }/goods/list.do" class="btn btn-primary">목록</a>
							<c:if test="${empty sid }">
							<button type="button" onclick="loginCart()" class="btn btn-primary">장바구니 추가 </button>
							</c:if>
							<c:if test="${!empty sid }">
							<a href="${path1 }/review/list.do?gno=${goods.gno }" class="btn btn-primary">리뷰</a>
							<c:if test="${goods.pieces!=0 }">
							<button type="button" onclick="addCart()" class="btn btn-primary">장바구니 추가 </button>
							<input type="submit" value="주문하기" class="btn btn-primary">
							</c:if>
							<c:if test="${goods.pieces==0 }">
								<p style="color:red;">품절</p>
							</c:if>
					</c:if>
						</li>
					</ul>
				</form>
			</div>
		</div>
		<script>
			function addCart() {
				window.open("${path1}/cart/addCartForm.do?gno=${goods.gno}&gname=${goods.gname}&gcolor=${goods.gcolor}&gimg1=${goods.gimg1}&pieces=${goods.pieces }&price=${goods.price}", "dataupload", "width=500, height=400");
			}
			function loginCart() {
				alert("로그인이 필요합니다.");
				location.href = "${path1}/member/loginForm.do";
				
			}
		</script>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
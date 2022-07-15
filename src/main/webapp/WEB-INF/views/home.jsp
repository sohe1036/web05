<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 

<html>
<head>
	<meta charset="UTF-8">
	<title>메인</title>
	<%@include file="inc/head.jsp" %>
<style>
	.listBox {width :100%; height: 500px;}
	.listBox ul {padding-left: 2rem; padding-botton :1rem;}
	.goodsBestList {float: left; }
	.goodsBestList li {text-align: center; padding-bottom: 10px;}
	.latestGoodsList {float: left; }
	.latestGoodsList li {text-align: center; padding-bottom: 10px;}

</style>
	
</head>
<body>
<div class="wrap">
	<%@include file="inc/header.jsp" %>
	<div class="img" style="width:100%">
			<img src="./img/sl.png" style="width:100%"/>
	</div>
	<div id="content">
		<!-- 
		<h1>
			Hello world!  
		</h1>
		<P>  The time on the server is ${serverTime}. </P>
		-->
		<div class="listBox">
			<h2 style="padding-bottom: 20px;">신상품</h2>
			<c:forEach items="${latestGoods }" var="list">
			<ul class="latestGoodsList">
				<li>
					<a href="${path1 }/goods/detail.do?gno=${list.gno }">
						<img src="${path1 }/resources/upload/${list.gimg1 }" class="img-thumbnail" style="width: 205px; height: 250px;"/>
					</a>
				</li>
				<li>${list.gname }</li>	
				<li>${list.gcolor }</li>
				<li><fmt:formatNumber value="${list.price }" type="number" />원</li>			
			</ul>
			</c:forEach>
		</div>
		
		<div class="listBox">
			<h2 style="padding-bottom: 20px;">Best상품</h2>
			<c:forEach items="${goodsBestList }" var="glist">
			<ul class="goodsBestList">
				<li>
					<a href="${path1 }/goods/detail.do?gno=${glist.gno }">
						<img src="${path1 }/resources/upload/${glist.gimg1 }" class="img-thumbnail" style="width: 205px; height: 250px;"/>
					</a>
				</li>
				<li>${glist.gname }</li>	
				<li>${glist.gcolor }</li>
				<li><fmt:formatNumber value="${glist.price }" type="number" />원</li>			
			</ul>
			</c:forEach>
		</div>
	</div>
	<%@include file="inc/footer.jsp" %>
</div>
</body>
</html>

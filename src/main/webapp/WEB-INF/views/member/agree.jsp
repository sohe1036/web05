<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관동의</title>
<c:import url="../inc/head.jsp" />
<style>
	form {width: 900px; margin: 0 auto;}
</style>
</head>
<body>
<div id="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content" class="content">
		<form action="${path1 }/member/join.do" class="agree_form" method="post" onsubmit="return send(this)">
            <h3>이용약관</h3>
            <textarea cols="120" rows="10" class="textcheck" readonly>
				약관1
			</textarea>    
            <input type="checkbox" name="ck1" id="ck1">
            <label for="ck1">위의 이용약관에 동의합니다.</label>
            <br><br>
            <h3>개인정보처리방침</h3>
            <textarea cols="120" rows="10" class="textcheck" readonly>
            	약관2
            </textarea>    
            <input type="checkbox" name="ck2" id="ck2">
            <label for="ck2">위의 개인 정보 수집  처리에 동의합니다.</label>
            <div class="btn_warp">
            <input type="submit" value="회원가입" class="btn btn-primary">
            </div>	
         </form>
         <script>
	         function send(f){
	       		 if(f.ck1.checked==true && f.ck2.checked==true){		//ck1과 ck2모두 체크도어있어야
	       			 return true;
	       		 }else{
	       			 alert ("약관에 모두 동의하지 않으셨습니다.")
	       			 return false;
	       		 }
	       	 }
         </script>   
	</div>
<c:import url="../inc/footer.jsp" />	
</div>	
</body>
</html>
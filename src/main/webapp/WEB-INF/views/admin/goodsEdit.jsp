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
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<form method="post" action="${path1 }/admin/goodsUpdate.do" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th><label for="gno">상품번호</label></th>
					<td><input type="text" name="gno" value="${goods.gno }" readonly></td>
				</tr>
				<tr>
					<th><label for="gname">상품명</label></th>
					<td><input type="text" name="gname" value="${goods.gname }"/></td>
				</tr>
				<tr>
					<th><label for="gtype">상품타입</label></th>
					<td>
					<select name="gtype" id="gtype">
						<option value="">타입을 선택하세요.</option>
						<option value="선글라스" <c:if test="${goods.gtype == '선글라스' }">selected</c:if>>선글라스</option>
						<option value="안경" <c:if test="${goods.gtype == '안경' }">selected</c:if>>안경</option>
						<option value="콜라보레이션" <c:if test="${goods.gtype == '콜라보레이션' }">selected</c:if>>콜라보레이션</option>
					</select>
					</td>
				</tr>
				<tr>
					<th><label for="gshape">프레임모양</label></th>
					<td><input type="text" name="gshape" value="${goods.gshape }"/></td>
				</tr>
				<tr>
					<th><label for="gcolor">컬러</label></th>
					<td><input type="text" name="gcolor" value="${goods.gcolor }"/></td>
				</tr>
				<!-- 
				<tr>
					<th><label for="dposter">파일 형식</label></th>
					<td>
						<input type="text" name="dposter" id="dposter" size="40"  value="" readonly>
						<input type="image" name="dposter2" id="proData2" /> 
						<input type="hidden" name="fileCheck" id="fileCheck" />
					</td>
				</tr>
				 -->
				<tr>
					<th><label for="gimg1">메인 사진</label></th>
					<td>
					<input type="file" name="gimg1" id="gimg1" >
					<input type="hidden" name="gimg1" value="${goods.gimg1 }" required/>
					</td>
				<tr>
				<tr>
					<th><label for="gimg2">서브 사진</label></th>
					<td>
					<input type="file" name="gimg2" id="gimg2" >
					<input type="hidden" name="gimg2" value="${goods.gimg2 }"/>
					</td>
				<tr>
					<th><label for="ginfo">상세정보</label></th>
					<td><textarea name="ginfo" cols="80" rows="5">${goods.ginfo }</textarea></td>
				</tr>
				<tr>
					<th><label for="price">가격</label></th>
					<td><input type="text" name="price" value="${goods.price }"/></td>
				</tr>
				<tr>
					<th><label for="pieces">수량</label></th>
					<td><input type="text" name="pieces" value="${goods.pieces }"/></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="수정하기" class="btn btn-primary">
					</td>
				</tr>
			</table>
		</form>	
		<script>
	
		/*
		function fileCk(f){
    		if(f.fileCheck.value!="yes") {
    			alert("파일을 업로드해주세요.");
    			return false;
    		}
		}
		*/
	</script>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
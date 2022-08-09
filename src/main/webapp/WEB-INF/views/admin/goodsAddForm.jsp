<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가 폼</title>
<c:import url="../inc/head.jsp" />
</head>
<body>
<div class="wrap">
	<c:import url="admin_header.jsp" />
	<div id="content">
		<form method="post" action="${path1 }/admin/insert.do" enctype="multipart/form-data">
			<h2 style="padding-bottom:20px;">상품추가</h2>
			<table class="table">
				<tr>
					<th><label for="gname">상품명</label></th>
					<td>
					<input type="text" name="gname" id="gname" required />
					</td>
				</tr>
				<tr>
					<th><label for="gtype">서브메뉴</label></th>
					<td>
					<select name="gtype" id="gtype">
						<option value="">타입을 선택하세요.</option>
						<option value="선글라스">선글라스</option>
						<option value="안경">안경</option>
						<option value="콜라보레이션">콜라보레이션</option>
					</select>
					</td>
				</tr>
				<tr>
					<th><label for="gshape">프레임모양</label></th>
					<td>
					<input type="text" name="gshape" id="gshape" required/>
					</td>
				</tr>
				<tr>
					<th><label for="gcolor">컬러</label></th>
					<td>
					<input type="text" name="gcolor" id="gcolor" required/>
					</td>
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
					<input type="file" name="gimg1" id="gimg1"  />
					</td>
				</tr>
				<tr>
					<th><label for="gimg2">서브 사진</label></th>
					<td>
					<input type="file" name="gimg2" id="gimg2" />
					</td>
				</tr>
				<tr>
					<th><label for="ginfo">상세정보</label></th>
					<td>
					<textarea rows="8" cols="80" name="ginfo" id="ginfo" required></textarea>
					</td>
				</tr>
				<tr>
					<th><label for="price">가격</label></th>
					<td>
					<input type="number" name="price" id="price" required />
					</td>
				</tr>
				<tr>
					<th><label for="pieces">수량</label></th>
					<td>
					<input type="number" name="pieces" id="pieces" required/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="추가" class="btn btn-primary"/>
						<input type="reset" value="취소" class="btn btn-primary"/>
					</td>	
				</tr>
			</table>
		</form>	
<!-- 	<script>
		function uploadFile() {
			window.open("${path1 }/goods/uploadForm.do", "dataupload", "width=500, height=400");
		}
		function fileCk(f){
    		if(f.fileCheck.value!="yes") {
    			alert("파일을 업로드해주세요.");
    			return false;
    		}
		}
	</script> -->
	</div>
	<c:import url="../inc/footer.jsp" />
</div>

</body>
</html>
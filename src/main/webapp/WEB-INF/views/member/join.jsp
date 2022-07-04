<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<div class="wrap">
	<c:import url="../inc/header.jsp" />
	<div id="contents" class="contents">
		<h2 class="tit">회원가입</h2>
		
<%-- 		<form:form action="${path1 }/member/insert.do" method="post" modelAttribute="joinMemberBean">
			<div class="form-group">
				<form:label path="uid">아이디</form:label>
				<div class="input-group">
					<form:input type="text" path="uid" class="form-control" onkeypress="resetExistMember()"/>
					<div class="input-group-append">
						<button type="button" class="btn btn-primary" onclick="checkExistMember()">중복확인</button>
					</div>
				</div>
				<form:errors path="uid" class="color:red; font-size:12px" />
			</div>
			<div class="form-group">
				<form:label path="upw">비밀번호</form:label>
				<form:input type="password" path="upw" class="form-control" />
				<form:errors path="upw" class="color:red; font-size:12px" />
			</div>
			<div class="form-group">
				<form:label path="pwd2">비밀번호 확인</form:label>
				<form:input type="password" path="pwd2" class="form-control" />
				<form:errors path="pwd2" class="color:red; font-size:12px" />
			</div>
			<div class="form-group">
				<form:label path="uname">이름</form:label>
				<form:input type="text" path="uname" class="form-control" />
				<form:errors path="uname" class="color:red; font-size:12px" />
			</div>
			<div class="form-group">
				<label for="birth">생년월일</label>
				<input type="date" name="birth" id="birth" class="form-control" />
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label>label>
				<input type="tel" name="tel" id="tel" class="form-control" />
			</div>
			<div class="form-group">
				<label for="email">이메일</label>
				<input type="email" name="email" id="email" class="form-control" />
			</div>
			<div class="form-group">
				<div class="text-right">
					<button type="submit" class="btn btn-primary">회원가입</button>
					<button type="reset" class="btn btn-primary">취소</button>
				</div>
			</div>
		</form:form> --%>
		<form action="${path1 }/member/insert.do" method="post" name="joinform" onsubmit="return joinCheck(this)" >
			<table>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
						<c:if test="${empty id }">
						<input type="text" name="uid" id="uid" required />
						</c:if>
						<c:if test="${!empty id }">
						<input type="text" name="uid" id="uid" value="${id }" placeholder="아이디를 입력하세요." />
						</c:if>
						<input type="button" value="중복확인" onclick="idCheck()"/>
						<input type="hidden" name="id" />
						<c:if test="${!empty ck }">
						<input type="hidden" name="ck" value="${ck }" />	
						</c:if>
						<c:if test="${empty ck }">
						<input type="hidden" name="ck" value="" />
						</c:if>
						<c:if test="${!empty msg }">
						<input type="hidden" name="msg" value="${msg }" />
						</c:if>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="upw" id="upw" required/></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="upw2" id="upw2" required/></td>
					</tr>
					<tr>
					 	<th>이름</th>
						<td><input type="text" name="uname" required /></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" name="birth"  /></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="tel" name="tel" required/></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="email" required/></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="가입">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<script>
			function idCheck() {
				var id = document.joinform.uid.value;
				if(id!=""){
					location.href="${path1}/member/idCheck.do?uid="+id;
				}
			}
			
			function joinCheck(f) {
				if(f.upw.value!=f.upw2.value){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
				if(f.ck.value!="yes"){
					alert("아이디 중복확인이 필요합니다.");
					return false;
				}
			}
			
		</script>
		<script>
			if("${msg}"!=""){
    			alert("${msg}");
    			return false;
    		}
		</script>
	</div>
	<c:import url="../inc/footer.jsp" />
</div>
</body>
</html>
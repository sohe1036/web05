<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 입력 폼</title>
</head>
<body>
<h2>사용자 입력</h2>
<form:form modelAttribute="user" action="ok.do" method="post">
	<table>
		<tr>
			<th><form:label path="id">아이디</form:label></th>
			<td>
				<form:input path="id" size="20"/><br>
				<form:errors cssStyle="color:deeppink; font-size:14px" path="id" />
			</td>
		</tr>
		<tr>
			<th><form:label path="name">이름</form:label></th>
			<td>
				<form:input path="name" size="20"/><br>
				<form:errors cssStyle="color:deeppink; font-size:14px" path="name" />
			</td>
		</tr>
		<tr>
			<th><form:label path="email">이메일</form:label></th>
			<td>
				<form:input path="email" size="20"/><br>
				<form:errors cssStyle="color:deeppink; font-size:14px" path="email" />
			</td>
		</tr>
		<tr>
			<th><form:label path="address.address1">주소1</form:label></th>
			<td>
				<form:input path="address.address1" size="20"/><br>
				<form:errors cssStyle="color:deeppink; font-size:14px" path="address.address1" />
			</td>
		</tr>
		<tr>
			<td><form:label path="address.address2">주소2</form:label></td>
            <td>
                <form:input path="address.address2" size="20"/><br>
                <form:errors cssStyle="color:deeppink; font-size:14px" path="address.address2" />
            </td>
		</tr>
		<tr>
			<th><form:label path="job">직업</form:label></th>
			<td>
				<form:select path="job">
					<option value="">====선택====</option>
					<form:options items="${jobCodes }" itemLabel="label" itemValue="code" />
				</form:select>
				<form:errors cssStyle="color:deeppink; font-size:14px" path="job" />
			</td>
		</tr>
		<tr>
			<th><form:label path="hobbys">취미</form:label></th>
			<td>
				<form:checkboxes items="${hobbyNames}" path="hobbys" />
				<form:errors cssStyle="color:deeppink; font-size:14px" path="hobbys" />
			</td>
		</tr>
		<tr>
			<th><form:label path="hobbys">성별</form:label></th>
			<td>
				<form:radiobuttons items="${gender }" path="gender" />
				<form:errors cssStyle="color:deeppink; font-size:14px" path="gender" />
			</td>
		</tr>
		<tr>
			<th><form:label path="etc">하고 싶은 말</form:label></th>
			<td>
				<form:textarea path="etc" cols="30" rows="5" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<form:checkbox path="contractAgreement" cols="30" rows="5" />약관에 동의
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록" />
			</td>
		</tr>		
	</table>
</form:form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 등록 실습</title>
</head>
<body>
	<div>
 		<form action ="databankInsert.do" method = "post" enctype="multipart/form-data">
 			<label for="title">제목</label>
 			<input type="text" name="title" id="title"/>
 			<label for="file2">파일 업로드</label>
 			<input type="file" name="fileurl" id="file2"/>
 			<label for="author">작성자</label>
 			<input type="text" name="author" id="author"/>
 			<br>
 			<hr>
 			<br>
 			<input type="submit" name="submitBtn" value ="파일 업로드">
 		</form>
 	</div>
</body>
</html>
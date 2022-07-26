<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여러개 파일 업로드 실습</title>
</head>
<body>
	<div>
 		<form action ="multiFileUpload.do" method="post" enctype="multipart/form-data">
 			<label for="file1">파일 업로드 1</label>
 			<input type="file" name="files" id="file1"/>
 			<label for="file2">파일 업로드 2</label>
 			<input type="file" name="files" id="file2"/>
 			<label for="file3">파일 업로드 3</label>
 			<input type="file" name="files" id="file3"/>
 			<br>
 			<hr>
 			<br>
 			<input type="submit" name="submitBtn" value ="파일 업로드">
 		</form>
 	</div>
</body>
</html>
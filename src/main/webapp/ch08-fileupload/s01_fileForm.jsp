<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<!-- 파일 전송은 post 방식으로 해야함 get 방식으로 하면 경로를 불러오게 됨 -->
	<form action="/servletJsp/fileUpload" method="post" enctype="multipart/form-data">
		작성자 <input type="text" name="user"><br>
		제목 <input type="text" name="title"><br>
		파일명 <input type="file" name="uploadFile"><br>
		<input type="submit" value="파일 올리기">
	</form>
</body>
</html>
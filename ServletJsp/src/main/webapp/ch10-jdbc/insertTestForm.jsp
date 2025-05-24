<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 등록</title>
</head>
<body>
<div class="page-main">
	<h2>성적 등록</h2>
	<form id="myForm" action="insertTest.jsp" method="post">
		<ul>
			<li>
				<label for="id">ID</label>
				<input type="text" name="id" id="id" size="20" maxlength="10">
			</li>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" size="20" maxlength="10">
			</li>
			<li>
				<label for="korean">국어</label>
				<input type="number" name="korean" id="korean" min="0" max="100">
			</li>
			<li>
				<label for="english">영어</label>
				<input type="number" name="english" id="english" min="0" max="100">
			</li>
			<li>
				<label for="math">수학</label>
				<input type="number" name="math" id="math" min="0" max="100">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
	</form>
</div>
</body>
</html>
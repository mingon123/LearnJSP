<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL</title>
</head>
<body>
<!-- request.getParameter 대신 사용 -->
<form action="s02_elTest.jsp" method="post">
	이름 : <input type="text" name="name"><br>
	<input type="submit" value="확인">
</form>
<br>
이름은 <%= request.getParameter("name") %><br>
이름은 ${param.name}<br><!-- 이거 사용하면 됨 -->
이름은 ${param["name"]}
<!-- 값이 없을 때 EL의 param은 값을 비어있게 출력하는데, request.getParameter는 null이기 때문에 실수할 일이 없음 -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼</title>
</head>
<body>
<h1>폼에 데이터 입력</h1>
<form action="s04_viewParameter.jsp" method="get">
	이름 : <input type="text" name="name" size="10"><br>				<%-- 값을 입력하지 않으면 name="" address=""를 전달 (빈문자열 형태로 전달됨)때문에 null이 아닌 ""가 출력--%>
	주소 : <input type="text" name="address" size="30"><br>
	좋아하는 동물 : 
	<input type="checkbox" name="pet" value="dog">강아지				<%-- 값을 선택하지 않으면 값을 전달하지 않음 --%>
	<input type="checkbox" name="pet" value="cat">고양이
	<input type="checkbox" name="pet" value="pig">돼지
	<br>
	<input type="submit" value="전송">
</form>
</body>
</html>
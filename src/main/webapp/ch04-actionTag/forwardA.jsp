<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardA.jsp</title>
</head>
<body>
forwardA.jsp 페이지. 보여지지 않습니다.
</body>
</html>
<jsp:forward page="forwardB.jsp">
	<jsp:param value="오렌지" name="color"/>
</jsp:forward>
<%-- <jsp:forward> 같은 웹서버, 같은 웹 애플리케이션 디렉토리에 속하는 웹 자원만 호출 가능, request 내장 객체를 통해 데이터를 전달  --%>
<%-- MVC패턴에서 사용, 내용은 forwardB의 내용이 나오지만 주소는 바뀌지않음 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 속성 지정</title>
</head>
<body>
<%
	String name = "id";
	String value = "sky";
	// application 영역의 데이터 저장
	application.setAttribute(name,value);
%>
application 기본 객체의 속성 설정 : 
<%= name %> = <%= value %>

<%-- 서버를 끄지 않는 이상 클라이언트와 상관없이 계속 공유 가능 --%>
<%-- 일반데이터는 session 까지만 사용, 클라이언트마다 공유될 수 있기 때문 --%>
<%-- 환경설정은 application --%>
</body>
</html>
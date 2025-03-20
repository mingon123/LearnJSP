<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4개 기본객체와 영역</title>
</head>
<body>
<%
						   // 속성명  속성값
	pageContext.setAttribute("msg1","봄");
	request.setAttribute("msg2","여름");
	session.setAttribute("msg3","가을");
%>

page 영역의 msg1 = <%= pageContext.getAttribute("msg1") %><br><%-- 다른 페이지에서 호출(공유)안됨 --%>
request 영역의 msg2 = <%= request.getAttribute("msg2") %><br><%-- 다른 페이지에서 호출(공유)안됨 / page영역보다 request가 (action태그에서) 영역이 더 확장됨 --%>
session 영역의 msg3 = <%= session.getAttribute("msg3") %><br><%-- 다른 페이지에서 호출(공유)됨 (같은 클라이언트인 경우에만) - 브라우저가 전부꺼지고 s14먼저 실행하면 공유안됨 (클라이언트를 식별하기 위해 사용됨) --%>
<%-- page < request < session < application --%>
</body>
</html>
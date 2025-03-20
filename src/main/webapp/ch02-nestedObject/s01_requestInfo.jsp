<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title><%-- 꼭 암기 --%>
</head>
<body>
클라이언트IP = <%= request.getRemoteAddr() %><br><%-- localhost -> 192.168.0.128로 변경하면 내 IP 확인 가능 --%>
요청정보 프로토콜 = <%= request.getProtocol() %><br>
요청정보 전송방식 = <%= request.getMethod() %><br>
요청 URL(Uniform Resource Locator) = <%= request.getRequestURL() %><br> <%-- 서버 밖에서 서버 안의 자원을 요청할 때 --%>
요청 URI(Uniform Resource Identifier) = <%= request.getRequestURI() %><br> <%-- 같은 서버 안에서 자원을 요청할 때 --%>
컨텍스트 경로 = <%= request.getContextPath() %><br> <%-- 컨텍스트 경로 + 서버패스 : URI --%>
서버패스 = <%= request.getServletPath() %><br>
쿼리 문자열 = <%= request.getQueryString() %> <%-- 경로 뒤에 ? 이후 값들 --%>
</body>
</html>
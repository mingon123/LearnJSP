<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>s09_responseA.jsp</title><%-- 여기서 실행 --%>
</head>
<body>
<%-- response : 웹 브라우저에 전송하는 응답 정보 설정 --%>
<%-- 리다이렉트 : 다른페이지로 연결, 생성은하고 전송은 안됨(html안의 값들이 전부 없어도 됨) --%>
현재 페이지는 s09_responseA.jsp입니다. 화면에 보여지지 않습니다.
</body>
</html>
<%
	response.sendRedirect("s10_responseB.jsp");
%>
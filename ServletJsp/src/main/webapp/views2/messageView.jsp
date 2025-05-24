<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 패턴 연습</title>
</head>
<body>
결과 : <%= request.getAttribute("result") %><br> <%-- 스크립트릿,표현식 --%>
결과 : ${result} <%-- (권장) EL,jstl --%>

</body>
</html>
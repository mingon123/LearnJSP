<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 태그</title>
</head>
<body>
<!-- 사용자가 입력하는 경우는 태그를 막음 -->
<%-- escapeXml="true"이면 html 태그 불인정(기본값) --%>
<c:out value="<h1>오늘은 월요일!</h1>"/>
<br>
<%-- escapeXml="false"이면 html 태그 인정 --%>
<c:out value="<h1>내일은 화요일!</h1>" escapeXml="false"/>
</body>
</html>
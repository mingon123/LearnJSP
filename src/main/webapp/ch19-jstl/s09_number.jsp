<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formatNumber 태그</title>
</head>
<body>
<!-- 패턴 주는 데 가장 많이 사용, 자바에서 처리하고 값만 출력하는게 베스트 -->
숫자 : <fmt:formatNumber value="100000" type="number"/><br>
<!-- 엣지 : 소수점 둘째자리까지 보여짐. 크롬 : 소수점 표시 없음(정수만) -->
통화 : <fmt:formatNumber value="100000" type="currency" currencySymbol="$"/><br>
통화 : <fmt:formatNumber value="100000" type="currency" currencySymbol="\\"/><br>
퍼센트 : <fmt:formatNumber value="0.3" type="percent"/><br>
패턴 : <fmt:formatNumber value="12567.346" pattern="00,000,000.00"/><!-- 6 이상 올림, 5이하 버림 -->
</body>
</html>
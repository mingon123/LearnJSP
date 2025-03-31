<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if 태그</title>
</head>
<body>
<%-- if,forEach는 필수(중요) --%>
<c:if test="true">
무조건 수행<br>
</c:if>

<c:if test="${param.name == 'dragon'}"><!-- EL은 equals 사용하지 않고 ==를 사용. 상위 버전은 equals 사용 가능, ''허용 -->
name 파라미터의 값이 ${param.name}입니다.<br>
</c:if>
<!-- 주소에서 ?name=dragon 을 추가해서 값을 확인 -->

<c:if test="${param.name.equals('dragon')}">
name 파라미터의 값이 ${param.name}입니다.<br>
</c:if>

<!-- 주소 뒤에 ?age=30 추가 -->
<c:if test="${param.age >= 20}">
당신의 나이는 20세 이상입니다.
</c:if>

</body>
</html>
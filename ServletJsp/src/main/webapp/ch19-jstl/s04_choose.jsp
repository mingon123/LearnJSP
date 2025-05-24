<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choose 태그</title>
</head>
<body>
<%-- 다중 조건 체크면 choose when otherwise 을 사용, if문은 else문이 없기 때문, 일반적으로는 거의 안씀 --%>
<c:choose>
	<c:when test="${param.name == 'dragon' && param.age >= 20}">
		당신의 이름은 ${param.name}이고 20세 이상입니다.
	</c:when>
	<c:when test="${param.name == 'dragon'}">
		당신의 이름은 ${param.name}입니다.
	</c:when>
	<c:when test="${param.age >= 20}">
		당신은 20세 이상입니다.
	</c:when>
	<c:otherwise>
		당신은 dragon이 아니고 20세 이상이 아닙니다.
	</c:otherwise>
</c:choose>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catch 태그</title>
</head>
<body>
<!-- 예외 발생할 것 같은 부분을 catch문에 넣고 페이지 자체를 Exception을 보내도 되고, 문제가 발생한 부분만 출력하던지 선택 -->
<c:catch var="ex">
	name 파라미터의 값 = <%= request.getParameter("name") %><br>
	<%
		if(request.getParameter("name").equals("test")){ // 일부로 nullPointException 발생하도록 함
	%>
			${param.name}은 test입니다. <!-- ?name=test로 하면 이거 출력 -->
	<%
		}
	%>
</c:catch>
<p>
<c:if test="${ex != null}">
	예외가 발생했습니다.<br>
	${ex}
</c:if>


</body>
</html>
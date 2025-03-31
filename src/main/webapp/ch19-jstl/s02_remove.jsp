<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="str" value="바다"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remove 태그</title>
</head>
<body>
<%-- 일반적으로 많이 사용하지 않음, 해당 페이지에서 명시적으로 삭제할 일이 있을때면 사용 --%>
데이터 삭제 전 : ${str}<br>
-------------------<br>
<c:remove var="str"/>
데이터 삭제 후 : ${str}
</body>
</html>
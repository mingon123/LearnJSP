<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>autoFlush 속성값 true 예제</title>
</head>
<body>
<%-- 기본이 true이고 buffer크기를 변경해서 사용한다고 하지 않는다면 절대 사용할 일 없음 --%>
<% for(int i=0;i<1000;i++){ %>
1234
<% } %>
</body>
</html>
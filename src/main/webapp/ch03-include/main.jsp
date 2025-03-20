<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jspf" %><%-- 경로가 똑같기 때문에 경로만 입력 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 디렉티브</title>
</head>
<body>
이미지 경로 : <%= img_path %><br>
파일 경로 : <%= file_path %>
</body>
</html>
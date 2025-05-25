<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 상세 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h2>${vo.title}</h2>
	<ul>
		<li>뉴스번호 : ${vo.num}</li>
		<li>작성자 : ${vo.writer}</li>
		<li>이메일 : ${vo.email}</li>
		<li>등록일 : ${vo.reg_date}</li>
	</ul>
	<hr size="1" noshade="noshade" width="100%">
	<c:if test="${!empty vo.filename}">
		<div class="align-center">
			<img src="${pageContext.request.contextPath}/upload/${vo.filename}" style="max-width:500px">
		</div>
	</c:if>
	<p>
		${vo.article}
	</p>
	<hr size="1" noshade="noshade" width="100%">
	<div class="align-right">
		<input type="button" value="수정" onclick="location.href='modifyForm.do?num=${vo.num}'">
		<input type="button" value="삭제" onclick="location.href='deleteForm.do?num=${vo.num}'">	
		<input type="button" value="목록" onclick="location.href='list.do'">	
	</div>
</div>
</body>
</html>
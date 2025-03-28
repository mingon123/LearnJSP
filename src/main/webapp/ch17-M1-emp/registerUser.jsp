<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<jsp:useBean id="vo" class="kr.employee.vo.EmployeeVO"/>
<jsp:setProperty property="*" name="vo"/>
<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	dao.insertEmployee(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>사원등록 완료</h1>
	<div class="result-display">
		<div class="align-center">
			사원등록 성공!<p>
			<button onclick="location.href='main.jsp'">홈으로</button>
		</div>
	</div>
</div>
</body>
</html>
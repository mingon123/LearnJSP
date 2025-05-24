<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	Long user_num = (Long)session.getAttribute("user_num");
	if(user_num==null){
		response.sendRedirect("loginForm.jsp");
	}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 상세 정보</title>
</head>
<body>
<% 
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO vo = dao.getEmployee(user_num);
%>
<div class="page-main">
	<h1>사원정보</h1>
	<ul>
		<li>아이디 : <%= vo.getId() %></li>
		<li>이름 : <%= vo.getName() %></li>
		<li>월급 : <%= String.format("%,d원", vo.getSalary()) %></li>
		<li>업무 : <%= vo.getJob() %></li>
		<li>입사일 : <%= vo.getReg_date() %></li>
	</ul>
	<hr size="1" width="100%" noshade="noshade">
	<div class="align-center">
		<input type="button" value="사원정보수정" onclick="location.href='modifyUserForm.jsp'">
		<input type="button" value="퇴사" onclick="location.href='deleteUserForm.jsp'">
		<input type="button" value="홈으로" onclick="location.href='main.jsp'">
	</div>
</div>
</body>
</html>
<% 
	}
%>
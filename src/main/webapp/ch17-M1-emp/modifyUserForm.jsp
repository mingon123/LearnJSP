<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.employee.vo.EmployeeVO"%>
<%@page import="kr.employee.dao.EmployeeDAO"%>
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
<title>사원정보수정</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<script type="text/javascript">
	window.onload=function(){
		const form = document.getElementById('modify_form');
		form.onsubmit = function(){
			const items = document.querySelectorAll('.input-check');
			for(let i=0;i<items.length;i++){
				if(items[i].value.trim()==''){
					const label = document.querySelector('label[for="'+items[i].id+'"]');
					alert(label.textContent + ' 입력 필수');
					items[i].value = '';
					items[i].focus();
					return false;
				}
			}
		};
	};
</script>
</head>
<body>
<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO vo = dao.getEmployee(user_num);
%>
<div class="page-main">
	<h1>사원정보수정</h1>
	<form action="modifyUser.jsp" method="post" id="modify_form">
		<ul>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" value="<%= vo.getName() %>" class="input-check" maxlength="30">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" class="input-check" maxlength="12">
			</li>
			<li>
				<label for="salary">급여</label>
				<input type="number" name="salary" id="salary" value="<%= vo.getSalary() %>" class="input-check" maxlength="8" min="0" max="99999999">
			</li>			
			<li>
				<label for="job">업무</label>
				<input type="text" name="job" id="job" value="<%= vo.getJob() %>" maxlength="30">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="홈으로" onclick="location.href='main.jsp'">
		</div>
	</form>
</div>
</body>
</html>
<%
	}
%>
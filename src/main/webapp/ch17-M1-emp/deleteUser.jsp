<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	String user_id = (String)session.getAttribute("user_id");
	if(user_id==null){
		response.sendRedirect("loginForm.jsp");	
	}else{
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		EmployeeDAO dao = EmployeeDAO.getInstance();
		EmployeeVO vo = dao.checkEmployee(id);
		boolean check = false;
		
		if(vo!= null && user_id.equals(id)){
			check = vo.isCheckedPassword(passwd);
		}
		if(check){ // 인증 성공
			// 회원정보 삭제
			dao.deleteEmployee(vo.getSnum());
			// 로그아웃
			session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보삭제</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>사원정보삭제 완료</h1>
	<div class="result-display">
		<div class="align-center">
			사원정보삭제가 완료되었습니다.<p>
			<button onclick="location.href='main.jsp'">홈으로</button>
		</div>
	</div>
</div>
</body>
</html>
<%
	}else{ // 인증 실패
%>
	<script>
		alert('아이디 또는 비밀번호가 불일치합니다.');
		history.go(-1);
	</script>
<%
		}
	}
%>
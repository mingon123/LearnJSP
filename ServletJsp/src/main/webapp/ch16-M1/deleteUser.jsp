<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.member.dao.MemberDAO" %>
<%@ page import="kr.member.vo.MemberVO" %>
<%
	String user_id = (String)session.getAttribute("user_id");
	if(user_id==null){ // 로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{ // 로그인 된 경우
		
		// 전송된 데이터 반환
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		// id, 비밀번호 일치 여부 체크
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO member = dao.checkMember(id);
		boolean check = false;
		
		if(member!= null && user_id.equals(id)){
			// 아이디가 등록되어 있고 로그인한 아이디와 일치할 경우 비밀번호 일치 여부 체크
			check = member.isCheckedPassword(passwd);
		}
		if(check){ // 인증 성공
			// 회원정보 삭제
			dao.deleteMember(member.getNum());
			// 로그아웃
			session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>회원탈퇴 완료</h1>
	<div class="result-display">
		<div class="align-center">
			회원탈퇴가 완료되었습니다.<p>
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
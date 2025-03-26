<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="kr.web.member.MemberVO"/>
<jsp:setProperty name="member" property="*"/><%-- request.getParameter의 이름(name)과 javaBean의 프로퍼티가 일치하면 알아서 데이터를 추가해줌 --%>
<%-- model1 방식에서만 지원하기 때문에 이후에는 사용 못함 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
아이디 : <jsp:getProperty property="id" name="member"/><br>
비밀번호 : <jsp:getProperty property="password" name="member"/><br>

이름 : <jsp:getProperty property="name" name="member"/><br>
이메일 : <jsp:getProperty property="email" name="member"/><br>
주소 : <jsp:getProperty property="address" name="member"/><br>

</body>
</html>